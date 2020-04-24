# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi variantu cislovani na "{text}" radky')
def step(context, text):
    context.browser.find_element_by_id("line-numbers-variant").click()
    sleep(1)
    if (text == "vsechny"):
        context.browser.find_element_by_id("line-numbers-variant-all").click()
    if (text == "neprazdne"):
        context.browser.find_element_by_id("line-numbers-variant-nonempty").click()
    sleep(1)

@when('Uzivatel nastavi pocatecni cislo radku na "{num}" nasledujici "{text}"')
def step(context, num, text):
    context.browser.find_element_by_id("line-numbers-starting-number").send_keys(num) 
    context.browser.find_element_by_id("line-numbers-delimiter").send_keys(text) 

@when("Uzivatel prida nastroj Line numbers")
def step(context):
    context.browser.find_element_by_id("add-line-numbers").click()
