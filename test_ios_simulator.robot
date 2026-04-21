*** Settings ***

Library  SeleniumLibrary
Library  TestingBot
Library  BrowserOptions

Test Setup  Open test browser
Test Teardown  Close test browser

*** Test Cases ***

iOS Safari Test
	Go to  https://www.google.com
	Page should contain  Google

*** Keywords ***

Open test browser
	${options}=    Get Browser Options    safari

    # W3C + Appium capabilities for a TestingBot iOS simulator
    Call Method    ${options}    set_capability    platformName    iOS
    Call Method    ${options}    set_capability    browserName    Safari
    Call Method    ${options}    set_capability    appium:deviceName    iPhone.*
    Call Method    ${options}    set_capability    appium:platformVersion    26.0
    Call Method    ${options}    set_capability    appium:automationName    XCUITest

    # Set custom TestingBot capabilities using tb:options
    ${tb_options}=    Create Dictionary    name=iOS Safari Test    build=MyTestBuild
    Call Method    ${options}    set_capability    tb:options    ${tb_options}

    Open Testingbot Browser    ${options}

Close test browser
	Report Testingbot Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}
	Close all browsers
