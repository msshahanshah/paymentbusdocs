# Request body 

Before you can post data you need to get the below data which is requied for crating the POST request. 

```
    account_code= Refer to the `getbanks` API end point 
    account_type= {Bank, Mobile, Wire} India only supports `Bank`
    api_token= This will be provided by Alpha after Onboarding and KYC verification 
    branch_name= The location of the branch 
    client_txn_id= Unique ID for identifying the transaction 
    deposit_number= Account number 
    destination_currency=inr
    ifsc= IFSC code of the bank branch. 
    name= Name of the account holder, this has to match the name on file with the bank
    recipient_address= Address of the receipient, this has to be match the address on file with the bank 
    recipient_city= City
    recipient_city_of_birth= The city of birth of the recipien
    recipient_country=IN (2 char ISO code for country)
    recipient_country_of_birth=IN (2 char ISO code for country)
    recipient_country_sub_division=District
    recipient_date_of_birth= date of birth in YYYY-MM-DD format 
    recipient_district=
    recipient_email=
    recipient_phone_number= please do not add `+` or country code, this has to be the mobile number only. 
    recipient_postal_code=
    recipient_street=
    recipient_town_name=
    sender_address=
    sender_city=
    sender_country= 2 Char ISO code 
    sender_country_of_birth=
    sender_date_of_birth=1980-09-19
    sender_email=
    sender_first_name=
    sender_gender= Male/Female 
    sender_id_number= This can be any Govt. issueed ID 
    sender_last_name=
    sender_mobile_phone_country=
    sender_mobile_phone_number=
    sender_street=
    sender_type= Individual/Business 
    sender_zipcode=
    source_amount= This is the amount in source currency that you want to send AF will convert the funds to local currency depending the current rate. 
    source_currency=usd Depending on your agreement this can change to local fiat currency. 
    tonce= This is the current epoch time. 
```  
  
Please keep in mind the order of these params as these are sorted alphabeically. 

```
  var urlencoded = encodeURI(requestdata);
  var hash = CryptoJS.HmacSHA256(
    "POST|/" + process.env.PAYMENT_BUS_URI + "|" + requestdata, YOURSECRETKEY
  );
```

The Your SECRET KEY will be provided after onbaording. 
Please see below sample code for POST method  
    
```  
  var config = {
    method: "post",
    url:
      `${process.env.PAYMENT_BUS_URL}` +
      "/" +
      `${process.env.PAYMENT_BUS_URI}` +
      "?" +
      urlencoded +
      "&signature=" +
      hash,
    headers: {
      "Content-Type": "application/json",
    },
  };
  axios(config)
    .then(function (response) {
      console.log(JSON.stringify(response.data));
      } catch (err) {
        console.log(err);
      }
    })
    .catch(function (error) {
    });
};
```