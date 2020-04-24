# FIT VUT 2020
# @author Jakub Sadilek

Feature: CutLines

    Scenario: Vyjmuti hornich radku
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n ab\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu vyjmuti radku na "horni"
        And Uzivatel nastavi pocet vyjmutych radku na "2"
        And Uzivatel prida nastroj Cut lines
        Then Vysledek obsahuje "aa bb\n bb "
        And Vygenerovany shell skript je "cat $FILENAME | head -n 2"

    Scenario: Vyjmuti spodnich radku
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n ab\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu vyjmuti radku na "spodni"
        And Uzivatel nastavi pocet vyjmutych radku na "3"
        And Uzivatel prida nastroj Cut lines
        Then Vysledek obsahuje "AA\n ab\naa bb cc"
        And Vygenerovany shell skript je "cat $FILENAME | tail -n 3"