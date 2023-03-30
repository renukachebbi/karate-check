Feature: sample karate test script for kyc
for help, see: https://github.com/intuit/karate/wiki/IDE-Support

Background:
    * header Accept = 'application/json'
    * header x-user-id = '91ee376b-d509-45f9-939f-48bcec9d1c27'
    * header x-product-id = 'YUBIFIN'
    * header deviceId = '123'
    * header yubi_user_id = 'bcfce898-bd1b-46f1-a088-c5b6764dbd29'
    
Scenario: get kyc status
  Given url 'https://retail-qa-api.myyubi.com/bff/api/v1/kyc/status'
  When method get
  Then status 200
  And print response
