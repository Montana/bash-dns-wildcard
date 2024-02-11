#!/bin/bash

# secrets
api_token="$TOKEN_FARGATE"
domain_name="example"
record_type="CNAME"
record_name="*.$domain_name"
record_value="IP_ADDRESS_OR_TARGET" 
api_url="https://api.yourdnsprovider.com/dns/v1/domains/$domain_name/records"
ttl=3600 # ttyl in seconds 

# headers and data for the API request
auth_header="Authorization: Bearer $api_token"
content_type="Content-Type: application/json"

# jsonn payload
payload=$(cat <<EOF
{
  "type": "$record_type",
  "name": "$record_name",
  "data": "$record_value",
  "ttl": $ttl
}
EOF
)

# make the API call to add the DNS record
response=$(curl -s -X POST "$api_url" \
  -H "$auth_header" \
  -H "$content_type" \
  -d "$payload")

# output the response
echo "Response: $response"
