# Test shared library


# Push new code

We store the code for this package in a subdirectory of our project repository.

All functions or classes that is to be a part of the package must be imported in the `__init__.py` file.

When we want to deploy a new version of the package we need to commit the changes to the `main` branch in Github, and then run the code in [`release_new_version`](release_new_version.sh), while being in the main branch, in order to change the version number and tag the new commit with a new version number. This can be done by running `./release_new_version.sh x.x.x`, where `x.x.x` is a placeholder for the new version we want to release.


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
lib1 = { git = "git@github.com:SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git", subdirectory = "lib1", rev = "v0.0.8" }
```

## How to get the newest version of this package

Run: `poetry update`


# How to PIP install this

`pip install "git+ssh://git@github.com/SondreAndersenArkivverket/test_repo_for_hele_prosjekt.git@v0.0.8#egg=lib1&#subdirectory=lib1"`

This command installs the python package from the `pyproject.toml` file, and does NOT use `.whl`. I have tried, but have not been able to make `.whl` packages work yet.

# Versions

We should probably use something like: https://en.wikipedia.org/wiki/Software_versioning#Semantic_versioning

# Sources

- How to add this repo: https://stackoverflow.com/a/59718369

- https://dev.to/luscasleo/creating-and-publishing-a-python-lib-with-poetry-and-git-11bp
