# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi Regex filter lines na case "{text}"')
def step(context, text):
    context.browser.find_element_by_id("regex-filter-lines-case").click()
    sleep(1)
    if (text == "sensitive"):
        context.browser.find_element_by_id("regex-filter-lines-case-sensitive").click()
    if (text == "insensitive"):
        context.browser.find_element_by_id("regex-filter-lines-case-isensitive").click()
    sleep(1)

@when('Uzivatel nastavi Regex filter lines podle "{cislo}" sloupce oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("regex-filter-lines-in-column").send_keys(cislo)
    context.browser.find_element_by_id("regex-filter-lines-column-delimiter").send_keys(text)

@when('Uzivatel zada regularni vyraz pro filtraci radku "{text}"')
def step(context, text):
    context.browser.find_element_by_id("regex-filter-lines-expression").send_keys(text)

@when("Uzivatel prida nastroj Regex filter lines")
def step(context):
    context.browser.find_element_by_id("add-regex-filter-lines").click()
