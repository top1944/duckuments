#!/usr/bin/env python
import os, sys
from slacker import Slacker
from mcdp import logger
from compmake.jobs.storage import job_cache_exists, get_job_cache
from compmake.structures import Cache
from contracts.utils import indent
# read token
where = '~/slack-token.txt'
where = os.path.expanduser(where)
with open(where) as f:
    token = f.read().strip()


slack = Slacker(token)


from compmake.jobs.syntax.parsing import parse_job_list
from compmake.storage.filesystem import StorageFilesystem
from compmake.jobs.uptodate import CacheQueryDB
from compmake.context import Context

def go(path):

    db = StorageFilesystem(path, compress=True)
    args = ['done']
    cq= CacheQueryDB(db)
    context = Context(db)
    if not list(db.keys()):
        msg = 'Compmake DB is empty'
        logger.error(msg)
    else:
        job_list = parse_job_list(args, context=context, cq=cq)

        if job_list:
            job_list = job_list[:2]
            s = "Job failed in path %s" % path
            for job_id in job_list:
                if job_cache_exists(job_id, db):
                    cache = get_job_cache(job_id, db)
                    status = Cache.state2desc[cache.state]

                    s += "\nFailure of job %s" % job_id

                    if cache.state in [Cache.FAILED, Cache.BLOCKED]:

                        why = str(cache.exception).strip()
                    else:
                        why = 'No why for job done.'
                    s += '\n' + indent(why, '| ')
                    s += '\n\n'
                else:
                    logger.warning('no cache for %s' % job_id)

            print(s)
            channel = '#duckuments-bot'

            slack.chat.post_message(channel, s)

        else:
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
