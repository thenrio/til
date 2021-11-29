Have both html and json api?

```sh
mix phx.gen.html Urls Url urls url user_id:integer seq:integer
```

html and json generators do not output same code for controllers.

> See priv/templates/phx.gen.{html,json}/controller.ex in source code...


```sh
$ mix phx.gen.json Urls Url urls --web Api --no-context --no-schema
* creating lib/tiny_web/controllers/api/url_controller.ex
* creating lib/tiny_web/views/api/url_view.ex
* creating test/tiny_web/controllers/api/url_controller_test.exs
* creating lib/tiny_web/views/changeset_view.ex
* creating lib/tiny_web/controllers/fallback_controller.ex
```

Here the `--web` flag controls the namespace of controller!
