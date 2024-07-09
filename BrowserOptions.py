from selenium.webdriver import ChromeOptions, FirefoxOptions, EdgeOptions, SafariOptions

def get_browser_options(browser):
    if browser.lower() == 'chrome':
        return ChromeOptions()
    elif browser.lower() == 'firefox':
        return FirefoxOptions()
    elif browser.lower() == 'edge':
        return EdgeOptions()
    elif browser.lower() == 'safari':
        return SafariOptions()
    else:
        raise ValueError(f"Unsupported browser: {browser}")