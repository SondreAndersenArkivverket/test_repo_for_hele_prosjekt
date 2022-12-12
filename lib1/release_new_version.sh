#!/bin/bash

# Save first parameter
version=$1

# Check that we got a version number as parameter (could maybe have more checks here?)
if [[ ! $version ]]; then
    echo "Please provide a version number, i.e. x.x.x"
    exit 1
fi

# Set version number in poetry 
poetry version $version

git add pyproject.toml
git commit -m "v$(poetry version -s)"
git tag "v$(poetry version -s)"
git push
git push --tags

# Print the new version number
poetry version