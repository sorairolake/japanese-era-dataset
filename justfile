# SPDX-FileCopyrightText: None
#
# SPDX-License-Identifier: CC0-1.0

alias all := default

# Run default recipe
default: fmt

# Run the formatter
@fmt:
    taplo format assets/toml/*.toml pyproject.toml

# Run the linter
@lint:
    taplo lint assets/toml/*.toml pyproject.toml

# Run the formatter for the Python scripts
@python-fmt:
    ruff format .

# Run the linter for the Python scripts
@python-lint:
    ruff check .

# Apply lint suggestions for the Python scripts
@python-lint-fix:
    ruff check --fix .

# Run `mypy`
@python-type-check:
    mypy .

# Generate the JSON files
@generate-json:
    python3 scripts/toml2json.py

# Generate the YAML files
@generate-yaml:
    python3 scripts/toml2yaml.py

# Run the linter for GitHub Actions workflow files
@lint-github-actions:
    actionlint -verbose
