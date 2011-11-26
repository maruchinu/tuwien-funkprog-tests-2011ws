#!/bin/bash

BASENAME="Aufgabe6"  # Der Basename der abzugebenden Datei
FILEEXT="hs"         # Die Dateiendung, die wir abgeben muessen

ABGABEFILENAME="$BASENAME.$FILEEXT"
ABGABEFILE="~Gruppe/$ABGABEFILENAME"

DIR="$( cd "$( dirname "$0" )" && pwd )"
TESTBASENAME="Tests_$BASENAME"
TESTFILE="$DIR/Tests/$TESTBASENAME.hs"

echo "$TESTFILE"
echo "$ABGABEFILE"

# Run tests
ghc -e "$TESTBASENAME.main" "$TESTFILE" "$ABGABEFILE"
