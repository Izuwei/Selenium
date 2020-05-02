# FIT VUT 2020
# @author Jakub Sadilek

Feature: RegexFilterLines

    Scenario: Filtrace radku pomoci sensitivnich regularnich vyrazu
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n  \n\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi Regex filter lines na case "sensitive"
        And Uzivatel zada regularni vyraz pro filtraci radku "a+"
        And Uzivatel prida nastroj Regex filter lines
        Then Vysledek obsahuje " bb \nAA\n  \n"
        And Vygenerovany shell skript je "cat $FILENAME | sed -E '/a+/d'"

    Scenario: Filtrace radku pomoci insensitivnich regularnich vyrazu ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n  \n\naa bbb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi Regex filter lines na case "insensitive"
        And Uzivatel nastavi Regex filter lines podle "2" sloupce oddeleny " "
        And Uzivatel zada regularni vyraz pro filtraci radku "b{3,}"
        And Uzivatel prida nastroj Regex filter lines
        Then Vysledek obsahuje "aa bb\n bb \nAA\n  \n"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' '{IGNORECASE=1}$2 !~ /b{3,}/'"

    Scenario: Filtrace radku pomoci regularnich vyrazu ve sloupci mimo text
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n  \n\naa bbb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi Regex filter lines na case "sensitive"
        And Uzivatel nastavi Regex filter lines podle "10" sloupce oddeleny " "
        And Uzivatel zada regularni vyraz pro filtraci radku ".+"
        And Uzivatel prida nastroj Regex filter lines
        Then Vysledek obsahuje "aa bb\n bb \nAA\n  \n\naa bbb cc"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' '$10 !~ /.+/'"
