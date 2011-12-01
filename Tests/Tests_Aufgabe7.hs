module Tests_Aufgabe6 where

import Main

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit

import Test.HUnit

tests = [
            testGroup "Eq BTree" [
                testCase "Eq_BTree_1"    eq_BTree_1,
                testCase "Eq_BTree_2"    eq_BTree_2,
                testCase "Eq_BTree_3"    eq_BTree_3,
                testCase "Eq_BTree_4"    eq_BTree_4
            ],
            
            testGroup "Eq LTree" [
                testCase "Eq_LTree_4" eq_LTree_1,
                testCase "Eq_LTree_4" eq_LTree_2,
                testCase "Eq_LTree_4" eq_LTree_3,
                testCase "Eq_LTree_4" eq_LTree_4
            ],
            
            testGroup "instance Structure BTree" [
                testCase "i_s_BTree_1" i_s_BTree_1,
                testCase "i_s_BTree_2" i_s_BTree_2,
                testCase "i_s_BTree_3" i_s_BTree_3,
                testCase "i_s_BTree_4" i_s_BTree_4
            ],
            
            testGroup "instance Structure LTree" [
                testCase "i_s_LTree_1" i_s_LTree_1,
                testCase "i_s_LTree_2" i_s_LTree_2,
                testCase "i_s_LTree_3" i_s_LTree_3,
                testCase "i_s_LTree_4" i_s_LTree_4
            ],
            
            testGroup "instance Structure ALgraph" [
                testCase "i_s_ALgraph_1" i_s_ALgraph_1,
                testCase "i_s_ALgraph_2" i_s_ALgraph_2,
                testCase "i_s_ALgraph_3" i_s_ALgraph_3,
                testCase "i_s_ALgraph_4" i_s_ALgraph_4
            ],
            
            testGroup "accept" [
                testCase "accept_1" accept_1,
                testCase "accept_2" accept_2,
                testCase "accept_3" accept_3,
                testCase "accept_4" accept_4
            ]
        ]

-- Testfaelle 1a: Eq LTree
eq_BTree_1 = assertEqual "Eq_BTree_1" (True)  ((BLeaf 1 "a") == (BLeaf 2 "a"))
eq_BTree_2 = assertEqual "Eq_BTree_2" (False) ((BLeaf 1 "a") == (BLeaf 1 "ab"))
eq_BTree_3 = assertEqual "Eq_BTree_3" (False) ((BLeaf 1 "a") == (BNode 3 "a" (BLeaf 1 "a") (BLeaf 2 "ab")))
eq_BTree_4 = assertEqual "Eq_BTree_4" (True)  ((BNode 3 "a" (BLeaf 1 "a") (BLeaf 2 "ab")) == (BNode 4 "a" (BLeaf 5 "a") (BLeaf 6 "ab")))

-- Testfaelle 1b: Eq LTree
eq_LTree_1 = assertEqual "eq_LTree_1" (True)  (LNode 0 2 [] == LNode 3 2 [])
eq_LTree_2 = assertEqual "eq_LTree_2" (True)  (LNode 11 1 [(LNode (x+5) x) [] | x <- [1..10]]) == (LNode 11 1 [(LNode (x+5) x) [] | x <- [1..10]])
eq_LTree_3 = assertEqual "eq_LTree_3" (False) (LNode 11 1 [(LNode (x+5) x) [] | x <- [1..10]]) == (LNode 11 1 [(LNode (x+33) x [(LNode ((100*x)+y-30) (y+2) []) | y <- [0..x]] ) | x <- [1..10]])
eq_LTree_4 = assertEqual "eq_LTree_4" (True)  (LNode 11 1 [(LNode (x+33) x [(LNode ((100*x)+y-30) (y+2) []) | y <- [0..x]] ) | x <- [1..10]]) == (LNode 11 1 [(LNode (x+5)  x [(LNode ((100*x)+y+10) (y+2) []) | y <- [0..x]] ) | x <- [1..10]])

-- Testfaelle 2a: instance Structure BTree
i_s_BTree_1  = assertEqual "i_s_BTree_1" (1)  (noOfSources (BNode 1 "a" (BLeaf 2 "b") (BLeaf 3 "c")))
i_s_BTree_2  = assertEqual "i_s_BTree_2" (2)  (noOfSinks (BNode 1 "a" (BLeaf 2 "b") (BLeaf 3 "c")))
i_s_BTree_3  = assertEqual "i_s_BTree_3" ([]) (notSourceConnected (BNode 1 "a" (BLeaf 2 "b") (BLeaf 3 "c")))
i_s_BTree_4  = assertEqual "i_s_BTree_4" ([]) (notSinkConnected (BNode 1 "a" (BLeaf 2 "b") (BLeaf 3 "c")))

-- Testfaelle 2b: instance Structure LTree
i_s_LTree_1  = assertEqual "i_s_LTree_1" (1)  (noOfSources (LNode 1 "a" [LNode 2 "b" [],LNode 3 "c" []]))
i_s_LTree_2  = assertEqual "i_s_LTree_2" (2)  (noOfSinks (LNode 1 "a" [LNode 2 "b" [],LNode 3 "c" []]))
i_s_LTree_3  = assertEqual "i_s_LTree_3" ([]) (notSourceConnected (LNode 1 "a" [LNode 2 "b" [],LNode 3 "c" []]))
i_s_LTree_4  = assertEqual "i_s_LTree_4" ([]) (notSinkConnected (LNode 1 "a" [LNode 2 "b" [],LNode 3 "c" []]))

-- Testfaelle 2c: instance Structure ALgraph
i_s_ALgraph_1  = assertEqual "i_s_ALgraph_1" (1)       (noOfSources (ALg [(1,[2]),(2,[1]),(3,[2])]))
i_s_ALgraph_2  = assertEqual "i_s_ALgraph_2" (0)       (noOfSinks (ALg [(1,[2]),(2,[1]),(3,[2])]))
i_s_ALgraph_3  = assertEqual "i_s_ALgraph_3" ([])      (notSourceConnected (ALg [(1,[2]),(2,[1]),(3,[2])]))
i_s_ALgraph_4  = assertEqual "i_s_ALgraph_4" ([1,2,3]) (notSinkConnected (ALg [(1,[2]),(2,[1]),(3,[2])]))

-- Testfaelle 3:
accept_1  = assertEqual "accept_1" (True)  ( accept (AMg [(["de","a","c","b"]),(["de","a","c","b"]),(["de","a","c",""]),(["de","a","","b"])]) 0 [0,2,3] "abbbacccdededeebab" )
accept_2  = assertEqual "accept_2" (False) ( accept (AMg [(["de","a","c","b"]),(["de","a","c","b"]),(["de","a","c",""]),(["de","a","","b"])]) 0 [0,2,3] "abbbacccdededeecbab" )
accept_3  = assertEqual "accept_3" (False) ( accept (AMg [(["de","a","c","b"]),(["de","a","c","b"]),(["de","a","c",""]),(["de","a","","b"])]) 0 [0,2,3] "abbbacccdededeebaba" )
accept_4  = assertEqual "accept_4" (False) ( accept (AMg [(["de","a","c","b"]),(["de","a","c","b"]),(["de","a","c",""]),(["de","a","","b"])]) 0 [0,2,3] "abbbacccdededeebcab" )
accept_5  = assertEqual "accept_5" (True)  ( accept (AMg [(["de","a","c","b"]),(["de","a","c","b"]),(["de","a","c",""]),(["de","a","","b"])]) 0 [0,2,3] "" )

-- Main Methode zum Aufrufen der Tests
main = defaultMain tests
