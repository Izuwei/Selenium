# FIT VUT 2020
# @author Jakub Sadilek

Feature: LineNumbers

    Scenario: Pridani cisel na vsechny radky
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab\nc\n\nde\n  \nfg"
        And Je zobrazena karta "Modify"
        When Uzivatel prida nastroj Line numbers
        Then Vysledek obsahuje "1 ab\n2 c\n3 \n4 de\n5   \n6 fg"
        And Vygenerovany shell skript je "cat $FILENAME | nl -s ' ' -v 1 -b a | sed 's/^[[:blank:]]*//'"

    Scenario: Pridani cisel na nerazdne radky zacinajici od 3 nasledujici pomlckou
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab\nc\n\nde\n  \nfg"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi variantu cislovani na "neprazdne" radky
        And Uzivatel nastavi pocatecni cislo radku na "3" nasledujici "-"
        And Uzivatel prida nastroj Line numbers
        Then Vysledek obsahuje "3-ab\n4-c\n\n5-de\n6-  \n7-fg"
        And Vygenerovany shell skript je "cat $FILENAME | nl -s '-' -v 3 -b t | sed 's/^[[:blank:]]*//'"
