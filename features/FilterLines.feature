# FIT VUT 2020
# @author Jakub Sadilek

Feature: FilterLines

    Scenario: Odstraneni prazdnych radku
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n  \n\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter lines na "prazdne"
        And Uzivatel prida nastroj Filter lines
        Then Vysledek obsahuje "aa bb\n bb \nAA\n  \naa bb cc"
        And Vygenerovany shell skript je "cat $FILENAME | sed '/^$/d'"

    Scenario: Odstraneni radku s bilymi znaky
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n  \n\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter lines na "bile-znaky"
        And Uzivatel prida nastroj Filter lines
        Then Vysledek obsahuje "aa bb\n bb \nAA\naa bb cc"
        And Vygenerovany shell skript je "cat $FILENAME | awk 'NF > 0'"

    Scenario: Odstraneni radku pomoci sensitivniho podretezce
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n  \n\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter lines na "vlastni"
        And Uzivatel nastavi filtraci radku na case "sensitive"
        And Uzivatel nastavi podretezec pro filtraci radku na "a"
        And Uzivatel prida nastroj Filter lines
        Then Vysledek obsahuje " bb \nAA\n  \n"
        And Vygenerovany shell skript je "cat $FILENAME | sed -E '/a/d'"

    Scenario: Odstraneni radku pomoci insensitivniho podretezce ve sloupci
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n\nxs db\n ab\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter lines na "vlastni"
        And Uzivatel nastavi filtraci radku na case "insensitive"
        And Uzivatel nastavi filtraci radku podle "1" sloupce oddeleny " "
        And Uzivatel nastavi podretezec pro filtraci radku na "a"
        And Uzivatel prida nastroj Filter lines
        Then Vysledek obsahuje " bb \n\nxs db\n ab"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' '{IGNORECASE=1}$1 !~ "a" {print}'"

    Scenario: Odstraneni radku pomoci podretezce mimo text
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa bb\n bb \nAA\n  \n\naa bb cc"
        And Je zobrazena karta "Reduce"
        When Uzivatel nastavi variantu Filter lines na "vlastni"
        And Uzivatel nastavi filtraci radku na case "insensitive"
        And Uzivatel nastavi filtraci radku podle "10" sloupce oddeleny " "
        And Uzivatel nastavi podretezec pro filtraci radku na "a"
        And Uzivatel prida nastroj Filter lines
        Then Vysledek obsahuje "aa bb\n bb \nAA\n  \n\naa bb cc"
        And Vygenerovany shell skript je "cat $FILENAME | awk -F '[ ]' '{IGNORECASE=1}$10 !~ "a" {print}'"
        