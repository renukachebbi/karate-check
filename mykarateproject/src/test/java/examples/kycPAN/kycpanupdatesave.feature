Feature: sample karate test script for kyc
for help, see: https://github.com/intuit/karate/wiki/IDE-Support

Background:
    * header Accept = 'application/json'
    * header category = 'ID'
    * header Device-Id = 'new-user'
    * header yubi-user-id = 'bcfce898-bd1b-46f1-a088-c5b6764dbd29'
    
Scenario: upload and save kyc
  Given url 'https://retail-qa-api.myyubi.com/kyc/api/v1/flow/kyc/YUBIFIN/documents'
  #provide info on location of the file,name of the file,content-type header value
  #*def fileLocation  = '../kycPAN/pancard.jpg'
  # And multipart file document = { read:'#(fileLocation)', filename:'pancard.jpg', Content-type:'multipart/form-data' }

  And multipart file document = { read:'pancard.jpg', filename:'pancard.jpg', Content-type:'multipart/form-data' }
  And multipart field category = 'ID'
  # And multipart text  = { category: 'ID' }
  When method post
  Then status 200
  And print response
  * def documentid = response.documentId
  * print 'document id is: ', documentid
  #And match response.message contains 'error'

  * def items =
    """
      {
        "category": "ID",
        "documentType": "PAN",
        "flowType": "DOCUMENT",
        "documents": [
            {
                "pageNumber": 0,
                "docId": '#(documentid)',
                "fileExtension": "jpg"
            }
        ]
    }
    """
     # items[0].documents.docId = documentid
  Given url 'https://retail-qa-api.myyubi.com/kyc/api/v1/flow/kyc/YUBIFIN/items'
  And request items
  And header yubi-user-id = 'bcfce898-bd1b-46f1-a088-c5b6764dbd29'
  And header Device-Id = 'new-user'
  When method post
  Then status 400
  And print response




  