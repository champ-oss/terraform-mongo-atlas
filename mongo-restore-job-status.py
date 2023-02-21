#!/usr/bin/python

import os
import requests
import json
from requests.auth import HTTPDigestAuth
from retry import retry


# get restore job id and check restore status on finished_by time stamp.  retry logic added
@retry(delay=30, tries=30)
def getrestorejob(public, private, url, id, cluster_name, restore_job_id):
    status = None
    try:
        restore_url = url + "/groups/" + id + "/clusters/" +  cluster_name + "/backup/restoreJobs/" + restore_job_id
        response = requests.request("GET", restore_url, auth=HTTPDigestAuth(public, private))
        print(response)
        restore_status = json.loads(response.content)
        finished_by = restore_status['finishedAt']
        print(finished_by)
        if not finished_by:
            raise
    except Exception as error:
        print(error)
        raise

def main():
    base_url = "https://cloud.mongodb.com/api/atlas/v1.0"
    publickey = os.environ["MONGODB_ATLAS_PUBLIC_KEY"]
    privatekey = os.environ["MONGODB_ATLAS_PRIVATE_KEY"]
    group_id = os.environ["MONGODB_ATLAS_GROUP_ID"]
    cluster_name = os.environ["MONGODB_ATLAS_CLUSTER_NAME"]
    restore_job_id = os.environ["MONGODB_ATLAS_RESTORE_JOB_ID"]

    getrestorejob(publickey, privatekey, base_url, group_id, cluster_name, restore_job_id)

main()