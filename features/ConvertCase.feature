# FIT VUT 2020
# @author Jakub Sadilek

Feature: ConvertCase

    Scenario: Zmena textu na velka pismena
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a B\n \n\nC d"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi zmenu textu na "velka" pismena
        And Uzivatel prida nastroj Convert case
        Then Vysledek obsahuje "A B\n \n\nC D"
        And Vygenerovany shell skript je "cat $FILENAME | tr '[:lower:]' '[:upper:]'"

    Scenario: Zmena textu na mala pismena
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a B\n \n\nC d"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi zmenu textu na "mala" pismena
        And Uzivatel prida nastroj Convert case
        Then Vysledek obsahuje "a b\n \n\nc d"
        And Vygenerovany shell skript je "cat $FILENAME | tr '[:upper:]' '[:lower:]'"
