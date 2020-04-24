#!/usr/bin/env python3.6

# FIT VUT 2020
# @author Jakub Sadilek

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

def before_all(context):
    context.browser = webdriver.Firefox()
    context.browser.implicitly_wait(15)
    context.base_url = "https://craftex.app/"

def after_all(context):  
    context.browser.quit()
