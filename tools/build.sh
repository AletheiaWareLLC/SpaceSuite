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
#set -x

# Protobuf
echo "*** Build BC"
(cd BC && ./build.sh --java_out=lite:../BCJava/source/)
echo "*** Build Alias"
(cd Alias && ./build.sh --java_out=lite:../AliasJava/source/)
echo "*** Build Finance"
(cd Finance && ./build.sh --java_out=lite:../FinanceJava/source/)
echo "*** Build Space"
(cd Space && ./build.sh --java_out=lite:../SpaceJava/source/)

# Java
echo "*** Build AletheiaWareCommonJava"
(cd AletheiaWareCommonJava && ./build.sh)
echo "*** Build BCJava"
(cd BCJava && ./build.sh)
echo "*** Build AliasJava"
(cd AliasJava && ./build.sh)
echo "*** Build FinanceJava"
(cd FinanceJava && ./build.sh)
echo "*** Build SpaceJava"
(cd SpaceJava && ./build.sh)

# Gradle-based builds
echo "*** Build AletheiaWareCommonAndroid"
(cd AletheiaWareCommonAndroid && ./gradlew build)
echo "*** Build BCAndroid"
(cd BCAndroid && ./gradlew build)
echo "*** Build SpaceAndroid"
(cd SpaceAndroid && ./gradlew build)
