# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""This script is used to synthesize generated parts of this library."""

from synthtool import _tracked_paths
import synthtool as s
import synthtool.log as log
import synthtool.shell as shell
import synthtool.sources.git as git
import logging

logging.basicConfig(level=logging.DEBUG)

generator_url = "https://github.com/dart-lang/discoveryapis_generator.git"
client_url = "https://github.com/dart-lang/googleapis.git"

log.debug(f"Cloning {generator_url}.")
generator = git.clone(generator_url, depth=1)
log.debug(f"Cloning {client_url}.")
client = git.clone(client_url, depth=1)

log.debug("Installing dependencies.")
shell.run("pub get".split(), cwd=generator)

log.debug("Generating all libraries.")
shell.run("mkdir dart_out".split(), cwd=generator)
shell.run(f"dart bin/generate.dart package -o dart_out -i {client}/discovery/googleapis")

# copy src, test, samples directories
s.copy(generator / "dart_out", "generated/googleapis")

log.debug("Generating all beta libraries.")
shell.run("mkdir dart_out_beta".split(), cwd=generator)
shell.run(f"dart bin/generate.dart package -o dart_out -i {client}/discovery/googleapis_beta")

# copy src, test, samples directories
s.copy(generator / "dart_out_beta", "generated/googleapis_beta")
