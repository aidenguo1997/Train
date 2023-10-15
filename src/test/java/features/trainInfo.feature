Feature: Get train information.

  Scenario: Get TDX token and get train information by train number.
    * def testVersion = 0

    Given url "https://tdx.transportdata.tw/auth/realms/TDXConnect/protocol/openid-connect/token/"
    And   header Content-Type = 'application/x-www-form-urlencoded'
    And   form field grant_type = 'client_credentials'
    And   form field client_id = 'client_id'
    And   form field client_secret = 'client_secret'
    When  method post
    Then  status 200

    * def accessToken = response.access_token
    * def TrainNo = "1006"

    Given  url "https://ptx.transportdata.tw/MOTC/"
    And    path testVersion, "/Rail/TRA/GeneralTrainInfo/TrainNo", TrainNo
    And    params {%24top: '30', %24format: JSON}
    And    header User-Agent = 'Mozilla/5.0'
    And    header authorization = 'Bearer ' + accessToken
    When   method get
    Then   status 200
