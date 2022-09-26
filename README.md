# rails-class-registriong

## 버전

- Ruby on Rails: 7.0.4

- ruby: 3.1.2

## 실행방법

- 해당 프로젝트는 docker-compose를 이용하여 실행합니다.
  - command
  - ```shell
    docker-compose -f docker-compose.local.yml up
    ```

## API 목록

### 유저 생성 API

- url: http://localhost:3000/api/v1/users
- method: POST
- request body
  - ```json
    {
      "name": "염승민",
      "cellphone": "01096337416"
    }
    ```
- response body(status-201)
  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "id": "4bf504a4-173b-4848-b4ba-29c3ba2c5f9f",
        "name": "염승민",
        "cellphone": "01096337416"
      }
    }
    ```
- response body(status-400, 전화번호 중복)
  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "error": {
        "status": 400,
        "code": 40002,
        "message": "해당 유저는 존재합니다.",
        "context": "Users::IsExistError"
      }
    }
    ```

### 튜터 생성 API

- url: http://localhost:3000/api/v1/tutors
- method: POST
- request body

  - ```json
    {
      "name": "염승민",
      "cellphone": "01096337416"
    }
    ```

- response body(status-201)

  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "id": "4bf504a4-173b-4848-b4ba-29c3ba2c5f9f",
        "name": "염승민",
        "cellphone": "01096337416"
      }
    }
    ```

- response body(status-400, 전화번호 중복)

  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "error": {
        "status": 400,
        "code": 40003,
        "message": "해당 튜터는 존재합니다.",
        "context": "Users::IsExistError"
      }
    }
    ```

### 튜터의 수업 가능시간 생성 API

- url: http://localhost:3000/api/v1/tutors/:uid/available-time
- method: POST
- path_variable
  - uid: tutors table의 uid column
- request body
  - ```json
    {
      "availableTimes": [
        {
          "startTime": "2022-09-23T19:30+09:00",
          "endTime": "2022-09-23T23:00+09:00"
        },
        {
          "startTime": "2022-09-23T21:30+09:00",
          "endTime": "2022-09-24T01:00+09:00"
        }
      ]
    }
    ```
- response body(status-201)
  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "totalItems": 12,
        "size": 12,
        "items": [
          {
            "startTime": "2022-09-23T19:30:00.000+09:00",
            "active": "UNAVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T20:00:00.000+09:00",
            "active": "UNAVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T20:30:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T21:00:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T21:30:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T22:00:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T22:30:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T23:00:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-23T23:30:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-24T00:00:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-24T00:30:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          },
          {
            "startTime": "2022-09-24T01:00:00.000+09:00",
            "active": "AVAILABLE",
            "tutor": {
              "id": "dd147586-c778-451b-9c27-ff3b3180db5b",
              "name": "염승민",
              "cellphone": "01096337416"
            }
          }
        ]
      }
    }
    ```

### 유저 수강권 등록 API

- url: http://localhost:3000/api/v1/users/:uid/lessons
- method: POST
- path_variable
  - uid: users table의 uid column
- request body
  - ```json
    {
      "minute": 20, // 20 or 40
      "content": "수업내용"
    }
    ```
- response body(status-201)
  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "id": "413a747b-549e-46ea-808d-3fc77edf27b3",
        "minute": 20,
        "content": "수업내용",
        "user": {
          "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
          "name": "염승민",
          "cellphone": "01096337416"
        },
        "schedules": []
      }
    }
    ```

### 유저 수강권 조회 API

- url: http://localhost:3000/api/v1/users/:uid/lessons
- method: GET
- path_variable
  - uid: users table의 uid column
