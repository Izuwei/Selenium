# FIT VUT 2020
# @author Jakub Sadilek

Feature: Reverse

    Scenario: Vertikalni otoceni textu
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a b\n \n\nc d"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi smer otoceni na "vertikalni"
        And Uzivatel prida nastroj Reverse
        Then Vysledek obsahuje "c d\n\n \na b"
        And Vygenerovany shell skript je "cat $FILENAME | tac"

    Scenario: Horizontalni otoceni textu
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a b\n \n\nc d"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi smer otoceni na "horizontalni"
        And Uzivatel prida nastroj Reverse
        Then Vysledek obsahuje "b a\n \n\nd c"
        And Vygenerovany shell skript je "cat $FILENAME | rev"
