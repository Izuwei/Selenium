# FIT VUT 2020
# @author Jakub Sadilek

Feature: Replace

    Scenario: Pridani nastroje sensitive Replace
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "abX\nxd\nAx"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Replace case sensitive
        And Uzivatel nastavi retezec pro vyhledani nahrady na "x"
        And Uzivatel nastavi retezec pro nahradu na "rep"
        And Uzivatel prida nastroj Replace
        Then Vysledek obsahuje "abX\nrepd\nArep"
        And Vygenerovany shell skript je "cat $FILENAME | sed -E 's/x/rep/g'"

    Scenario: Pridani nastroje insensitive Replace pro prvni vyskyt
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "xcv\nlfAaxar\naabc\nlfaa"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Replace na prvni vyskyt
        And Uzivatel nastavi Replace case insensitive
        And Uzivatel nastavi retezec pro vyhledani nahrady na "a"
        And Uzivatel nastavi retezec pro nahradu na "rep"
        And Uzivatel prida nastroj Replace
        Then Vysledek obsahuje "xcv\nlfrepaxar\naabc\nlfaa"
        And Vygenerovany shell skript je "cat $FILENAME | sed -E '0,/a/Is//rep/'"

    Scenario: Pridani nastroje insensitive Replace ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab-x-cd\nef\nGx-hEx\n\nx--x\nIx-XX"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Replace case insensitive
        And Uzivatel nastavi Replace na "2" sloupec oddeleny "-"
        And Uzivatel nastavi retezec pro vyhledani nahrady na "x"
        And Uzivatel nastavi retezec pro nahradu na "rep"
        And Uzivatel prida nastroj Replace
        Then Vysledek obsahuje "ab-rep-cd\nef\nGx-hErep\n\nx--x\nIx-reprep"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '-' -v OFS='-' '{IGNORECASE=1}{gsub("x", "rep", $2); print }'"

    Scenario: Pridani nastroje sensitive Replace ve sloupci pro prvni vyskyt
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab|x|cd\neXf\nGx|hEx\n\nx||x\nIx|XX"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Replace na prvni vyskyt
        And Uzivatel nastavi Replace case sensitive
        And Uzivatel nastavi Replace na "1" sloupec oddeleny "|"
        And Uzivatel nastavi retezec pro vyhledani nahrady na "x"
        And Uzivatel nastavi retezec pro nahradu na "rep"
        And Uzivatel prida nastroj Replace
        Then Vysledek obsahuje "ab|x|cd\neXf\nGrep|hEx\n\nx||x\nIx|XX"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' -v OFS='|' '!x{x=sub("x","rep", $1)}1'"
