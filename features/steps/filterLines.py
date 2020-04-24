# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi variantu Filter lines na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("filter-lines-content").click()
    sleep(1)
    if (text == "prazdne"):
        context.browser.find_element_by_id("filter-lines-content-empty").click()
    if (text == "bile-znaky"):
        context.browser.find_element_by_id("filter-lines-content-whitechars").click()
    if (text == "vlastni"):
        context.browser.find_element_by_id("filter-lines-content-custom").click()
    sleep(1)

@when('Uzivatel nastavi filtraci radku na case "{text}"')
def step(context, text):
    context.browser.find_element_by_id("filter-lines-case").click()
    sleep(1)
    if (text == "sensitive"):
        context.browser.find_element_by_id("filter-lines-case-sensitive").click()
    if (text == "isensitive"):
        context.browser.find_element_by_id("filter-lines-case-isensitive").click()
    sleep(1)

@when('Uzivatel nastavi filtraci radku podle "{cislo}" sloupce oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("filter-lines-column").send_keys(cislo)
    context.browser.find_element_by_id("filter-lines-delimiter").send_keys(text)

@when('Uzivatel nastavi podretezec pro filtraci radku na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("filter-lines-custom-content").send_keys(text)

@when("Uzivatel prida nastroj Filter lines")
def step(context):
    context.browser.find_element_by_id("add-filter-lines").click()
