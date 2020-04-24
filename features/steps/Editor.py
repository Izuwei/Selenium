# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@when("Uzivatel vrati krok zpet")
def step(context):
    context.browser.find_element_by_id("editor-sec").click()
    sleep(1)
    context.browser.find_element_by_id("undo").click()
    sleep(1)

@when("Uzivatel napise do editoru {text}")
def step(context, text):
    sleep(1)
    context.browser.execute_script('ace.edit("EditorIn").setValue({})'.format(text))

@when("Uzivatel se vrati krokem dopredu")
def step(context):
    context.browser.find_element_by_id("editor-sec").click()
    sleep(1)
    context.browser.find_element_by_id("redo").click()
    sleep(1)

@then('Vstupni editor obsahuje "{text}"')
def step(context, text):
    sleep(5)
    InputContent = context.browser.execute_script('return ace.edit("EditorIn").getSession().getValue();')
    assert(text == InputContent)