# Test shared library


How to add this repo: https://stackoverflow.com/a/59718369



# Push new code
https://dev.to/luscasleo/creating-and-publishing-a-python-lib-with-poetry-and-git-11bp

We store the code for this package in a subdirectory of our project repository.

When we want to deploy a new version of the package we need to commit the changes to the `main` branch in Github, and then
run the code in Makefile in order to change the version number and tag the new commit with a new version number. This can be done by
running `make version v=<version number>`

*We need a version tag to be able to specify which version of the package we want.* -> https://stackoverflow.com/a/55526482



# Poetry

Using this package with Poetry.

## How to install with Poetry

```
[tool.poetry.dependencies]
python = "^3.10"
lib1 = {git = "git@github.com:SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git", subdirectory = "lib1"}
```

## Install specific version

```
lib1 = { git = "git@github.com:SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git", subdirectory = "lib1", rev = "v0.0.1" }
```

**Can we use `Poetry add`?**

## How to get the newest version of this package

Run: `poetry update`

## How to update this package

Make the changes to the code. Then run `poetry version x.x.x` then push the code to Github.


# How to PIP install this

*Not tested*

https://github.com/python-poetry/poetry/issues/755#issuecomment-451000247

**Med token:**
```sh
pip install -e git+https://<token>@github.com/<user>/<repo>.git@<branch>#egg=<package>&subdirectory=src
```

**Uten token:**
```sh
pip install -e git+https://github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@main#egg=<package>&subdirectory=src
```

Obs. `-e` means editable, so that means it always get the newest version from Github! (Might not be what we want?)