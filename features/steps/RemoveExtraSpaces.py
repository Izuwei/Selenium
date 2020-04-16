import selenium
from behave import *
from time import sleep

@when("Uzivatel prida nastroj pro odstraneni nadbytecnych mezer")
def step(context):
    context.browser.find_element_by_id("add-remove-extra-spaces").click()
