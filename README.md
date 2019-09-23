# tennisBot
Find tennis hour from booking systems. Currently supporting Tali hall, Helsinki, for the next day and even hour time frame.

## install:
 
 Robot Framework: https://github.com/robotframework/robotframework/blob/master/INSTALL.rst
 
 And SeleniumLibrary:
 ```
 pip install --upgrade robotframework-seleniumlibrary
```
 
## use:

Fill time frame as even hours: 
```
docker build -t robot-tennis-bot .
docker-compose -f docker_compose_tennis_bot.yml -p tennis_bot up -d chrome
docker-compose -f docker_compose_tennis_bot.yml -p tennis_bot run -e EARLIEST_START_HOUR=15 -e LATEST_START_HOUR=17 tennis-bot
docker-compose -f docker_compose_tennis_bot.yml -p tennis_bot down
```
The bot crawls until an hour is found and PASS status is shown, or FAIL until timeout.

Other parameters you can tune:

POLL_INTERVAL = 30 s

POLL_LOOP_UNTIL = 99999999

TIME_OUT = 1 hour
