Feature: RegexReplace

    Scenario: Pridani nastroje sensitive Regex Replace
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "abX\nxd\nAx"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Regex Replace case "sensitive"
        And Uzivatel nastavi regularni vyraz pro vyhledani nahrady na "x+"
        And Uzivatel nastavi retezec pro nahradu regularniho vyrazu za "regrep"
        And Uzivatel prida nastroj Regex Replace
        Then Vysledek obsahuje "abX\nregrepd\nAregrep"
        And Vygenerovany shell skript je "cat $FILENAME | sed -E 's/x+/regrep/g'"

    Scenario: Pridani nastroje isensitive Regex Replace
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "abX\nxd\nAx"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Regex Replace case "isensitive"
        And Uzivatel nastavi regularni vyraz pro vyhledani nahrady na "x+"
        And Uzivatel nastavi retezec pro nahradu regularniho vyrazu za "regrep"
        And Uzivatel prida nastroj Regex Replace
        Then Vysledek obsahuje "abregrep\nregrepd\nAregrep"
        And Vygenerovany shell skript je "cat $FILENAME | sed -E 's/x+/regrep/gI'"

    Scenario: Pridani nastroje Regex Replace ve sloupci pro vsechny vyskyty
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab-x-cd\nef\nGx-hEx\n\nx--x\nIx-XX"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Regex Replace case "isensitive"
        And Uzivatel nastavi Regex Replace na "2" sloupec oddeleny "-"
        And Uzivatel nastavi regularni vyraz pro vyhledani nahrady na ".*"
        And Uzivatel nastavi retezec pro nahradu regularniho vyrazu za "Z"
        And Uzivatel prida nastroj Regex Replace
        Then Vysledek obsahuje "ab-Z-cd\nef-Z\nGx-Z\n-Z\nx-Z-x\nIx-Z"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '-' -v OFS='-' '{IGNORECASE=1}{gsub(".*", "Z", $2); print }'"

    Scenario: Pridani nastroje sensitive Regex Replace ve sloupci pro prvni vyskyt
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "ab|(cd|ef\ngh|(ij)|kl"
        And Je zobrazena karta "Replace"
        When Uzivatel nastavi Regex Replace na prvni vyskyt
        And Uzivatel nastavi Regex Replace case "sensitive"
        And Uzivatel nastavi Regex Replace na "2" sloupec oddeleny "|"
        And Uzivatel nastavi regularni vyraz pro vyhledani nahrady na "$"
        And Uzivatel nastavi retezec pro nahradu regularniho vyrazu za ")"
        And Uzivatel prida nastroj Regex Replace
        Then Vysledek obsahuje "ab|(cd)|ef\ngh|(ij)|kl"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '|' -v OFS='|' '!x{x=sub("$",")", $2)}1'"
