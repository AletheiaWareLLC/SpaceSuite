#!/bin/bash
#
# Copyright 2019 Aletheia Ware LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
set -x

(cd BC && ./build.sh --java_out=lite:../BCJava/source/)
(cd Alias && ./build.sh --java_out=lite:../AliasJava/source/)
(cd Finance && ./build.sh --java_out=lite:../FinanceJava/source/)
(cd Space && ./build.sh --java_out=lite:../SpaceJava/source/)

(cd AletheiaWareCommonJava && ./build.sh)
(cd BCJava && ./build.sh)
(cd AliasJava && ./build.sh)
(cd FinanceJava && ./build.sh)
(cd SpaceJava && ./build.sh)

(cd AletheiaWareCommonAndroid && ./gradlew build)
(cd BCAndroid && ./gradlew build)
(cd SpaceAndroid && ./gradlew build)
