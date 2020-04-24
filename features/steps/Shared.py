# FIT VUT 2020
# @author Jakub Sadilek

import selenium
from behave import *
from time import sleep

@given("Uzivatel se nachazi na strance weboveho nastroje")
def step(context):
    context.browser.get("https://craftex.app/")

@given("Do vstupniho editoru je vlozeno {text}")
def step(context, text):
    context.browser.execute_script('ace.edit("EditorIn").setValue({})'.format(text))

@given('Je zobrazena karta "{card}"')
def step(context, card):
    if (card == "Find"):
        context.browser.find_element_by_id("scrollable-auto-tab-1").click()
    if (card == "Replace"):
        context.browser.find_element_by_id("scrollable-auto-tab-1").click()
    if (card == "Reduce"):
        context.browser.find_element_by_id("scrollable-auto-tab-2").click()
    if (card == "Modify"):
        context.browser.find_element_by_id("scrollable-auto-tab-3").click()
    sleep(1)

@then('Vysledek obsahuje "{text}"')
def step(context, text):
    sleep(2)
    outputContent = str(context.browser.execute_script('return ace.edit("EditorOut").getSession().getValue();'))
    assert(text == repr(outputContent).strip("'"))

@then('Vygenerovany shell skript je "{text}"')
def step(context, text):
    context.browser.find_element_by_id("pipeline-sec").click()
    sleep(1)
    context.browser.find_element_by_id("create-shell").click()
    sleep(1)
    script = context.browser.find_element_by_id("scroll-dialog-text").text
    assert(text == script)