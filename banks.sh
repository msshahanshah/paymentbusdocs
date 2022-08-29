#!/bin/bash
API_KEY=
API_SECRET=
URL=https://api.payments.test.alphafortress.com
URI=api/v1/banks
TONCE=$(date +%s)000
CURRENCY=inr 

REQUEST="api_token=$API_KEY&currency=$CURRENCY&tonce=$TONCE"
PAYLOAD="GET|/$URI|$REQUEST"

signature=$(echo -n $PAYLOAD | openssl dgst -sha256 -hmac $API_SECRET  | sed -e 's/^.* //')

curl -X GET "$URL/$URI?$REQUEST&signature=$signature"
