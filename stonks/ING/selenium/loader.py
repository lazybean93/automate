import sys
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

browser = webdriver.Firefox()

browser.get(sys.argv[1])
assert 'Aktien-Suche' in browser.title

time.sleep(2)

with open(sys.argv[2], 'w') as f:
    f.write(browser.page_source)

browser.quit()
