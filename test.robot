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

    # Set custom TestingBot capabilities using tb:options
    ${tb_options}=    Create Dictionary    name=test    build=MyTestBuild
    Call Method    ${options}    set_capability    tb:options    ${tb_options}

    Open Testingbot Browser    ${options}

Close test browser
	Report Testingbot Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}
	Close all browsers
