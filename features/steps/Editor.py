import selenium
from behave import *
from time import sleep

@when("Uživatel vrátí krok zpět")
def step(context):
    context.browser.find_element_by_id("editor-sec").click()
    sleep(1)
    context.browser.find_element_by_id("undo").click()
    sleep(1)

@when("Uživatel se vrátí krokem dopředu")
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