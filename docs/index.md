# Welcome to Paymentbus API documentation. 
We relize the issues our partners have faced during implementation as each country has specific information that is requested. This makes the integratino process slow. 
We are sharing these post request in the hope that partners can use this as a starting point for integration. 
With the pace of development and adding new payment methoda and currencies we have not been able to keep up with updating the swagger documentation. 

This site provides `POST` request examples for each of the supported currencies. 

## Basics 
All request made to the system need to be signed using `HmacSHA256` + tonce(epoch time) + SECRETKEY. This signature needs to be part of each request.  
Please see the old swagger doc hosted here.  
[https://api.payments.test.alphafortress.com/documents/api_v1](https://api.payments.test.alphafortress.com/documents/api_v1)

## Example post 
Below is a simpe bash script to get a list of banks from `INR`

```
#!/bin/bash
API_KEY=
API_SECRET=
URL=https://api.payments.test.alphafortress.com
URI=api/v1/banks
TONCE=$(date +%s)000
CURRENCY=inr 

REQUEST="api_token=$API_KEY&currency=$CURRENCY&tonce=$TONCE"
PAYLOAD="GET|/api/v1/banks|$REQUEST"

signature=$(echo -n $PAYLOAD | openssl dgst -sha256 -hmac $API_SECRET  | sed -e 's/^.* //')

curl -X GET "$URL/$URI?$REQUEST&signature=$signature"

```

## Example get exchnage rate 

```
https://api.payments.test.alphafortress.com/get_conversion_rate?destination_currency=inr&source_currency=usd&source_amount=1&api_token=$API_KEY&recipient_country=in`

```

## Plan diagram 

``` mermaid
graph LR
  A[Start] --> B{Error?};
  B -->|Yes| C[Hmm...];
  C --> D[Debug];
  D --> B;
  B ---->|No| E[Yay!];
```
