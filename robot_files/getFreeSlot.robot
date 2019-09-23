*** Settings ***
Resource    tali_resources.robot
Test Teardown  Close all browsers

*** Variables ***

${POLL_INTERVAL}                         30 s
${POLL_LOOP_UNTIL}                       99999999
${TIME_OUT}                              1 hour

*** Test Cases ***

Find Hour Tomorrow From Tali Indoor Courts
    [Timeout]    ${time_out}
    Register Keyword To Run On Failure    NONE
  #  Open browser    https://varaukset.talintenniskeskus.fi/booking/booking-calendar    headlesschrome    remote_url=${SELENIUM_SERVER}
    Open browser    https://varaukset.talintenniskeskus.fi/booking/booking-calendar    ${BROWSER}    remote_url=${SELENIUM_SERVER}
    :FOR    ${i}    IN RANGE    ${POLL_LOOP_UNTIL}
    \    ${tali_found} =    Find Hour From Tali Tomorrow Between    ${EARLIEST_START_HOUR}    ${LATEST_START_HOUR}
    \    Exit For Loop If    ${tali_found}
    \    Sleep    ${POLL_INTERVAL}
    \    Reload Page
    Run Keyword Unless    ${tali_found}    Fail
