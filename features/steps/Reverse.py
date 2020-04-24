# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi smer otoceni na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("reverse-direction").click()
    sleep(1)
    if (text == "vertikalni"):
        context.browser.find_element_by_id("reverse-direction-vertical").click()
    if (text == "horizontalni"):
        context.browser.find_element_by_id("reverse-direction-horizontal").click()
    sleep(1)

@when("Uzivatel prida nastroj Reverse")
def step(context):
    context.browser.find_element_by_id("add-reverse").click()
