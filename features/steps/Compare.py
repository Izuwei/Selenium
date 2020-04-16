import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi porovnani na "{text}"')
def step(context, text):
    context.browser.find_element_by_id("compare-comparator").click()
    sleep(1)
    if (text == "GT"):
        context.browser.find_element_by_id("compare-comparator-gt").click()
    if (text == "GE"):
        context.browser.find_element_by_id("compare-comparator-ge").click()
    if (text == "EQ"):
        context.browser.find_element_by_id("compare-comparator-eq").click()
    if (text == "LE"):
        context.browser.find_element_by_id("compare-comparator-le").click()
    if (text == "LT"):
        context.browser.find_element_by_id("compare-comparator-lt").click()
    sleep(1)

@when('Uzivatel nastavi porovnavaci retezec "{text}"')
def step(context, text):
    context.browser.find_element_by_id("compare-value").send_keys(text)

@when("Uzivatel prida nastroj Compare")
def step(context):
    context.browser.find_element_by_id("add-compare").click()

@when('Uzivatel nastavi porovnani v "{cislo}" sloupci oddeleny "{text}"')
def step(context, cislo, text):
    context.browser.find_element_by_id("compare-in-column").send_keys(cislo)
    context.browser.find_element_by_id("compare-column-delimiter").send_keys(text)
