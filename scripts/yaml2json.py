#!/usr/bin/env python3

# SPDX-FileCopyrightText: None
#
# SPDX-License-Identifier: CC0-1.0

import json
from pathlib import Path
from typing import Final

import yaml

ASSETS_DIR: Final[Path] = Path(__file__).resolve().parent.parent / "assets"
YAML_DIR: Final[Path] = ASSETS_DIR / "yaml"
JSON_DIR: Final[Path] = ASSETS_DIR / "json"

for yaml_file in YAML_DIR.iterdir():
    with yaml_file.open("rb") as f:
        data = yaml.safe_load(f)

    json_file = JSON_DIR / (yaml_file.stem + ".json")
    with json_file.open("w") as f:
        json.dump(data, f, ensure_ascii=False, indent=2, default=str)