- response body(status-201)
  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "totalItems": 3,
        "size": 3,
        "items": [
          {
            "id": "b38569b3-0021-4683-899c-681f89bb4297",
            "minute": 20,
            "content": "수업내용",
            "user": {
              "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
              "name": "염승민",
              "cellphone": "01096337416"
            },
            "schedules": []
          },
          {
            "id": "a2d8e9d0-3443-431b-b0ba-2304ff8baeb3",
            "minute": 20,
            "content": "수업내용",
            "user": {
              "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
              "name": "염승민",
              "cellphone": "01096337416"
            },
            "schedules": []
          },
          {
            "id": "413a747b-549e-46ea-808d-3fc77edf27b3",
            "minute": 20,
            "content": "수업내용",
            "user": {
              "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
              "name": "염승민",
              "cellphone": "01096337416"
            },
            "schedules": []
          }
        ]
      }
    }
    ```

### 유저 수업 가능한 튜터 조회 API

- url: http://localhost:3000/api/v1/users/:uid/tutors
- method: GET
- path_variable
  - uid: users table의 uid column
- query string
  - startTime: 시작시간(형식: 'YYYY-MM-DDTHH:mm)
  - minute: 수업시간(20 or 40)
- response body(status-201)
  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "totalItems": 3,
        "size": 3,
        "items": [
          {
            "id": "b38569b3-0021-4683-899c-681f89bb4297",
            "minute": 20,
            "content": "수업내용",
            "user": {
              "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
              "name": "염승민",
              "cellphone": "01096337416"
            },
            "schedules": []
          },
          {
            "id": "a2d8e9d0-3443-431b-b0ba-2304ff8baeb3",
            "minute": 20,
            "content": "수업내용",
            "user": {
              "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
              "name": "염승민",
              "cellphone": "01096337416"
            },
            "schedules": []
          },
          {
            "id": "413a747b-549e-46ea-808d-3fc77edf27b3",
            "minute": 20,
            "content": "수업내용",
            "user": {
              "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
              "name": "염승민",
              "cellphone": "01096337416"
            },
            "schedules": []
          }
        ]
      }
    }
    ```

### 유저 수업 신청 API

- url: http://localhost:3000/api/v1/users/:uid/sign-up
- method: POST
- path_variable
  - uid: users table의 uid column
- request body
  - ```json
    {
      "tutor": {
        "id": "dd147586-c778-451b-9c27-ff3b3180db5b"
      },
      "lesson": {
        "id": "4641e887-38db-42c2-9a34-921f7c0b9c4a"
      },
      "startTime": "2022-09-23T19:30+09:00"
    }
    ```
- response body(status-200)

  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "id": "4641e887-38db-42c2-9a34-921f7c0b9c4a",
        "minute": 40,
        "content": "수업내용",
        "user": {
          "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
          "name": "염승민",
          "cellphone": "01096337416"
        },
        "schedules": [
          {
            "startTime": "2022-09-23T19:30:00.000+09:00",
            "active": "UNAVAILABLE"
          },
          {
            "startTime": "2022-09-23T20:00:00.000+09:00",
            "active": "UNAVAILABLE"
          }
        ]
      }
    }
    ```

### 튜터 예약된 수업 조회

- url: http://localhost:3000/api/v1/tutors/:uid/lessons
- method: GET
- path_variable
  - uid: tutors table의 uid column
- response body(status-200)
  - ```json
    {
      "apiVersion": "1.0",
      "txId": "",
      "data": {
        "totalItems": 1,
        "size": 1,
        "items": [
          {
            "id": "4641e887-38db-42c2-9a34-921f7c0b9c4a",
            "minute": 40,
            "content": "수업내용",
            "user": {
              "id": "2b6b1227-5fda-4d02-9bbe-b57e283280b2",
              "name": "염승민",
              "cellphone": "01096337416"
            },
            "schedules": [
              {
                "startTime": "2022-09-23T19:30:00.000+09:00",
                "active": "UNAVAILABLE"
              },
              {
                "startTime": "2022-09-23T20:00:00.000+09:00",
                "active": "UNAVAILABLE"
              }
            ]
          }
        ]
      }
    }
    ```
