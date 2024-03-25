@echo on

:: see https://github.com/boostorg/system/issues/32#issuecomment-462912013
set "CXXFLAGS=%CXXFLAGS% /DHAVE_SNPRINTF=1"

mkdir _build
cd _build

:: Configure
cmake ../dxtbx "-DCMAKE_INSTALL_PREFIX=%PREFIX%" "-DPython_EXECUTABLE=%PYTHON%"
if %errorlevel% neq 0 exit /b %errorlevel%

:: Build
cmake --build . --config Release
if %errorlevel% neq 0 exit /b %errorlevel%

:: Install Binary libraries
cmake --install . --config Release
if %errorlevel% neq 0 exit /b %errorlevel%

:: Install python package
"%PYTHON%" -mpip install -v ../dxtbx
if %errorlevel% neq 0 exit /b %errorlevel%

