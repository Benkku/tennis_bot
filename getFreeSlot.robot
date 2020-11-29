*** Settings ***
Resource    tali_resources.robot
Test Teardown  Close all browsers

*** Variables ***
${EARLIEST_START_HOUR}                   10
${LATEST_START_HOUR}                     21
@{DAY_NUMBER_LIST}                       1  6

${POLL_INTERVAL}                         30 s
${LOOP_UNTIL}                            99999999
${TIME_OUT}                              1 hour

*** Test Cases ***

Find Hour Tomorrow From Tali Indoor Courts
    [Timeout]    ${time_out}
    Register Keyword To Run On Failure    NONE
    Open browser    https://varaukset.talintenniskeskus.fi/booking/booking-calendar    headlesschrome
    FOR    ${i}    IN RANGE    ${loop_until}
        ${tali_found} =    Find Hour From Tali Tomorrow Between    ${EARLIEST_START_HOUR}    ${LATEST_START_HOUR}    ${DAY_NUMBER_LIST}
        Exit For Loop If    ${tali_found}
        Sleep    ${POLL_INTERVAL}
        Reload Page
    END
    Run Keyword Unless    ${tali_found}    Fail

