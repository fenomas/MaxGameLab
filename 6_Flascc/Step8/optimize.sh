# relative commands
../../../sdk/usr/bin/g++ -O4 -c as3api.cpp

cp -f flascc_exports.txt exports.txt

../../../sdk/usr/bin/nm as3api.o | grep " T " | awk '{print $3}' | sed 's/__/_/' >> exports.txt

java -jar ../../../sdk/usr/lib/asc2.jar -merge -md -abcfuture -AS3 -import ../../../sdk/usr/lib/builtin.abc -import ../../../sdk/usr/lib/playerglobal.abc PathFinderWrapper.as

../../../sdk/usr/bin/g++ -O4 -flto-api=exports.txt PathFinderWrapper.abc micropather.cpp pathfinder.cpp as3api.cpp main.cpp -emit-swc=com.renaun.flascc -o PathFinder.swc

# full article command
#~/flascc/sdk/usr/bin/g++ -O4 -c as3api.cpp
#cp -f flascc_exports.txt exports.txt
#~/flascc/sdk/usr/bin/nm as3api.o | grep " T " | awk '{print $3}' | sed 's/__/_/' >> exports.txt

# You need to put Java in your PATH environment variable or use full path to java
#java -jar ~/flascc/sdk/usr/lib/asc2.jar -merge -md -abcfuture -AS3 -import ~/flascc/sdk/usr/lib/builtin.abc -import ~/flascc/sdk/usr/lib/playerglobal.abc PathFinderWrapper.as

#~/flascc/sdk/usr/bin/g++ -O4 -flto-api=exports.txt PathFinderWrapper.abc micropather.cpp pathfinder.cpp as3api.cpp main.cpp -emit-swc=com.renaun.flascc -o PathFinder.swc