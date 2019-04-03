#!/usr/bin/env bash
# ----------------------------------------------------------------------------
# Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

npm ci
npm run build

if [[ -z "${CELLERY_HOME}" ]]
then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        CELLERY_HOME=/usr/share/cellery
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        CELLERY_HOME=/Library/Cellery
    fi
fi

sudo rm -rf ${CELLERY_HOME}/docs-view
sudo mkdir -p ${CELLERY_HOME}/docs-view
sudo cp -r ./build/* ${CELLERY_HOME}/docs-view
echo Docs View Installed
