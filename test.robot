*** Settings ***

Library  SeleniumLibrary
Library  TestingBot
Library  BrowserOptions

Test Setup  Open test browser
Test Teardown  Close test browser

*** Test Cases ***

Simple Test
	Go to  https://www.google.com
	Page should contain  Google

*** Keywords ***

Open test browser
	${options}=    Get Browser Options    ${BROWSER}

    # Set capabilities
    Call Method    ${options}    set_capability    platformName    ${PLATFORM}
    Call Method    ${options}    set_capability    browserName    ${BROWSER}
    Call Method    ${options}    set_capability    browserVersion    ${VERSION}

    # Open browser with options
    Open Browser    remote_url=https://${TB_KEY}:${TB_SECRET}@hub.testingbot.com/wd/hub    options=${options}

Close test browser
	...  Report TestingBot status
	...  ${SUITE_NAME} | ${TEST_NAME}
	...  ${TEST_STATUS}  ${TB_KEY}:${TB_SECRET}
	Close all browsers
