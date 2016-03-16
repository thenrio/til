
like so

    erl -sname test -setcookie $( cat files/.erlang.cookie ) -remsh rabbit@FRGBMRFIDBUSL2


> cookie is not a file

(rabbit@FRGBMRFIDBUSL2)3> net_adm:ping( rabbit@FRGBMRFIDBUSL1 ).
pong

> `rabbit@FRGBMRFIDBUSL1` is a valid atom

another

		erl -sname debugger -setcookie products -remsh products@pokayoke

> it works on an node started by elixir
