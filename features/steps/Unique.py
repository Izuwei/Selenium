# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi variantu Unique "{text}"')
def step(context, text):
    context.browser.find_element_by_id("unique-variant").click()
    sleep(1)
    if (text == "merge"):
        context.browser.find_element_by_id("unique-variant-merge").click()
    if (text == "unique-only"):
        context.browser.find_element_by_id("unique-variant-unique").click()
    if (text == "duplicate-only"):
        context.browser.find_element_by_id("unique-variant-duplicate").click()
    sleep(1)

@when('Uzivatel nastavi Unique case "{text}"')
def step(context, text):
    context.browser.find_element_by_id("unique-case").click()
    sleep(1)
    if (text == "sensitive"):
        context.browser.find_element_by_id("unique-case-sensitive").click()
    if (text == "insensitive"):
        context.browser.find_element_by_id("unique-case-isensitive").click()
    sleep(1)

@when("Uzivatel zvoli volbu prefixu")
def step(context):
    context.browser.find_element_by_id("unique-count").click()

@when("Uzivatel prida nastroj Unique")
def step(context):
    context.browser.find_element_by_id("add-unique").click()
