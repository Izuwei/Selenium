import selenium
from behave import *
from time import sleep

@when("Uzivatel prida nastroj Trim")
def step(context):
    context.browser.find_element_by_id("add-trim").click()
