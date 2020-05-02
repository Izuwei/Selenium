# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when("Uzivatel nastavi Replace case sensitive")
def step(context):
    context.browser.find_element_by_id("replace-case").click()
    sleep(1)
    context.browser.find_element_by_id("replace-case-sensitive").click()
    sleep(1)

@when("Uzivatel nastavi Replace case insensitive")
def step(context):
    context.browser.find_element_by_id("replace-case").click()
    sleep(1)
    context.browser.find_element_by_id("replace-case-isensitive").click()
    sleep(1)

@when('Uzivatel nastavi retezec pro vyhledani nahrady na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("replace-find").send_keys(text)

@when('Uzivatel nastavi retezec pro nahradu na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("replace-replace").send_keys(text) 

@when("Uzivatel prida nastroj Replace")
def step(context):
    context.browser.find_element_by_id("add-replace").click()

@when("Uzivatel nastavi Replace na prvni vyskyt")
def step(context):
    context.browser.find_element_by_id("replace-occurrence").click()
    sleep(1)
    context.browser.find_element_by_id("replace-occurrence-first").click()
    sleep(1)

@when('Uzivatel nastavi Replace na "{cislo}" sloupec oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("replace-in-column").send_keys(cislo)
    context.browser.find_element_by_id("replace-column-delimiter").send_keys(text)
