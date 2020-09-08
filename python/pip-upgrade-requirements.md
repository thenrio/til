sof https://stackoverflow.com/questions/24764549/upgrade-python-packages-from-requirements-txt-using-pip-command

pip freeze includes dependencies, test dependencies.
When I have separate requirements, then best tool is pip-upgrader (IHMO).

```sh
pip-upgrade requirements.txt
pip-upgrade requirements-test.txt
```
