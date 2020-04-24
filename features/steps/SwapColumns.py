# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when('Uzivatel nastavi vymenu sloupce na "{position1}" pozici za "{position2}" oddeleno "{text}"')
def step(context, position1, position2, text):
    context.browser.find_element_by_id("swap-columns-position-one").send_keys(position1) 
    context.browser.find_element_by_id("swap-columns-position-two").send_keys(position2) 
    context.browser.find_element_by_id("swap-columns-delimiter").send_keys(text) 

@when("Uzivatel prida nastroj Swap columns")
def step(context):
    context.browser.find_element_by_id("add-swap-columns").click()
