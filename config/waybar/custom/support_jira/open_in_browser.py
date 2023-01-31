#!/usr/bin/env python
# This script shows how to use the client in anonymous mode
# against jira.atlassian.com.
import re
import sys
from jira import JIRA
import webbrowser
import urllib.parse
import os
from dotenv import load_dotenv

load_dotenv()

# By default, the client will connect to a Jira instance started from the Atlassian Plugin SDK
# (see https://developer.atlassian.com/display/DOCS/Installing+the+Atlassian+Plugin+SDK for details).
link_type = sys.argv[1];
if(link_type=='active'):
    jira = JIRA(server="https://emil-reisser-weston.atlassian.net",basic_auth=(os.getenv('JIRA_USERNAME'),os.getenv('JIRA_PASSWORD')));
    myself = jira.myself()
    active_issue = jira.search_issues('project = "SCOR" AND status IN ("In Progress") AND assignee = currentUser()   ORDER BY priority DESC');
    if(len(active_issue)>0):
        webbrowser.open("https://emil-reisser-weston.atlassian.net/browse/"+str(active_issue[0]), new=0, autoraise=True)
else:
    url = "https://emil-reisser-weston.atlassian.net/jira/software/c/projects/SCOR/issues/?jql="+urllib.parse.quote('project = "SCOR" AND status IN ("In Progress","Selected for Development") AND assignee = currentUser() ORDER BY created DESC');
    webbrowser.open(url, new=0, autoraise=True)
