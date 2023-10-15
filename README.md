# Test external TRA API

	Ver 1.0.0


- #### TRA API
    
    > **GET** /v2/Rail/TRA/ODFare/{OriginStationID}/to/{DestinationStationID}
    
    > **GET** /v2/Rail/TRA/Station

    > **GET** /v2/Rail/TRA/GeneralTrainInfo/TrainNo/{TrainNo}

    GET part of response body for train ticket price
    ```
    {
        "TicketType": "成自",
        "Price": 393.0
    }
    ``` 

    GET part of response body for all train station information
    ```
	{
		"StationUID": "TRA-0900",
		"StationID": "0900",
		"StationName": {
		"Zh_tw": "基隆",
		"En": "Keelung"
		},
		"StationAddress": "1041基隆市中山區民治里1鄰中山一路16之 1號",
		"StationPhone": "02-24263743",
		"OperatorID": "TRA",
		"StationClass": "1",
		"UpdateTime": "2023-05-09T02:22:35+08:00",
		"VersionID": 592,
		"StationPosition": {
		"PositionLon": 121.73997,
		"PositionLat": 25.13411,
		"GeoHash": "wsqwfr82f"
		},
		"LocationCity": "基隆市",
		"LocationCityCode": "KEE",
		"LocationTown": "中山區",
		"LocationTownCode": "10017050"
	}
    ``` 

  GET part of response body for train information by train number
    ```
    [
      {
        "TrainNo": "1006",
        "Direction": 0,
        "StartingStationID": "5050",
        "StartingStationName": {
        "Zh_tw": "潮州",
        "En": "Chaozhou"
      },
    ]
    ``` 
