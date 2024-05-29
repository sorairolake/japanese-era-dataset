#!/usr/bin/env python3

# SPDX-FileCopyrightText: None
#
# SPDX-License-Identifier: CC0-1.0

from pathlib import Path
from typing import Final

import tomllib
import yaml

ASSETS_DIR: Final[Path] = Path(__file__).resolve().parent.parent / "assets"
TOML_DIR: Final[Path] = ASSETS_DIR / "toml"
YAML_DIR: Final[Path] = ASSETS_DIR / "yaml"

for toml_file in TOML_DIR.iterdir():
    with toml_file.open("rb") as f:
        data = tomllib.load(f)

    for era in data["era"].values():
        era.setdefault("end")

    yaml_file = YAML_DIR / (toml_file.stem + ".yaml")
    with yaml_file.open("w") as f:
        yaml.dump(data, f, allow_unicode=True)
