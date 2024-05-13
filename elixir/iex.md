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


Interrupt a running command
===========================

Type `C-g` to get into "User switch command", then `i c`.

https://learnyousomeerlang.com/starting-out

> So this is one way to do it (in fact, two ways). But this won't help us if the shell freezes!
> If you were paying attention, when you started the shell, there was a comment about 'aborting with ^G'.
> Let's do that, and then press h to get help!
> If you type in i then c, Erlang should stop the currently running code and bring you back to a responsive shell.
