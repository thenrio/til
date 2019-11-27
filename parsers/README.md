approaches
==========

* parser generator
  generator -> grammar -> parser

* parser combinator
  chomps bytes from functions (parsers), outputs (something, rest)

What approach to choose? see this [sof](https://softwareengineering.stackexchange.com/questions/338665/when-to-use-a-parser-combinator-when-to-use-a-parser-generator).

grammars
========
token: terminal expression, can not be cut.
expression: group of tokens or expressions.
context free: what is around a token is not important to how to use it.

http://blog.reverberate.org/2013/07/ll-and-lr-parsing-demystified.html
http://blog.reverberate.org/2013/09/ll-and-lr-in-context-why-parsing-tools.html

LALR
====
lex, yacc family.
Zach Kessin
https://get-finch.com/2017/04/09/lex_and_yacc.html
