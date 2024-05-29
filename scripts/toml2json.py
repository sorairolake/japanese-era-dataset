#!/usr/bin/env python3

# SPDX-FileCopyrightText: None
#
# SPDX-License-Identifier: CC0-1.0

import json
from pathlib import Path
from typing import Final

import tomllib

ASSETS_DIR: Final[Path] = Path(__file__).resolve().parent.parent / "assets"
TOML_DIR: Final[Path] = ASSETS_DIR / "toml"
JSON_DIR: Final[Path] = ASSETS_DIR / "json"

for toml_file in TOML_DIR.iterdir():
    with toml_file.open("rb") as f:
        data = tomllib.load(f)

    for era in data["era"].values():
        era.setdefault("end")

    json_file = JSON_DIR / (toml_file.stem + ".json")
    with json_file.open("w") as f:
        json.dump(data, f, ensure_ascii=False, indent=2, default=str)
