# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi Regex Replace case "{text}"')
def step(context, text):
    context.browser.find_element_by_id("regex-replace-case").click()
    sleep(1)
    if (text == "sensitive"):
        context.browser.find_element_by_id("regex-replace-case-sensitive").click()
    if (text == "isensitive"):
        context.browser.find_element_by_id("regex-replace-case-isensitive").click()
    sleep(1)

@when('Uzivatel nastavi regularni vyraz pro vyhledani nahrady na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("regex-replace-find").send_keys(text) 

@when('Uzivatel nastavi retezec pro nahradu regularniho vyrazu za "{text}"')
def step(context, text):
    context.browser.find_element_by_id("regex-replace-replace").send_keys(text) 

@when('Uzivatel nastavi Regex Replace na "{cislo}" sloupec oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("regex-replace-in-column").send_keys(cislo)
    context.browser.find_element_by_id("regex-replace-column-delimiter").send_keys(text)

@when("Uzivatel nastavi Regex Replace na prvni vyskyt")
def step(context):
    context.browser.find_element_by_id("regex-replace-occurrence").click()
    sleep(1)
    context.browser.find_element_by_id("regex-replace-occurrence-first").click()
    sleep(1)

@when("Uzivatel prida nastroj Regex Replace")
def step(context):
    context.browser.find_element_by_id("add-regex-replace").click()
