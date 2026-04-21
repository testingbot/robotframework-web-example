*** Settings ***

Library  SeleniumLibrary
Library  TestingBot
Library  BrowserOptions

Test Setup  Open test browser
Test Teardown  Close test browser

*** Test Cases ***

Android Chrome Test
	Go to  https://www.google.com
	Page should contain  Google

*** Keywords ***

Open test browser
	${options}=    Get Browser Options    chrome

    # W3C + Appium capabilities for a TestingBot Android emulator
    Call Method    ${options}    set_capability    platformName    Android
    Call Method    ${options}    set_capability    browserName    Chrome
    Call Method    ${options}    set_capability    appium:deviceName    Pixel.*
    Call Method    ${options}    set_capability    appium:platformVersion    16.0
    Call Method    ${options}    set_capability    appium:automationName    UiAutomator2

    # Set custom TestingBot capabilities using tb:options
    ${tb_options}=    Create Dictionary    name=Android Emulator Test    build=MyTestBuild
    Call Method    ${options}    set_capability    tb:options    ${tb_options}

    Open Testingbot Browser    ${options}

Close test browser
	Report Testingbot Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}
	Close all browsers
