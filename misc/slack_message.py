#!/usr/bin/env python
import os, sys
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


from compmake.jobs.syntax.parsing import parse_job_list
from compmake.storage.filesystem import StorageFilesystem
from compmake.jobs.uptodate import CacheQueryDB
from compmake.context import Context

def go(path):
    db = StorageFilesystem(path, compress=True)
    args = ['failed']
    cq= CacheQueryDB(db)
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

            s += '\n@censi'
            s += '\n@jacopo'
            s += '\n@paull'
            s += '\n@walter'
            s += '\n@daniele'
            print(s)
            slack.chat.post_message(channel, s, link_names=1)

        else:
            s = 'Everything is fine'
            # slack.chat.post_message(channel, s)
            logger.info('No jobs found')

if __name__ == '__main__':
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
