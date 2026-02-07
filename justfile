# SPDX-FileCopyrightText: 2024 Shun Sakai
#
# SPDX-License-Identifier: CC0-1.0

export DENO_NO_PACKAGE_JSON := "1"

# Run default recipe
_default:
    just -l

# Run the formatter
fmt:
    npx prettier -w assets/yaml/*.yaml

# Run the linter
lint:
    uvx yamllint -s assets/yaml/*.yaml

# Run `deno fmt`
deno-fmt:
    deno fmt deno.jsonc scripts/*.ts

# Run `deno lint`
deno-lint:
    deno lint scripts/*.ts

# Run `deno check`
deno-type-check:
    deno check scripts/*.ts

# Generate the JSON files
generate-json:
    deno run --allow-read --allow-write scripts/yaml2json.ts

# Run the linter for GitHub Actions workflow files
lint-github-actions:
    actionlint -verbose
