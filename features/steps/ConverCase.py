# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi zmenu textu na "{text}" pismena')
def step(context, text):
    context.browser.find_element_by_id("convert-case-case").click()
    sleep(1)
    if (text == "velka"):
        context.browser.find_element_by_id("convert-case-case-uppercase").click()
    if (text == "mala"):
        context.browser.find_element_by_id("convert-case-case-lowercase").click()
    sleep(1)

@when("Uzivatel prida nastroj Convert case")
def step(context):
    context.browser.find_element_by_id("add-convert-case").click()
