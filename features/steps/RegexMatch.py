# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when("Uzivatel nastavi Regex Match case sensitive")
def step(context):
    context.browser.find_element_by_id("regex-match-case").click()
    sleep(1)
    context.browser.find_element_by_id("regex-match-case-sensitive").click()
    sleep(1)

@when("Uzivatel nastavi Regex Match na prvni vyskyt")
def step(context):
    context.browser.find_element_by_id("regex-match-occurrence").click()
    sleep(1)
    context.browser.find_element_by_id("regex-match-occurence-first").click()
    sleep(1)

@when('Uzivatel nastavi regularni vyraz pro vyhledani na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("regex-match-expression").send_keys(text)

@when("Uzivatel prida nastroj Regex Match")
def step(context):
    context.browser.find_element_by_id("add-regex-match").click()

@when("Uzivatel nastavi Regex Match case isensitive")
def step(context):
    context.browser.find_element_by_id("regex-match-case").click()
    sleep(1)
    context.browser.find_element_by_id("regex-match-case-isensitive").click()
    sleep(1)

@when('Uzivatel nastavi Regex Match na "{cislo}" sloupec oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("regex-match-in-column").send_keys(cislo)
    context.browser.find_element_by_id("regex-match-column-delimiter").send_keys(text)
