## TestingBot RobotFramework Example

TestingBot provides an online grid of browsers and mobile devices to run Automated tests on via Selenium WebDriver.
This example demonstrates how to use RobotFramework to run a test on a remote TestingBot browser.

### Environment Setup

1. Setup
    * Clone the repo
	* Install the dependencies `pip install -r requirements.txt`

2. TestingBot Credentials
   Add your TestingBot Key and Secret as environmental variables. You can find these in the [TestingBot Dashboard](https://testingbot.com/members/).
    ```
    $ export TB_KEY=<your TestingBot Key>
    $ export TB_SECRET=<your TestingBot Secret>
    ```

3. Run test:
	```PYTHONPATH=$PYTHONPATH:. robot --variable BROWSER:chrome --variable VERSION:latest --variable PLATFORM:MAC test.robot```

### Resources
##### [TestingBot Documentation](https://testingbot.com/support/getting-started/robotframework.html)

##### [SeleniumHQ Documentation](https://www.selenium.dev/documentation/)

##### [RobotFramework Documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

