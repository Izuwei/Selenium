# FIT VUT 2020
# @author Jakub Sadilek

Feature: Compare

    Scenario: Pridani nastroje compare GT
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "1|4|7\n2|5|8\n3|6|9"
        When Uzivatel nastavi porovnani na "GT"
        And Uzivatel nastavi porovnavaci retezec "2|5|8"
        And Uzivatel prida nastroj Compare
        Then Vysledek obsahuje "3|6|9"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '\n' '$1 > "2|5|8"'"

    Scenario: Pridani nastroje compare GE
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "1|4|7\n2|5|8\n3|6|9"
        When Uzivatel nastavi porovnani na "GE"
        And Uzivatel nastavi porovnavaci retezec "2|5|8"
        And Uzivatel prida nastroj Compare
        Then Vysledek obsahuje "2|5|8\n3|6|9"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '\n' '$1 >= "2|5|8"'"

    Scenario: Pridani nastroje compare EQ ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "1|4|7\n2|65|8\n3|6|9"
        When Uzivatel nastavi porovnani na "EQ"
        And Uzivatel nastavi porovnani v "2" sloupci oddeleny "|"
        And Uzivatel nastavi porovnavaci retezec "6"
        And Uzivatel prida nastroj Compare
        Then Vysledek obsahuje "3|6|9"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' '$2 == "6"'"

    Scenario: Pridani nastroje compare LE ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "1|4|7\n2|5|8\n3|6|9"
        When Uzivatel nastavi porovnani na "LE"
        And Uzivatel nastavi porovnani v "3" sloupci oddeleny "|"
        And Uzivatel nastavi porovnavaci retezec "88"
        And Uzivatel prida nastroj Compare
        Then Vysledek obsahuje "1|4|7\n2|5|8"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' '$3 <= "88"'"

    Scenario: Pridani nastroje compare LT ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "1|4|7\n2|5|8\n3|6|9"
        When Uzivatel nastavi porovnani na "LT"
        And Uzivatel nastavi porovnani v "10" sloupci oddeleny "|"
        And Uzivatel nastavi porovnavaci retezec "7"
        And Uzivatel prida nastroj Compare
        Then Vysledek obsahuje "1|4|7\n2|5|8\n3|6|9"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' '$10 < "7"'"