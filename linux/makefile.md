expand shell command

```makefile
SHELL               := /bin/bash
templates           := $(shell for f in ../deploy/templates/config/shop*; do basename $$f; done)

what:
	@echo $(templates)
```

```bash
make what
shop-1.74.0.yml shop-1.83.0.yml shop-1.90.0.yml
```

the same with makefile expansion

```makefile
templates           := $(notdir $(wildcard $(deploy_template_dir)/shop*.yml))
```
