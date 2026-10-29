@echo off
setlocal
cd /d "%~dp0"
title Generar APK - ALVITEC MARTINEZ

echo ================================================
echo   ALVITEC MARTINEZ - GENERADOR DE APK
echo ================================================
echo.

if not exist "gradlew.bat" (
  echo ERROR: No se encuentra gradlew.bat en esta carpeta.
  echo Abre Android Studio y usa File ^> Sync Project with Gradle Files.
  echo Despues, ejecuta Build ^> Build APK(s).
  echo.
  pause
  exit /b 1
)

echo Compilando la aplicacion. Puede tardar varios minutos...
echo.
call gradlew.bat clean assembleDebug
if errorlevel 1 (
  echo.
  echo ERROR: La compilacion fallo. Toma una captura de las ultimas lineas.
  pause
  exit /b 1
)

if not exist "app\build\outputs\apk\debug\app-debug.apk" (
  echo.
  echo La compilacion termino, pero no se encontro app-debug.apk.
  echo Revisa el mensaje de Gradle anterior.
  pause
  exit /b 1
)

copy /y "app\build\outputs\apk\debug\app-debug.apk" "ALVITEC_MARTINEZ.apk" >nul
if errorlevel 1 (
  echo No se pudo copiar el APK a esta carpeta.
  pause
  exit /b 1
)

echo.
echo ================================================
echo APK CREADA: ALVITEC_MARTINEZ.apk
echo Ubicacion: %CD%
echo ================================================
start "" explorer /select,"%CD%\ALVITEC_MARTINEZ.apk"
pause
