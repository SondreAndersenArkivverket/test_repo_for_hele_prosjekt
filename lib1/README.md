# Test shared library


How to add this repo: https://stackoverflow.com/a/59718369



# Push new code
https://dev.to/luscasleo/creating-and-publishing-a-python-lib-with-poetry-and-git-11bp


```sh
poetry version <version> # Dette er det som legges til i .toml filen
git add .
git commit -m "New version"
git push
```


# How to install with Poetry

```
[tool.poetry.dependencies]
python = "^3.10"
lib1 = {git = "ssh://git@github.com:SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git", subdirectory = "lib1"
}
```

**Can we use `Poetry add`?**


# How to PIP install this

*Not tested*

https://github.com/python-poetry/poetry/issues/755#issuecomment-451000247

**Med token:**
```sh
pip install -e git+https://<token>@github.com/<user>/<repo>.git@<branch>#egg=<package>&subdirectory=src
```

**Uten token:**
```sh
pip install -e git+https://github.com/<user>/<repo>.git@<branch>#egg=<package>&subdirectory=src
```