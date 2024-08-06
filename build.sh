rm -rf arm
mkdir -p arm
pushd arm
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../CrossCompile.cmake .. -G "MinGW Makefiles"
cmake --build . --config Release 
# make -j4

