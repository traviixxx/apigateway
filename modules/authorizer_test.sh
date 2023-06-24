#!/bin/bash
set -eux
#assign credentials to variables
CLIENT_ID=4somknb77kjs3bhub108qm05r7
USER_POOL_ID=ap-northeast-1_BbYcmFmd9
USERNAME=madman
PASSWORD=ACB0**k12
URL=https://ua4uo081m4.execute-api.ap-northeast-1.amazonaws.com/node/movies

  
#authenticate and get token
TOKEN=$(
    aws cognito-idp initiate-auth \
 --client-id ${CLIENT_ID} \
 --auth-flow USER_PASSWORD_AUTH \
 --auth-parameters USERNAME=${USERNAME},PASSWORD=${PASSWORD} \
 --query 'AuthenticationResult.IdToken' \
 --output text 
    )
#make API call:
curl -H "Authorization: ${TOKEN}" ${URL} | jq

