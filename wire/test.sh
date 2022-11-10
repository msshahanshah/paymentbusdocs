#!/bin/bash
API_TOKEN=m4lNqoFLaviW19YJ5rLwQFuoHoUOx3mknyUB0Axe
API_SECRET=gruU3UyxrGfFtfOlnk7AMhUNO2qCHIxDNIqyxTGt
URL=https://api.payments.test.alphafortress.com
URI=api/v1/transactions_wiretransfer

ACCOUNT_TYPE=Wiretransfer-non-iban
BANK_CITY=delhi
BANK_COUNTRY=IN
BANK_NAME=RBL+Bank
BIC_SWIFT=RBL123123
CLIENT_TXN_ID=inr-test-n3
DEPOSIT_NUMBER=1223467891
DESTINATION_CURRENCY=usd
NAME=Business+Name
RECIPIENT_ADDRESS=21+high+street
RECIPIENT_CITY=Noida
RECIPIENT_COUNTRY=IN
RECIPIENT_EMAIL=reci@ex.com
RECIPIENT_PHONE_NUMBER=9876543211
RECIPIENT_POSTAL_CODE=123456
SOURCE_AMOUNT=1000
SOURCE_CURRENCY=usd
TONCE=$(date +%s)000



REQUEST="account_type=$ACCOUNT_TYPE&api_token=$API_TOKEN&bank_city=$BANK_CITY&bank_country=$BANK_COUNTRY&bank_name=$BANK_NAME&bic_swift=$BIC_SWIFT&client_txn_id=$CLIENT_TXN_ID_$RANDOM&deposit_number=$DEPOSIT_NUMBER&destination_currency=$DESTINATION_CURRENCY&name=$NAME&recipient_address=$RECIPIENT_ADDRESS&recipient_city=$RECIPIENT_CITY&recipient_country=$RECIPIENT_COUNTRY&recipient_email=$RECIPIENT_EMAIL&recipient_phone_number=$RECIPIENT_PHONE_NUMBER&recipient_postal_code=$RECIPIENT_POSTAL_CODE&source_amount=$SOURCE_AMOUNT&source_currency=$SOURCE_CURRENCY&tonce=$TONCE"

PAYLOAD="POST|/$URI|$REQUEST"

signature=$(echo -n $PAYLOAD | openssl dgst -sha256 -hmac $API_SECRET  | sed -e 's/^.* //')

echo "$URL/$URI?$REQUEST&signature=$signature"

curl -X POST "$URL/$URI?$REQUEST&signature=$signature"