# SPDX-FileCopyrightText: None
#
# SPDX-License-Identifier: CC0-1.0

alias all := default

# Run default recipe
default: fmt

# Run the formatter
@fmt:
    npx prettier -w assets/yaml/*.yaml

# Run the linter
lint:
    #!/usr/bin/env bash
    source venv/bin/activate
    yamllint -s assets/yaml/*.yaml

# Configure a development environment for the Python scripts
setup-python:
    #!/usr/bin/env bash
    python3 -m venv venv
    source venv/bin/activate
    pip3 install PyYAML mypy ruff tomli-w types-PyYAML yamllint

# Run the formatter for the Python scripts
python-fmt:
    #!/usr/bin/env bash
    source venv/bin/activate
    ruff format .

# Run the linter for the Python scripts
python-lint:
    #!/usr/bin/env bash
    source venv/bin/activate
    ruff check .

# Apply lint suggestions for the Python scripts
python-lint-fix:
    #!/usr/bin/env bash
    source venv/bin/activate
    ruff check --fix .

# Run `mypy`
python-type-check:
    #!/usr/bin/env bash
    source venv/bin/activate
    mypy --allow-redefinition .

# Generate the JSON files
generate-json:
    #!/usr/bin/env bash
    source venv/bin/activate
    python3 scripts/yaml2json.py

# Generate the TOML files
generate-toml:
    #!/usr/bin/env bash
    source venv/bin/activate
    python3 scripts/yaml2toml.py

# Run the linter for GitHub Actions workflow files
@lint-github-actions:
    actionlint -verbose
