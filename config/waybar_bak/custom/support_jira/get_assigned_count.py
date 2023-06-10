#!/usr/bin/env python
# This script shows how to use the client in anonymous mode
# against jira.atlassian.com.
import re

from jira import JIRA
import os
from dotenv import load_dotenv

load_dotenv()

# By default, the client will connect to a Jira instance started from the Atlassian Plugin SDK
# (see https://developer.atlassian.com/display/DOCS/Installing+the+Atlassian+Plugin+SDK for details).

jira = JIRA(server="https://emil-reisser-weston.atlassian.net",basic_auth=(os.getenv('JIRA_USERNAME'), os.getenv('JIRA_PASSWORD')));
myself = jira.myself()
all_proj_issues_but_mine = jira.search_issues('project = "SCOR" AND status IN ("In Progress","Selected for Development") AND assignee = currentUser() ORDER BY created DESC')
active_issue = jira.search_issues('project = "SCOR" AND status IN ("In Progress") AND assignee = currentUser()   ORDER BY priority DESC');
text = "";
priority_class = "";
if(len(active_issue)>0):
    priority_class=str(active_issue[0].fields.priority)
    text = str(active_issue[0])

issue_ids = map(lambda x: str(x),all_proj_issues_but_mine);
tooltip = " ".join(issue_ids);
output = '{"class":"'+priority_class+'","text":"'+text+'  ('+str(len(all_proj_issues_but_mine))+')","tooltip":"'+tooltip+'"}';
print(output);
