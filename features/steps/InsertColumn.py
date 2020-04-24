# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from selenium.webdriver.common.keys import Keys
from behave import *
from time import sleep

@when('Uzivatel nastavi vlozeni sloupce na "{cislo}" pozici oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("insert-column-position").send_keys(cislo)
    context.browser.find_element_by_id("insert-column-delimiter").send_keys(text)

@when('Uzivatel nastavi obsah sloupce na "{text}"')
def step(context, text):
    element = context.browser.find_element_by_id("insert-column-content")
    textSplit = text.split("\\n")
    lastPart = len(textSplit)

    i = 1
    for part in textSplit:
        element.send_keys(part)
        if (i != lastPart):
            element.send_keys(Keys.SHIFT + Keys.ENTER)
        i += 1

    
@when("Uzivatel prida nastroj Insert column")
def step(context):
    context.browser.find_element_by_id("add-insert-column").click()
