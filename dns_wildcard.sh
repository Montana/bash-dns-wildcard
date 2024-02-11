#!/bin/bash

# Variables
api_token="YOUR_API_TOKEN_HERE"
domain_name="example.com"
record_type="A" # or CNAME, TXT, etc.
record_name="*.$domain_name"
record_value="IP_ADDRESS_OR_TARGET" # IP address for A record, hostname for CNAME, etc.
api_url="https://api.yourdnsprovider.com/dns/v1/domains/$domain_name/records"
ttl=3600 # Time to Live in seconds

# Headers and data for the API request
auth_header="Authorization: Bearer $api_token"
content_type="Content-Type: application/json"

# JSON payload
payload=$(cat <<EOF
{
  "type": "$record_type",
  "name": "$record_name",
  "data": "$record_value",
  "ttl": $ttl
}
EOF
)

# Make the API call to add the DNS record
response=$(curl -s -X POST "$api_url" \
  -H "$auth_header" \
  -H "$content_type" \
  -d "$payload")

# Output the response
echo "Response: $response"
