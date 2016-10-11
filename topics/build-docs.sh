#!/usr/bin/env bash

# This file is part of CWCCFG.
#
# CWCCFG is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# CWCCFG is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with CWCCFG.  If not, see <http://www.gnu.org/licenses/>.

set -e
set -u
set -o pipefail

# GitLab Pages requirement
output_dir="public"

build_docs() {
    local adoc_file_dir

    rm -rf public
    mkdir public
    find docs -name '*.adoc' -print0 | while IFS= read -r -d '' adoc_file; do
        adoc_file_dir="$(dirname "${adoc_file}")"
        asciidoctor \
            --backend html5 \
            --destination-dir "${output_dir}/${adoc_file_dir##docs}" \
            --safe \
            "${adoc_file}";
    done
}

build_docs "$@"
