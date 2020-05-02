# FIT VUT 2020
# @author Jakub Sadilek

Feature: RegexMatch

    Scenario: Pridani nastroje sensitive Regex Match
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab\nAcd\nAAAx"
        When Uzivatel nastavi Regex Match case sensitive
        And Uzivatel nastavi regularni vyraz pro vyhledani na "AA+"
        And Uzivatel prida nastroj Regex Match
        Then Vysledek obsahuje "AAAx"
        And Vygenerovany shell skript je "cat $FILENAME | grep -E 'AA+'"

    Scenario: Pridani nastroje insensitive Regex Match pro prvni vyskyt
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "xcv\nlfAaxr\naabc\nlfaa"
        When Uzivatel nastavi Regex Match na prvni vyskyt
        And Uzivatel nastavi Regex Match case insensitive
        And Uzivatel nastavi regularni vyraz pro vyhledani na "a{2,}"
        And Uzivatel prida nastroj Regex Match
        Then Vysledek obsahuje "lfAaxr"
        And Vygenerovany shell skript je "cat $FILENAME | grep -E -i -m 1 'a{2,}'"

    Scenario: Pridani nastroje insensitive Regex Match ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab x cd\nef\nGx hEx\n\nx  x\nIx XX"
        When Uzivatel nastavi Regex Match case insensitive
        And Uzivatel nastavi Regex Match na "4" sloupec oddeleny " "
        And Uzivatel nastavi regularni vyraz pro vyhledani na "x*"
        And Uzivatel prida nastroj Regex Match
        Then Vysledek obsahuje "ab x cd\nef\nGx hEx\n\nx  x\nIx XX"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' -v OFS=' ' '{IGNORECASE=1} $4~/x*/'"

    Scenario: Pridani nastroje sensitive Regex Match ve sloupci pro prvni vyskyt
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab|x|cd\neXf\nGx|hEx\n \nx|  |x\nIx|XX"
        When Uzivatel nastavi Regex Match na prvni vyskyt
        And Uzivatel nastavi Regex Match case sensitive
        And Uzivatel nastavi Regex Match na "2" sloupec oddeleny "|"
        And Uzivatel nastavi regularni vyraz pro vyhledani na "\s+"
        And Uzivatel prida nastroj Regex Match
        Then Vysledek obsahuje "x|  |x"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' -v OFS='|' '$2~/\s+/ {print; exit}'"