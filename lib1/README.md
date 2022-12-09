# Test shared library


# Push new code

We store the code for this package in a subdirectory of our project repository.

All functions or classes that is to be a part of the package must be imported in the `__init__.py` file.

When we want to deploy a new version of the package we need to commit the changes to the `main` branch in Github, and then
run the code in [`Makefile`](Makefile) in order to change the version number and tag the new commit with a new version number. This can be done by
running `make version v=<version number>`.

Makefile:
```make
version:
	@poetry version $(v)
	@git add pyproject.toml
	@git commit -m "v$$(poetry version -s)"
	@git tag v$$(poetry version -s)
	@git push
	@git push --tags
	@poetry version
```

Note: We need a version tag to be able to specify which version of the package we want. -> https://stackoverflow.com/a/55526482


# Poetry

Using this package with Poetry.

## How to install with Poetry

```
[tool.poetry.dependencies]
...
lib1 = {git = "git@github.com:SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git", subdirectory = "lib1"}
```

## Install specific version

The version of the package we want to install can be specified with `rev = "vx.x.x`:

```
[tool.poetry.dependencies]
...
lib1 = { git = "git@github.com:SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git", subdirectory = "lib1", rev = "v0.0.1" }
```

## How to get the newest version of this package

Run: `poetry update`


# How to PIP install this

*Have not been able to make this work yet.*

*Notes:*
- Tried: `pip install -e git+ssh://git@github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@main#egg=lib1&subdirectory=lib1`
- Tried: `pip install git+ssh://git@github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@main#egg=lib1&subdirectory=lib1`
- Tried: `pip install "git+https://github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@main#egg=lib1&subdirectory=lib1"`
- Worked: `pip install "git+https://github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@main#egg=lib1&#subdirectory=lib1"`
- Testing now: `pip install git+ssh://git@github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@main#egg=lib1#subdirectory=lib1`



https://github.com/python-poetry/poetry/issues/755#issuecomment-451000247

**Med token:**
```sh
pip install -e git+https://<token>@github.com/<user>/<repo>.git@<branch>#egg=<package>&subdirectory=src
```

**Uten token:**
```sh
pip install -e git+https://github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@main#subdirectory=lib1
```

Obs. `-e` means editable, so that means it always get the newest version from Github! (Might not be what we want?)

# Versions

We should probably use something like: https://en.wikipedia.org/wiki/Software_versioning#Semantic_versioning


# Sources

- How to add this repo: https://stackoverflow.com/a/59718369

- https://dev.to/luscasleo/creating-and-publishing-a-python-lib-with-poetry-and-git-11bp
