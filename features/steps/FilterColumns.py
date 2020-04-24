# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi variantu Filter columns na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("filter-columns-variant").click()
    sleep(1)
    if (text == "odstraneni"):
        context.browser.find_element_by_id("filter-columns-variant-remove").click()
    if (text == "vyjmuti"):
        context.browser.find_element_by_id("filter-columns-variant-cut").click()
    sleep(1)

@when('Uzivatel nastavi Filter columns na "{cislo}" sloupec oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("filter-columns-position").send_keys(cislo)
    context.browser.find_element_by_id("filter-columns-delimiter").send_keys(text)


@when("Uzivatel prida nastroj Filter columns")
def step(context):
    context.browser.find_element_by_id("add-filter-columns").click()
