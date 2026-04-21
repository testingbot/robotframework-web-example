import os
import requests
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.remote.client_config import ClientConfig

HUB_URL = "https://hub.testingbot.com/wd/hub"
API_URL = "https://api.testingbot.com/v1/tests/{session_id}"

def _credentials():
	key = os.environ.get("TB_KEY")
	secret = os.environ.get("TB_SECRET")
	if not key or not secret:
		raise RuntimeError("TB_KEY and TB_SECRET environment variables must be set")
	return key, secret


def open_testingbot_browser(options):
	key, secret = _credentials()
	client_config = ClientConfig(
		remote_server_addr=HUB_URL,
		username=key,
		password=secret,
	)
	selenium = BuiltIn().get_library_instance("SeleniumLibrary")
	selenium.create_webdriver(
		"Remote",
		command_executor=HUB_URL,
		options=options,
		client_config=client_config,
	)


def report_testingbot_status(name, status):
	key, secret = _credentials()
	selenium = BuiltIn().get_library_instance("SeleniumLibrary")
	session_id = selenium.driver.session_id
	payload = {"test[name]": name, "test[success]": int(status == "PASS")}
	response = requests.put(
		API_URL.format(session_id=session_id),
		data=payload,
		auth=(key, secret),
		timeout=30,
	)
	assert response.status_code == 200, response.text
