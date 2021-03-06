@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  TS_HLA_Object startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and TS_HLA_OBJECT_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\TS_HLA_Object-2.0.0.jar;%APP_HOME%\lib\jfxrt.jar;%APP_HOME%\lib\ETC_FRA_Common-2.0.0.jar;%APP_HOME%\lib\com.springsource.org.dom4j-1.6.1.jar;%APP_HOME%\lib\controlsfx-8.40.10.jar;%APP_HOME%\lib\fr.itcs.sme.architecture.mm_3.0.0.201206041019.jar;%APP_HOME%\lib\fr.itcs.sme.base.api_3.0.0.201206041019.jar;%APP_HOME%\lib\fr.itcs.sme.base.core_3.0.0.201206041019.jar;%APP_HOME%\lib\fr.itcs.sme.base.mm_3.0.0.201206041019.jar;%APP_HOME%\lib\fr.itcs.sme.conception.mm_3.0.0.201206041019.jar;%APP_HOME%\lib\fr.itcs.sme.configuration.mm_3.0.0.201206041019.jar;%APP_HOME%\lib\fr.itcs.sme.deployment.mm_3.0.0.201206041019.jar;%APP_HOME%\lib\fr.itcs.sme.specification.mm_3.0.0.201206041019.jar;%APP_HOME%\lib\jdom-2.0.6.jar;%APP_HOME%\lib\log4j-1.2-api-2.4.1.jar;%APP_HOME%\lib\log4j-api-2.4.1.jar;%APP_HOME%\lib\log4j-core-2.4.1.jar;%APP_HOME%\lib\org.eclipse.core.runtime-3.1.0.jar;%APP_HOME%\lib\org.eclipse.emf.common_2.5.0.v200906151043.jar;%APP_HOME%\lib\org.eclipse.emf.ecore.xmi_2.5.0.v200906151043.jar;%APP_HOME%\lib\org.eclipse.emf.ecore_2.5.0.v200906151043.jar;%APP_HOME%\lib\org.eclipse.emf.edit_2.5.0.v200906151043.jar;%APP_HOME%\lib\probatron.jar;%APP_HOME%\lib\xercesImpl.jar;%APP_HOME%\lib\TC.lib-2.0.1.jar;%APP_HOME%\lib\logback-classic-1.1.3.jar;%APP_HOME%\lib\logback-core-1.1.3.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.10.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.10.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.10.jar;%APP_HOME%\lib\IEEE1516e-2.0.1.jar;%APP_HOME%\lib\json-simple-1.1.1.jar;%APP_HOME%\lib\slf4j-api-1.7.10.jar;%APP_HOME%\lib\junit-4.10.jar;%APP_HOME%\lib\hamcrest-core-1.1.jar

@rem Execute TS_HLA_Object
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %TS_HLA_OBJECT_OPTS%  -classpath "%CLASSPATH%" de.fraunhofer.iosb.testrunner.JMSTestRunner %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable TS_HLA_OBJECT_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%TS_HLA_OBJECT_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
