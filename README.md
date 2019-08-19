<img src="https://s3.amazonaws.com/owler-image/logo/zenvia-mobile_owler_20170111_192135_original.png" height="200" />

# Mock for Zenvia API's

Full documentation about Zenvia API on [http://docs.zenviasms.apiary.io](http://docs.zenviasms.apiary.io) 

## How run? 
```bash
docker build -t zenvia/api-mock . 
docker run zenvia/api-mock -port 8080
```


## [Heroku](https://devcenter.heroku.com/articles/container-registry-and-runtime)

- heroku login
- heroku container:login
- heroku create zenvia-apis-mock
- heroku container:push web --app zenvia-apis-mock
- heroku open --app zenvia-apis-mock
- Health Check: [https://zenvia-apis-mock.herokuapp.com/](https://zenvia-apis-mock.herokuapp.com/)

## Mock rules

- Valid Credentials: user / pass
- Invalid Credentials: abc / 123
- When number phone 5551999999200 and all required fields sent then return HTTP Code Status OK(200) with a success payload.


### Call api-rest / send-sms with a valide request (http code status 200)
```bash
curl -v --user "user:pass" \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -X POST -d '{"sendSmsRequest": { "from": "Remetente", "to": "5551999999200", "schedule": "2017-08-09T14:00:00", "msg": "SMS Message", "callbackOption": "NONE", "id": "msg-id",  "aggregateId": "14828"}}' \
     http://zenvia-apis-mock.herokuapp.com/api-rest/services/send-sms
```

### Call api-rest / send-sms with a valide request and invalid credentials (http code status 401)
```bash
curl -v --user "abc:123" \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -X POST -d '{"sendSmsRequest": { "from": "Remetente", "to": "5551999999200", "schedule": "2017-08-09T14:00:00", "msg": "SMS Message", "callbackOption": "NONE", "id": "msg-id",  "aggregateId": "14828"}}' \
     http://zenvia-apis-mock.herokuapp.com/api-rest/services/send-sms
```


### Call api-rest / send-sms-multiple with a valide request (http code status 200)

```bash
curl -v --user "user:pass" \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -X POST -d '{ "sendSmsMultiRequest":{ "aggregateId": "14828", "sendSmsRequestList":[ { "from":"remetente", "to":"5551999999200", "msg": "SMS Message", "callbackOption":"NONE", "schedule": "2017-08-09T14:00:00", "id": "msg-id" }] }}' \ 
     http://zenvia-apis-mock.herokuapp.com/api-rest/services/send-sms-multiple
```

### Call api-rest / get-sms-status with a valide request (http code status 200)

```bash
curl -v --user "user:pass" \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -X GET \ 
     http://zenvia-apis-mock.herokuapp.com/api-rest/services/get-sms-status/0
```

### Call api-rest / cancel-sms with a valide request (http code status 200)

```bash
curl -v --user "user:pass" \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -X POST \ 
     http://zenvia-apis-mock.herokuapp.com/api-rest/services/cancel-sms/0
```
