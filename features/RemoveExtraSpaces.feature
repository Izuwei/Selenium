Feature: RemoveExtraSpaces

    Scenario: Odstraneni prebytecnych mezer
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa   bb\n   bb \nA A   \n ab \naa   bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel prida nastroj pro odstraneni nadbytecnych mezer
        Then Vysledek obsahuje "aa bb\n bb \nA A \n ab \naa bb cc"
        And Vygenerovany shell skript je "cat $FILENAME | tr -s ' '"
