# FIT VUT 2020
# @author Jakub Sadilek

Feature: Trim

    Scenario: Oriznuti textu od bilich znaku
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno " aa   bb  \n \n   bb\nA A   "
        And Je zobrazena karta "Reduce"
        When Uzivatel prida nastroj Trim
        Then Vysledek obsahuje "aa   bb\n\nbb\nA A"
        And Vygenerovany shell skript je "cat $FILENAME | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//'"
