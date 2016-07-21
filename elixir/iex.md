`man iex` is deceptive :)

`iex --help` shows more options, mostly

* --sname
* --cookie
* -pr, -pa, -pz

see

* [there](http://elixir-lang.org/getting-started/mix-otp/distributed-tasks-and-configuration.html)
* [post](http://benjamintan.io/blog/2014/05/25/connecting-elixir-nodes-on-the-same-lan/)

pry
===
in test test/models/product_test.exs

    require IEx
    IEx.pry

require test to be ran like so

    iex -S mix test test/models/product_test.exs --trace
