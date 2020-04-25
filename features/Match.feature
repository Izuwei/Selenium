# FIT VUT 2020
# @author Jakub Sadilek

Feature: Match

    Scenario: Pridani nastroje sensitive Match
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab\ncd\nAx"
        When Uzivatel nastavi Match case sensitive
        And Uzivatel nastavi retezec pro vyhledani na "A"
        And Uzivatel prida nastroj Match
        Then Vysledek obsahuje "Ax"
        And Vygenerovany shell skript je "cat $FILENAME | grep -E 'A'"

    Scenario: Pridani nastroje isensitive Match ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab x cd\nef\nGx hEx\n\nx  x\nIx XX"
        When Uzivatel nastavi Match case isensitive
        And Uzivatel nastavi Match na "2" sloupec oddeleny " "
        And Uzivatel nastavi retezec pro vyhledani na "x"
        And Uzivatel prida nastroj Match
        Then Vysledek obsahuje "ab x cd\nGx hEx\nIx XX"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' -v OFS=' ' '{IGNORECASE=1} $2~/x/'"

    Scenario: Pridani nastroje isensitive Match pro prvni vyskyt
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "xcv\nlfAxr\nabc\nlfa"
        When Uzivatel nastavi Match na prvni vyskyt
        And Uzivatel nastavi Match case isensitive
        And Uzivatel nastavi retezec pro vyhledani na "a"
        And Uzivatel prida nastroj Match
        Then Vysledek obsahuje "lfAxr"
        And Vygenerovany shell skript je "cat $FILENAME | grep -E -i -m 1 'a'"

    Scenario: Pridani nastroje sensitive Match ve sloupci pro prvni vyskyt
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab|x|cd\neXf\nGx|hEx\n\nx||x\nIx|XX"
        When Uzivatel nastavi Match na prvni vyskyt
        And Uzivatel nastavi Match case sensitive
        And Uzivatel nastavi Match na "1" sloupec oddeleny "|"
        And Uzivatel nastavi retezec pro vyhledani na "x"
        And Uzivatel prida nastroj Match
        Then Vysledek obsahuje "Gx|hEx"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' -v OFS='|' '$1~/x/ {print; exit}'"