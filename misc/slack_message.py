#!/usr/bin/env python
import os, sys, yaml
from slacker import Slacker
from mcdp import logger
from compmake.jobs.storage import job_cache_exists, get_job_cache
from compmake.structures import Cache
from contracts.utils import indent
import socket
hostname = socket.gethostname()
# read token
where = '~/slack-token.txt'
where = os.path.expanduser(where)
with open(where) as f:
    token = f.read().strip()


channel = '#duckuments-bot'
slack = Slacker(token)

maintainers = """
<@U0DLXEWRL> (Andrea Censi)
<@U0MDRAY9X> (Jacopo Tani)
<@U0DMSBSBG> (Liam Paull)
<@U6RE1RBR9> (Andrea Daniele)
"""
#
# maintainers = """
# <@U0DLXEWRL> (Andrea Censi)
# """

response = slack.users.list()
users = response.body['members']
# for u in users:
#     # print(yaml.dump(u))
#     print('%s = %s' % (u['id'], u['profile']['real_name_normalized']))


from compmake.jobs.syntax.parsing import parse_job_list
from compmake.storage.filesystem import StorageFilesystem
from compmake.jobs.uptodate import CacheQueryDB
from compmake.context import Context

def go(path):
    db = StorageFilesystem(path, compress=True)
    args = ['failed']
    cq = CacheQueryDB(db)
    context = Context(db)
    if not list(db.keys()):
        msg = 'Compmake DB is empty'
        logger.error(msg)
    else:
        job_list = parse_job_list(args, context=context, cq=cq)
        s = ""
        if job_list:
            job_list = job_list[:2]
            s += 'Running on host: %s' % hostname
            s += "\nJob failed in path %s" % path
            for job_id in job_list:
                if job_cache_exists(job_id, db):
                    cache = get_job_cache(job_id, db)
                    status = Cache.state2desc[cache.state]

                    s += "\nFailure of job %s" % job_id

                    if cache.state in [Cache.FAILED, Cache.BLOCKED]:
                        why = str(cache.exception).strip()
                    else:
                        why = 'No why for job done.'
                    s += '\n' + "```\n"+why+"\n```"
                    s += '\n\n'
                else:
                    logger.warning('no cache for %s' % job_id)


            s += maintainers
            print(s)
            slack.chat.post_message(channel, s, link_names=1)

        else:
            s = 'Everything is fine'
            # slack.chat.post_message(channel, s)
            logger.info('No jobs found')

from collections import namedtuple
usage_ntuple = namedtuple('usage',  'total used free percent')

def disk_usage(path):
    """Return disk usage associated with path."""
    st = os.statvfs(path)
    free = (st.f_bavail * st.f_frsize)
    total = (st.f_blocks * st.f_frsize)
    used = (st.f_blocks - st.f_bfree) * st.f_frsize
    try:
        percent = ret = (float(used) / total) * 100
    except ZeroDivisionError:
        percent = 0
    # NB: the percentage is -5% than what shown by df due to
    # reserved blocks that we are currently not considering:
    # http://goo.gl/sWGbH
    return usage_ntuple(total, used, free, round(percent, 1))

import psutil

def check_good_size(min_free_gb=2):

    usage = psutil.disk_usage('/')
    in_gb = lambda x: x * 1.0 / (1024*1024*1024)
    free_gb = in_gb(usage.free)
    total_gb = in_gb(usage.total)


    s = 'free %.2f GB of %.2f GB' % (free_gb, total_gb)
    print(s)

    if free_gb < min_free_gb:
        msg = 'Disk space is low. This might stop compilation. \n\n' + s
        msg += '\n' + maintainers

        slack.chat.post_message(channel, msg, link_names=1)
    # space = disk_usage('.')
    # print space
    # space_GB = space / (1000*1000*1000.0)
    # print('Available : %s GB' % space_GB)

if __name__ == '__main__':

    check_good_size()
    paths = [
    'out/fall2017/pdf/compmake',
    'out/fall2017/prepare/compmake',
    'out/fall2017/split/compmake',
    'out/master/html/compmake',
    'out/master/pdf/compmake',
    'out/master/split/compmake'
    ]
    for p in paths:
        if os.path.exists(p):
            go(p)
# # Send a message to #general channel
