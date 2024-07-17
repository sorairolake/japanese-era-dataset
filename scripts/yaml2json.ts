#!/usr/bin/env -S deno run --allow-read --allow-write

// SPDX-FileCopyrightText: 2024 Shun Sakai
//
// SPDX-License-Identifier: CC0-1.0

import * as path from "@std/path";
import * as yaml from "@std/yaml";

const assetsDir = path.join(
  path.dirname(path.dirname(path.fromFileUrl(import.meta.url))),
  "assets",
);
const yamlDir = path.join(assetsDir, "yaml");
const jsonDir = path.join(assetsDir, "json");

for await (const dirEntry of Deno.readDir(yamlDir)) {
  const yamlFile = path.join(yamlDir, dirEntry.name);
  const inputText = await Deno.readTextFile(yamlFile);
  const data = yaml.parse(inputText);

  const jsonFile = path.join(jsonDir, path.parse(yamlFile).name + ".json");
  const jsonString = JSON.stringify(data, null, 2);
  await Deno.writeTextFile(jsonFile, jsonString);
}
