@echo off
if "%~d0"=="\\" (
  echo ..
  echo ..De workspace maakt van een zogenaamd UNC path gebruik en
  echo ..dat wordt niet gesupport.
  echo ..Maak een nieuwe directory aan bv c:\workspaces 
  echo ..Gebruik deze bij het opstarten van eclipse als workspace
  echo ..Herhaal vervolgens de import
  echo ..bowerupdate wordt afgebroken
  pause
  goto :eof
)

%~d0
cd %~dp0
echo checking whether node.js is installed
echo ..please be patient
echo ...........................................
call npm list --depth 0 --global bower >nul 2>&1
if errorlevel 1 (
	echo bower niet aanwezig. 
	echo ..now installing. 
	echo ..please be patient.................
	echo on
	call npm install -g bower
) else (
  echo ..bower al aanwezig
  echo on
)

call bower install --save Polymer/polymer

call bower install --save PolymerElements/iron-icons
call bower install --save PolymerElements/iron-pages
call bower install --save PolymerElements/iron-selector

call bower install --save PolymerElements/paper-icon-button
call bower install --save PolymerElements/paper-material
call bower install --save PolymerElements/paper-styles

call bower install --save PolymerElements/app-layout

call bower install --save PolymerElements/app-route

call bower install --save PolymerElements/iron-ajax
call bower install --save PolymerElements/iron-icon
call bower install --save PolymerElements/iron-flex-layout

call bower install --save PolymerElements/paper-button
call bower install --save PolymerElements/paper-checkbox
call bower install --save PolymerElements/paper-input
call bower install --save PolymerElements/paper-toast

call bower update
echo bowerupdate gereed
pause
