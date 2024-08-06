if not defined DevEnvDir (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
)
set PATH=%PATH%;D:\Qt\Tools\QtCreator\bin\jom
mkdir build
pushd build
cmake -G "NMake Makefiles JOM" ..
chcp 65001
jom
popd
@REM pause