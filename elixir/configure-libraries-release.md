https://michal.muskala.eu/2017/07/30/configuring-elixir-libraries.html
makes sense.

logging
=======
`./bin/lift start` has side effect `./var/log/erlang.log.1`

what is this?

related

* https://elixirforum.com/t/rotating-logs-in-otp-releases/2377
  which suggest not using release :) but rather systemd and mix...

* http://fmcgeough.github.io/phoenix-logging/
  which points then to http://erlang.org/doc/man/run_erl.html#environment_variables and RUN_ERL_LOG_MAXSIZE

* more generally https://www.cogini.com/blog/best-practices-for-deploying-elixir-apps/
  which points to

  1) release.
  2) use systemd and start release foreground.
