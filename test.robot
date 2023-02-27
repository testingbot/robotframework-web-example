*** Settings ***

Library  SeleniumLibrary
Library  TestingBot

Test Setup  Open test browser
Test Teardown  Close test browser

*** Test Cases ***

Simple Test
	Go to  https://www.google.com
	Page should contain  Google

*** Keywords ***

Open test browser
	Open browser  about:  firefox
	...  remote_url=https://${TB_KEY}:${TB_SECRET}@hub.testingbot.com/wd/hub
	...  desired_capabilities=browserName:${BROWSER},version:${VERSION},platform:${PLATFORM}

Close test browser
	...  Report TestingBot status
	...  ${SUITE_NAME} | ${TEST_NAME}
	...  ${TEST_STATUS}  ${CREDENTIALS}
	Close all browsers
