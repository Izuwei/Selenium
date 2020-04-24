# FIT VUT 2020
# @author Jakub Sadilek

Feature: InsertColumn

    Scenario: Pridani dlouheho sloupce na prvi pozici
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa|bb\n|bb|\nAA\n|||\n\naa|bb|cc"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi vlozeni sloupce na "1" pozici oddeleny "|"
        And Uzivatel nastavi obsah sloupce na "a\n \na\na\na\na\na\na"
        And Uzivatel prida nastroj Insert column
        Then Vysledek obsahuje "a|aa|bb\n ||bb|\na|AA\na||||\na|\na|aa|bb|cc\na|\na|"
        And Vygenerovany shell skript je "cat $FILENAME | pr -mts'|' $COLUMN_FILE /dev/stdin"

    Scenario: Pridani kratkeho sloupce na prvni pozici
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa|bb\n|bb|\nAA\n|||\n\naa|bb|cc"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi vlozeni sloupce na "1" pozici oddeleny "|"
        And Uzivatel nastavi obsah sloupce na "a\n \na\na"
        And Uzivatel prida nastroj Insert column
        Then Vysledek obsahuje "a|aa|bb\n ||bb|\na|AA\na||||\n|\n|aa|bb|cc"
        And Vygenerovany shell skript je "cat $FILENAME | pr -mts'|' $COLUMN_FILE /dev/stdin"

    Scenario: Pridani dlouheho sloupce
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa|bb\n|bb|\nAA\n|||\n\naa|bb|cc"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi vlozeni sloupce na "3" pozici oddeleny "|"
        And Uzivatel nastavi obsah sloupce na "a\n \na\na\na\na\na\na"
        And Uzivatel prida nastroj Insert column
        Then Vysledek obsahuje "aa|bb|a\n|bb| |\nAA||a\n||a||\n||a\naa|bb|a|cc\n||a\n||a"
        And Vygenerovany shell skript je "cat $FILENAME | pr -mts'|' $COLUMN_FILE /dev/stdin | awk -F '|' -v OFS='|' '{t=$1;$1=$2;$2=$3;$3=t;print;}'"

    Scenario: Pridani kratkeho sloupce
        Given Uzivatel se nachazi na strance weboveho nastroje
        And Do vstupniho editoru je vlozeno "aa|bb\n|bb|\nAA\n|||\n\naa|bb|cc"
        And Je zobrazena karta "Modify"
        When Uzivatel nastavi vlozeni sloupce na "3" pozici oddeleny "|"
        And Uzivatel nastavi obsah sloupce na "a\n \na\na"
        And Uzivatel prida nastroj Insert column
        Then Vysledek obsahuje "aa|bb|a\n|bb| |\nAA||a\n||a||\n||\naa|bb||cc"
        And Vygenerovany shell skript je "cat $FILENAME | pr -mts'|' $COLUMN_FILE /dev/stdin | awk -F '|' -v OFS='|' '{t=$1;$1=$2;$2=$3;$3=t;print;}'"
