from msedge.selenium_tools import EdgeOptions
from msedge.selenium_tools.remote_connection import EdgeRemoteConnection
from selenium import webdriver
from os import environ
import pdb

if __name__ == '__main__':
    options = EdgeOptions()
    options.use_chromium = True
    options.add_argument('--no-sandbox')
    options.add_argument('--headless')
    hub_ip = environ.get('HUB_HOST', 'localhost')
    hub_address = f'http://{hub_ip}:4444/wd/hub'
    caps = {'browserName': 'MicrosoftEdge', 'platform': 'LINUX'}
    print("Launching WebDriver for hub: " + hub_address)
    executor = EdgeRemoteConnection(hub_address)
    driver = webdriver.Remote(command_executor=executor, options=options, desired_capabilities=caps)
    driver.get('https://python.org')
    driver.quit()
    print("Test passed.")
