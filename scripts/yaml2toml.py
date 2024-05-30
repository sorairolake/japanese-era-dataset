#!/usr/bin/env python3

# SPDX-FileCopyrightText: None
#
# SPDX-License-Identifier: CC0-1.0

from pathlib import Path
from typing import Final

import tomli_w
import yaml

ASSETS_DIR: Final[Path] = Path(__file__).resolve().parent.parent / "assets"
YAML_DIR: Final[Path] = ASSETS_DIR / "yaml"
TOML_DIR: Final[Path] = ASSETS_DIR / "toml"


def remove_none(data):
    if isinstance(data, dict):
        return {k: remove_none(v) for k, v in data.items() if v is not None}
    return data


for yaml_file in YAML_DIR.iterdir():
    with yaml_file.open("rb") as f:
        data = yaml.safe_load(f)

    data = remove_none(data)

    toml_file = TOML_DIR / (yaml_file.stem + ".toml")
    with toml_file.open("wb") as f:
        tomli_w.dump(data, f)
