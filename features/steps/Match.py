# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when("Uzivatel nastavi Match case sensitive")
def step(context):
    context.browser.find_element_by_id("match-case").click()
    sleep(1)
    context.browser.find_element_by_id("match-case-sensitive").click()
    sleep(1)

@when("Uzivatel nastavi Match na prvni vyskyt")
def step(context):
    context.browser.find_element_by_id("match-occurrence").click()
    sleep(1)
    context.browser.find_element_by_id("match-occurrence-first").click()
    sleep(1)

@when('Uzivatel nastavi retezec pro vyhledani na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("match-expression").send_keys(text)

@when("Uzivatel prida nastroj Match")
def step(context):
    context.browser.find_element_by_id("add-match").click()

@when("Uzivatel nastavi Match case insensitive")
def step(context):
    context.browser.find_element_by_id("match-case").click()
    sleep(1)
    context.browser.find_element_by_id("match-case-isensitive").click()
    sleep(1)

@when('Uzivatel nastavi Match na "{cislo}" sloupec oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("match-in-column").send_keys(cislo)
    context.browser.find_element_by_id("match-column-delimiter").send_keys(text)
