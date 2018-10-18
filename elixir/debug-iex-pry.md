pry in test
===========

DO NOT

```bash
mix test test/lift/boot/boot_test.exs
Cannot pry #PID<0.90.0> at test/test_helper.exs:16. Is an IEx shell running?
```

DO

```bash
iex -S mix test test/lift/boot/boot_test.exs
```

because pry requires an IEx shell to connect to and first command does not run one.
