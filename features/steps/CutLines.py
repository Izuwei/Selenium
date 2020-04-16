import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi variantu vyjmuti radku na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("cut-lines-variant").click()
    sleep(1)
    if (text == "horni"):
        context.browser.find_element_by_id("cut-lines-variant-head").click()
    if (text == "spodni"):
        context.browser.find_element_by_id("cut-lines-variant-tail").click()
    sleep(1)

@when('Uzivatel nastavi pocet vyjmutych radku na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("cut-lines-position").send_keys(text) 

@when("Uzivatel prida nastroj Cut lines")
def step(context):
    context.browser.find_element_by_id("add-cut-lines").click()
