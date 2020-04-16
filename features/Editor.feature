Feature: Editor

    Scenario: Krok zpet
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "text"
        When Uživatel vrátí krok zpět
        Then Vstupni editor obsahuje ""

    Scenario: Krok dopredu
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "text"
        When Uživatel vrátí krok zpět
        And Uživatel se vrátí krokem dopředu
        Then Vstupni editor obsahuje "text"