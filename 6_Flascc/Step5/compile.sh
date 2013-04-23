# relative command
java -jar ../../../sdk/usr/lib/asc2.jar -merge -md -abcfuture -AS3 -import ../../../sdk/usr/lib/builtin.abc -import ../../../sdk/usr/lib/playerglobal.abc PathFinderWrapper.as

../../../sdk/usr/bin/g++ PathFinderWrapper.abc pathfinder.cpp as3api.cpp main.cpp -emit-swc=com.renaun.flascc -o PathFinder.swc

# full article command
# You need to put Java in your PATH environment variable or use full path to java
#java -jar ~/flascc/sdk/usr/lib/asc2.jar -merge -md -abcfuture -AS3 -import ~/flascc/sdk/usr/lib/builtin.abc -import ~/flascc/sdk/usr/lib/playerglobal.abc PathFinderWrapper.as

#~/flascc/sdk/usr/bin/g++ PathFinderWrapper.abc pathfinder.cpp as3api.cpp main.cpp -emit-swc=com.renaun.flascc -o PathFinder.swc
