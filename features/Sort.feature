# FIT VUT 2020
# @author Jakub Sadilek

Feature: Sort

    Scenario: Vzestupne serazeni case sensitive
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a\nA\n a\n\nz"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi razeni na "vzestupne"
        And Uzivatel nastavi razeni case "sensitive"
        And Uzivatel prida nastroj Sort
        Then Vysledek obsahuje "\n a\nA\na\nz"
        And Vygenerovany shell skript je "cat $FILENAME | LC_ALL=C sort -s"

    Scenario: Vzestupne serazeni case isensitive ignorujici pocatecni mezery
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a\nA\n a\n\nz"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi razeni na "vzestupne"
        And Uzivatel nastavi razeni case "isensitive"
        And Uzivatel nastave razeni ignorujici pocatecni mezery
        And Uzivatel prida nastroj Sort
        Then Vysledek obsahuje "\na\nA\n a\nz"
        And Vygenerovany shell skript je "cat $FILENAME | LC_ALL=C sort -sfb"

    Scenario: Sestupne serazeni case sensitive
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a\n a\nA\n\nz"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi razeni na "sestupne"
        And Uzivatel nastavi razeni case "sensitive"
        And Uzivatel prida nastroj Sort
        Then Vysledek obsahuje "z\na\nA\n a\n"
        And Vygenerovany shell skript je "cat $FILENAME | LC_ALL=C sort -sr"

    Scenario: Sestupne serazeni case isensitive ignorujici pocatecni mezery
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "a\n a\nA\n\nz"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi razeni na "sestupne"
        And Uzivatel nastavi razeni case "isensitive"
        And Uzivatel nastave razeni ignorujici pocatecni mezery
        And Uzivatel prida nastroj Sort
        Then Vysledek obsahuje "z\na\n a\nA\n"
        And Vygenerovany shell skript je "cat $FILENAME | LC_ALL=C sort -srfb"
