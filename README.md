## cloudwalk-test

### Answers
https://github.com/matiasarenhard/cloudwalk-test/blob/main/Answers.txt

<b>Stack</b>:

```
  Ruby: 3.2.2
  Rails: 7.0.8
  Docker 24.0.5
  Docker-Compose 1.29.2
  PostgreSQL
```


<b>Build Instructions Ubuntu (22.04)</b>: <br>
Needs `docker` and `docker-compose` to build the project

```

  sudo docker-compose build
  sudo docker-compose run web rails db:create db:migrate db:seed
  sudo docker-compose up
```
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/bb125d80-4de2-4d88-b2ad-aa1705d08445)

<b>db:seed</b> will generate a token, put this value in <b>Authorization</b> header for make request. 
example post to <b>http://localhost:3000/api/v1/transactions</b>: 
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/b08bd1a8-c09f-46a6-bb7c-88aa60a5ab40)

Example of body
```
{
"transaction_id" : 2342357,
"merchant_id" : 29744,
"user_id" : 97205241,
"card_number" : "434525******7116",
"transaction_date" : "2019-09-31T10:17:56.812632",
"transaction_amount" : 375,
"device_id" : 285475
}
```

Example of deny request: 
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/bc08b093-afee-40ea-af0e-ac846681ef8f)

<b>Tests (rspec)</b>: <br>
```
sudo docker-compose run web rspec
```
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/a5a4fd42-ae9b-4594-a53b-c30595459956)


<b>Roadmap to next implementations</b>: <br>
```
 * use OAuth token
 * cancancan
```



