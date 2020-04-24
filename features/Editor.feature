# FIT VUT 2020
# @author Jakub Sadilek

Feature: Editor

    Scenario: Krok zpet
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "text"
        When Uzivatel napise do editoru "jiny text"
        And Uzivatel vrati krok zpet
        Then Vstupni editor obsahuje "text"

    Scenario: Krok dopredu
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "text"
        When Uzivatel vrati krok zpet
        And Uzivatel se vrati krokem dopredu
        Then Vstupni editor obsahuje "text"