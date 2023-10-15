Feature: Get three train ticket price.

  Scenario Outline: Get TDX token and get train ticket price.
    * def testVersion = 0

    Given url "https://tdx.transportdata.tw/auth/realms/TDXConnect/protocol/openid-connect/token/"
    And   header Content-Type = 'application/x-www-form-urlencoded'
    And   form field grant_type = 'client_credentials'
    And   form field client_id = 'client_id'
    And   form field client_secret = 'client_secret'
    When  method post
    Then  status 200

    * def accessToken = response.access_token
    * def OriginStationID = '<OriginStationID>'
    * def DestinationStationID = '<DestinationStationID>'

    Given  url "https://ptx.transportdata.tw/MOTC/"
    And    path testVersion, "/Rail/TRA/ODFare/", OriginStationID, "/to/", DestinationStationID
    And    params {%24top: '30', %24format: JSON}
    And    header User-Agent = 'Mozilla/5.0'
    And    header authorization = 'Bearer ' + accessToken
    When   method get
    Then   status 200

#    基隆:0900、汐止0960、南港0980、台北1000、中壢1100、花蓮:7000
    Examples:
      | OriginStationID |  DestinationStationID |
      | 0900            |  0960                 |
      | 0980            |  1100                 |
      | 1100            |  7000                 |
