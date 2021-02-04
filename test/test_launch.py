from selenium import webdriver
from os import environ

if __name__ == '__main__':
    hub_ip = environ.get('HUB_HOST', 'localhost')
    hub_address = f'http://{hub_ip}:4444/wd/hub'
    caps = {'browserName': 'MicrosoftEdge', 'platform': 'LINUX'}
    print("Launching WebDriver for hub: " + hub_address)
    driver = webdriver.Remote(command_executor=hub_address, desired_capabilities=caps)
    driver.get('https://python.org')
    print("Title: " + driver.title)
    assert 'Python' in driver.title
    driver.quit()
    print("Test passed.")
