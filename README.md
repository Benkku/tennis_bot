# tennisBot
Find tennis hour from booking systems. Currently supporting Tali hall, Helsinki, for the next day and even hour frame.

## install:
 
 Robot Framework: https://github.com/robotframework/robotframework/blob/master/INSTALL.rst
 
 And SeleniumLibrary:
 ```
 pip install --upgrade robotframework-seleniumlibrary
```
 
## use:

Fill time frame as even hours and day numbers which days to find:
```
${EARLIEST_START_HOUR}                   17
${LATEST_START_HOUR}                     21
@{DAY_NUMBER_LIST}                       6  7  8
```
Run:
```
robot -L trace .
```
The bot crawls until an hour is found and PASS status is shown, or FAIL until timeout.

Other parameters you can tune:

POLL_INTERVAL = 30 s

LOOP_UNTIL = 99999999

TIME_OUT = 1 hour
