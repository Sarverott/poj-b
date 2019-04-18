rem powershell -File .\download-files.ps1
rem .\7z.exe e electron-api-demos-windows.zip

setlocal

set NODEJS_FILENAME=node-v6.10.0-x86.msi
set NODEJS_URL=https://nodejs.org/dist/v6.10.0/%NODEJS_FILENAME%
set NODEJS_DOWNLOAD_LOCATION=%cd%

powershell -NoExit -Command "(New-Object Net.WebClient).DownloadFile('%NODEJS_URL%', '%NODEJS_DOWNLOAD_LOCATION%%NODEJS_FILENAME%'); exit;"
msiexec /l* C:\node-log.txt /i %NODEJS_DOWNLOAD_LOCATION%%NODEJS_FILENAME% TARGETDIR="C:\POJ_B\nodejs" ADDLOCAL="NodePerfCtrSupport,NodeEtwSupport,DocumentationShortcuts,EnvironmentPathNode,EnvironmentPathNpmModules,npm,NodeRuntime,EnvironmentPath" /qn

endlocal

npm install -g -D electron

echo cd "%cd%\desktop-server-scheme" > start.bat
echo npm start  >> start.bat

mklink ""%UserProfile%\Desktop\pojeba.lnk" "%cd%\start.bat"
