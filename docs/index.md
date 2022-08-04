# Welcome to Paymentbus API documentation. 

This site provides `POST` request examples for each of the supported currencies. 

## Basics 
All request made to the system need to be signed using `HmacSHA256` + tonce(epoch time) + SECRETKEY. This signature needs to be part of each request. 
