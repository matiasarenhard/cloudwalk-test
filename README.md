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
  sudo docker-compose run web bundle install
  sudo docker-compose run web rails db:create db:migrate db:seed
  sudo docker-compose up
```
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/c797ff94-fb20-4bc5-860f-077ba9e36f57)


<b>db:seed</b> will generate a token, put this value in <b>Authorization</b> header for make request. 
example post to <b>http://localhost:3000/api/v1/transactions</b>: 
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/7cabdaf7-bec5-40f8-bf1c-49f081d177eb)


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
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/f9698bf2-41eb-4818-a437-89a818118b31)


<b>Tests (rspec)</b>: <br>
```
sudo docker-compose run web rspec
```
![image](https://github.com/matiasarenhard/cloudwalk-test/assets/14844393/ba14a562-f01e-40a8-9556-d329738d23bf)



<b>Roadmap to next implementations</b>: <br>
```
 * Use OAuth token
 * Cancancan
 * Improve covarage
 * Create table Address, device
```



