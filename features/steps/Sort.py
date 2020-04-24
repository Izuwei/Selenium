# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi razeni na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("sort-order").click()
    sleep(1)
    if (text == "vzestupne"):
        context.browser.find_element_by_id("sort-order-ascending").click()
    if (text == "sestupne"):
        context.browser.find_element_by_id("sort-order-descending").click()
    sleep(1)

@when('Uzivatel nastavi razeni case "{text}"')
def step(context, text):
    context.browser.find_element_by_id("sort-case").click()
    sleep(1)
    if (text == "sensitive"):
        context.browser.find_element_by_id("sort-case-sensitive").click()
    if (text == "isensitive"):
        context.browser.find_element_by_id("sort-case-isensitive").click()
    sleep(1)

@when("Uzivatel nastave razeni ignorujici pocatecni mezery")
def step(context):
    context.browser.find_element_by_id("sort-ignore-leading-blanks").click() 

@when("Uzivatel prida nastroj Sort")
def step(context):
    context.browser.find_element_by_id("add-sort").click()
