module Tests_Aufgabe6 where

import Main

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit

import Test.HUnit

tests = [
            testGroup "6.1 flatten" [
                testCase "flatten t1 Infix"    flatten_base_1,
                testCase "flatten t2 Infix"    flatten_base_2,
                testCase "flatten t2 GInfix"   flatten_base_3,
                testCase "flatten t2 Praefix"  flatten_base_4,
                testCase "flatten t2 GPostfix" flatten_base_5
            ],
            
            testGroup "6.2 isST" [
                testCase "isST t1" isST_base_1,
                testCase "isST t2" isST_base_2,
                testCase "isST t3" isST_base_3,
                testCase "isST t4" isST_base_4
            ],
            
            testGroup "6.3a mkControl" [
                testCase "mkControl 'abclmr'" mkControl_prefix,
                testCase "mkControl 'lmrabc'" mkControl_postfix,
                testCase "mkControl 'lambrc'" mkControl_mixed,
                testCase "mkControl ''"       mkControl_empty
            ],
            
            testGroup "6.3b apply" [
                testCase "apply ['r','l','l','m'] 5 t1" apply_base_1,
                testCase "apply ['r','l','l','m'] 5 t2" apply_base_2,
                testCase "apply ['m','l'] 5 t3"         apply_base_3,
                testCase "apply [] 5 t2"                apply_base_4
            ],
            
            testGroup "6.4 mapLT" [
                testCase "mapLT (*2) t1" mapLT_base_1,
                testCase "mapLT (*2) t1" mapLT_base_2,
                testCase "mapLT (*2) t1" mapLT_base_3
            ]
        ]

-- Tests für Aufgabe 6.1: flatten
flatten_t1 = Nil
flatten_t2 = BNode 2 (BNode 3 Nil Nil) (BNode 5 Nil Nil)

flatten_base_1 = assertEqual "flatten t1 Infix" ([])      (flatten flatten_t1 Infix)
flatten_base_2 = assertEqual "flatten t2 Infix" ([3,2,5]) (flatten flatten_t2 Infix)
flatten_base_3 = assertEqual "flatten t2 Infix" ([5,2,3]) (flatten flatten_t2 GInfix)
flatten_base_4 = assertEqual "flatten t2 Infix" ([2,3,5]) (flatten flatten_t2 Praefix)
flatten_base_5 = assertEqual "flatten t2 Infix" ([2,5,3]) (flatten flatten_t2 GPostfix)

-- Tests für Aufgabe 6.2: isSt
isST_t1 = Nil
isST_t2 = BNode 2 (BNode 3 Nil Nil) (BNode 5 Nil Nil) 
isST_t3 = BNode 4 (BNode 3 Nil Nil) (BNode 5 Nil Nil)
isST_t4 = BNode 2 (BNode 3 Nil Nil) (BNode 3 Nil Nil)

isST_base_1 = assertEqual "isST t1" (True)  (isST isST_t1)
isST_base_2 = assertEqual "isST t1" (False) (isST isST_t2)
isST_base_3 = assertEqual "isST t1" (True)  (isST isST_t3)
isST_base_4 = assertEqual "isST t1" (False) (isST isST_t4)

-- Tests für Aufgabe 6.3a: mkControl
mkControl_prefix  = assertEqual "mkControl 'abclmr'" ("lmr") (mkControl "abclmr")
mkControl_postfix = assertEqual "mkControl 'lmrabc'" ("lmr") (mkControl "lmrabc")
mkControl_mixed   = assertEqual "mkControl 'lambrc'" ("lmr") (mkControl "lambrc")
mkControl_empty   = assertEqual "mkControl ''" ("") (mkControl "")

-- Tests für Aufgabe 6.3b: apply
apply_t1 = Leaf (\x->2*x+3)
apply_t2 = Node (*2) (Leaf (*3)) (Leaf (*5)) (Leaf (*7))
apply_t3 = Node (*2) (Leaf (*3)) (Node (+1) (Leaf (*5)) (Leaf (+5)) (Leaf (+2))) (Leaf (*7))

apply_base_1 = assertEqual "apply ['r','l','l','m'] 5 t1" (13) (apply ['r','l','l','m'] 5 apply_t1)
apply_base_2 = assertEqual "apply ['r','l','l','m'] 5 t2" (70) (apply ['r','l','l','m'] 5 apply_t2)
apply_base_3 = assertEqual "apply ['m','l'] 5 t3"         (55) (apply ['m','l'] 5 apply_t3)
apply_base_4 = assertEqual "apply [] 5 t2"                (10) (apply [] 5 apply_t2)

-- Tests für Aufgabe 6.4: mapLt
mapLT_t1 = LNode 5 []
mapLT_t2 = LNode 5 [LNode 10 [], LNode 15 [LNode 20 [], LNode 25 []]]
mapLT_t3 = LNode 5 [LNode 10 [LNode 15 [], LNode 20 [LNode 25 []]]]

mapLT_base_1 = assertEqual "mapLT (*2) t1" (show $ LNode 10 [])                                                 (show $ mapLT (*2) mapLT_t1)
mapLT_base_2 = assertEqual "mapLT (*2) t2" (show $ LNode 10 [LNode 20 [], LNode 30 [LNode 40 [], LNode 50 []]]) (show $ mapLT (*2) mapLT_t2)
mapLT_base_3 = assertEqual "mapLT (*2) t3" (show $ LNode 10 [LNode 20 [LNode 30 [], LNode 40 [LNode 50 []]]])   (show $ mapLT (*2) mapLT_t3)


-- Main Methode zum Aufrufen der Tests
main = defaultMain tests
