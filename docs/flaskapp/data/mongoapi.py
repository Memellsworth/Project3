## delays
import requests
import json
url = "https://us-east-1.aws.data.mongodb-api.com/app/data-qbahe/endpoint/data/v1/action/findOne"

payload = json.dumps({
    "collection": "texasdelays",
    "database": "2022flight",
    "dataSource": "delay2022r0",
    "projection": {
        "_id": 1
    }
})
headers = {
  'Content-Type': 'application/json',
  'Access-Control-Request-Headers': '*',
  'api-key': '<API_KEY>',
  'Accept': 'application/ejson'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
## ---------

## airports
import requests
import json
url = "https://us-east-1.aws.data.mongodb-api.com/app/data-humkw/endpoint/data/v1/action/findOne"

payload = json.dumps({
    "collection": "us_airports",
    "database": "maindb",
    "dataSource": "FlightDelay0",
    "projection": {
        "_id": 1
    }
})
headers = {
  'Content-Type': 'application/json',
  'Access-Control-Request-Headers': '*',
  'api-key': 'Bszu66RuPai06pjS5dehiObQNQCqcH80jiBKqy91lVmijlcwCRNqAP4uBL52XOnR',
}

response = requests.request("POST", url, headers=headers, data=payload)

# Save the response as a JSON file
json_data = response.json()

with open('response.json', 'w') as file:
    json.dump(json_data, file)

