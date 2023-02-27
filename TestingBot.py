import requests
from robot.libraries.BuiltIn import BuiltIn

def report_testingbot_status(name, status, credentials):
	selenium = BuiltIn().get_library_instance('SeleniumLibrary')
	session_id = selenium.driver.session_id
	payload = {'test[name]': name, 'test[success]': int(status == 'PASS')}
	key, secret = credentials.split(':')
	url = 'https://api.testingbot.com/v1/tests/{0}'.format(session_id)
	response = requests.put(url, data=payload, auth=(key, secret))
	assert response.status_code == 200, response.text
