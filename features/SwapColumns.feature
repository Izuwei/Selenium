# FIT VUT 2020
# @author Jakub Sadilek

Feature: SwapColumns

    Scenario: Vymena ruzne dlouhych sloupcu
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a|b|c\na\n\n|b\na|b|c|d|e"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi vymenu sloupce na "1" pozici za "2" oddeleno "|"
        And Uzivatel prida nastroj Swap columns
        Then Vysledek obsahuje "b|a|c\n|a\n|\nb|\nb|a|c|d|e"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' -v OFS='|' '{t=$1;$1=$2;$2=t;print;}'"

    Scenario: Vymena sloupce mimo text
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a|b|c\na\n\n|b\na|b|c|d|e"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi vymenu sloupce na "1" pozici za "3" oddeleno " "
        And Uzivatel prida nastroj Swap columns
        Then Vysledek obsahuje "  a|b|c\n  a\n  \n  |b\n  a|b|c|d|e"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' -v OFS=' ' '{t=$1;$1=$3;$3=t;print;}'"
