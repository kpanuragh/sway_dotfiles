import http.client
import json
conn = http.client.HTTPSConnection("cubet.teamwork.com")

payload = ""

headers = {
    'cookie': "JSESSIONID=0DED5610596A7ABC3B1C20B1C9E97144.cfusion; tw-auth=tw-EFA4BCABAFBFEBF01A40476A909990B9-s2aObaxndbGT9VWked5LgSzpqY8fOV-247592; RDS=2; PROJLB=k1%7CY9pT%2F%7CY9pOn",
    'Authorization': "Basic dHdwX2dtM1M4c3YwMDdENUxsUWY4THVRd2lhUlBPVXg6YWFh"
    }

conn.request("GET", "/projects/367095/time/total.json?userId=247592&fromDate=20230201&toDate=20230228&fromTime=00%3A00&toTime=23%3A00", payload, headers)

res = conn.getresponse()
data = res.read()

data_json = json.loads(data.decode("utf-8"))
total_billable = data_json['projects'][0]['time-totals']['total-hours-sum']
output= '{"class":"teamwork","text":"'+total_billable+'","tooltip":"Teamwork Current Month Time"}'
print(output);
