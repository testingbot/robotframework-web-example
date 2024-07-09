[![Validate RobotFramework Example](https://github.com/testingbot/robotframework-web-example/actions/workflows/test-python.yml/badge.svg)](https://github.com/testingbot/robotframework-web-example/actions/workflows/test-python.yml)

## TestingBot RobotFramework Example

TestingBot provides an online grid of browsers and mobile devices to run Automated tests on via Selenium WebDriver.
This example demonstrates how to use RobotFramework to run a test on a remote TestingBot browser.

### Environment Setup

1. Setup
    * Clone the repo
	* Install the dependencies `pip install -r requirements.txt`

2. TestingBot Credentials
   Retrieve your TestingBot Key (`TB_KEY`) and Secret (`TB_SECRET`) from the [TestingBot Dashboard](https://testingbot.com/members/).

3. Run test:
	```PYTHONPATH=$PYTHONPATH:. robot --variable BROWSER:chrome --variable VERSION:latest --variable PLATFORM:MAC --variable TB_KEY:<your TestingBot Key> --variable TB_SECRET:<your TestingBot Secret> test.robot```

### Resources
##### [TestingBot Documentation](https://testingbot.com/support/getting-started/robotframework.html)

##### [SeleniumHQ Documentation](https://www.selenium.dev/documentation/)

##### [RobotFramework Documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

