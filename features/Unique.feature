# FIT VUT 2020
# @author Jakub Sadilek

Feature: Unique

    Scenario: Pridani nastroje sensitive Unique merge
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa\naa\nAA\nab\naa"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Unique "merge"
        And Uzivatel nastavi Unique case "sensitive"
        And Uzivatel prida nastroj Unique
        Then Vysledek obsahuje "aa\nAA\nab\naa"
        And Vygenerovany shell skript je "cat $FILENAME | uniq"

    Scenario: Pridani nastroje isensitive Unique merge s prefixy
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa\naa\nAA\nab\naa"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Unique "merge"
        And Uzivatel nastavi Unique case "isensitive"
        And Uzivatel zvoli volbu prefixu
        And Uzivatel prida nastroj Unique
        Then Vysledek obsahuje "3 aa\n1 ab\n1 aa"
        And Vygenerovany shell skript je "cat $FILENAME | uniq -i -c | sed 's/^[[:blank:]]*//'"
    
    Scenario: Pridani nastroje sensitive Unique pouze pro unikatni vyskyty
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa\naa\nAA\nab\naa"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Unique "unique-only"
        And Uzivatel nastavi Unique case "sensitive"
        And Uzivatel prida nastroj Unique
        Then Vysledek obsahuje "AA\nab\naa"
        And Vygenerovany shell skript je "cat $FILENAME | uniq -u"
    
    Scenario: Pridani nastroje isensitive Unique pouze pro unikatni vyskyty
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa\naa\nAA\nab\naa"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Unique "unique-only"
        And Uzivatel nastavi Unique case "isensitive"
        And Uzivatel prida nastroj Unique
        Then Vysledek obsahuje "ab\naa"
        And Vygenerovany shell skript je "cat $FILENAME | uniq -i -u"

    Scenario: Pridani nastroje sensitive Unique pouze pro duplicity
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa\naa\nAA\nab\naa"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Unique "duplicate-only"
        And Uzivatel nastavi Unique case "sensitive"
        And Uzivatel prida nastroj Unique
        Then Vysledek obsahuje "aa\naa"
        And Vygenerovany shell skript je "cat $FILENAME | uniq -D"

    Scenario: Pridani nastroje isensitive Unique pouze pro duplicity
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa\naa\nAA\nab\naa"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Unique "duplicate-only"
        And Uzivatel nastavi Unique case "isensitive"
        And Uzivatel prida nastroj Unique
        Then Vysledek obsahuje "aa\naa\nAA"
        And Vygenerovany shell skript je "cat $FILENAME | uniq -i -D"
