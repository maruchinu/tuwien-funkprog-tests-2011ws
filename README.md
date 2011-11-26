# Testfallsammlung für Funktionale Programmierung, WS 2011

TU Wien, Knoop

## Tutorial für die g0

Damit das alles funktioniert, muss das test-framework installiert sein. Das könnt ihr auf der g0 mit folgenden Befehlen machen. (Es wird in eurem Home-Verzeichnis in .cabal installiert). Bin mir zwar nicht sicher, ob alles notwendig ist, aber schaden tut es sicher nicht.

Vorbedingungen:
    
    $ cabal install test-framework
    $ cabal install test-framework-quickcheck
    $ cabal install test-framework-quickcheck2
    $ cabal install test-framework-hunit
    
Dann wechselt ihr in das Verzeichnis, in dem ihr die Testfallsammlung haben wollt und klont das Git-Repository.
    
Herunterladen:
    
    $ git clone git://github.com/maruchinu/tuwien-funkprog-tests-2011ws.git

Das Testskript hält sich an die Standard-Abgabe-Nomenklatur der Dateien und sucht daher unter ~/Gruppe/ nach den Abgabedateien. Ihr könnt die Tests daher irgendwohin installieren und es sollte trotzdem funktionieren.

Tests durchführen:

    $ sh <tests path>/test6.sh
    
Später dann halt eine andere Zahl hinter das 'test', je nach Abgabeblatt (test7, test8, ...).
    
## Damit alles mit euren Abgabedateien klappt

Euere Ausarbeitungen müssen im Modul 'Main' sein, weil es von den Testfällen importiert wird. Also entweder einfach kein Modul angeben, oder eben explizit das Modul 'Main'.

(Aber, wenn ihr eh Module verwendet, werdet ihr das wahrscheinlich eh bemerken ;)

## Beitragen

Ich bitte natürlich um Mitarbeit eurerseits, damit die Sammlung sich erweitern kann und nicht stirbt ;)

Also entweder ihr forkt das Repository auf Github, oder ihr schreibt mir eine Nachricht auf GitHub und ich füge euch zum Repository hinzu, dann könnt ihr auch committen.

## Danke

Danke an alle, die sich letztes Semester an der Übersetzerbau-Testsammlung beteiligt haben, an der das hier angelehnt ist. Hat damals super geklappt und ich hoffe das lässt sich hier fortsetzen.