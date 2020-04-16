Feature: FilterColumns

    Scenario: Odstraneni sloupce pomoci nastroje Filter columns
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n ab\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter columns na "odstraneni"
        And Uzivatel nastavi Filter columns na "2" sloupec oddeleny " "
        And Uzivatel prida nastroj Filter columns
        Then Vysledek obsahuje "aa\n \nAA\n\naa cc"
        And Vygenerovany shell skript je "cat $FILENAME | cut -d ' ' -f -1,3-"

    Scenario: Vyjmuti sloupce pomoci nastroje Filter columns
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n ab\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter columns na "vyjmuti"
        And Uzivatel nastavi Filter columns na "2" sloupec oddeleny " "
        And Uzivatel prida nastroj Filter columns
        Then Vysledek obsahuje "bb\nbb\n\nab\nbb"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' '{print $2}'"
    
    Scenario: Odstraneni sloupce mimo text pomoci nastroje Filter columns
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n ab\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter columns na "odstraneni"
        And Uzivatel nastavi Filter columns na "10" sloupec oddeleny " "
        And Uzivatel prida nastroj Filter columns
        Then Vysledek obsahuje "aa bb\n bb \nAA\n ab\naa bb cc"
        And Vygenerovany shell skript je "cat $FILENAME | cut -d ' ' -f -9,11-"

    Scenario: Vyjmuti sloupce mimo text pomoci nastroje Filter columns
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n ab\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter columns na "vyjmuti"
        And Uzivatel nastavi Filter columns na "9" sloupec oddeleny " "
        And Uzivatel prida nastroj Filter columns
        Then Vysledek obsahuje "\n\n\n\n"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' '{print $9}'"
