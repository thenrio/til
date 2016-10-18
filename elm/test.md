[article](https://medium.com/@_rchaves_/testing-in-elm-93ad05ee1832#.8vp2wcb6t)

separate elm-package.json
=========================
module A depends on package P
P is in src/elm-package.json

test it with node-elm-test ?
then add P also in tests/elm-package.json

current state: core
===================

is using elm-community/elm-test == 1.1.0
current version is 2.1.0
:)

find out that current version is ok with node test runner (npm install -g elm-test)...
