/*
	This file is part of H2rename.

	Copyright (C) 2009 by Harald Bögeholz / c't Magazin für Computertechnik
	www.ctmagazin.de

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

OutFile "release\H2rename-setup.exe"
Name "H2rename"
RequestExecutionLevel admin
InstallDir $PROGRAMFILES64\H2rename
SetCompressor /SOLID lzma
LicenseData license.txt
Unicode True
ManifestDPIAware true
; Show details by default
ShowInstDetails show


Page license
Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles


Section "Installer"
	SetOutPath $INSTDIR
	SetShellVarContext all
	File release\H2rename.exe
	File release\license.txt
	File release\COPYING
	File C:\Qt\6.9.3\mingw_64\bin\Qt6Concurrent.dll
	File C:\Qt\6.9.3\mingw_64\bin\Qt6Core.dll
	File C:\Qt\6.9.3\mingw_64\bin\Qt6Gui.dll
	File C:\Qt\6.9.3\mingw_64\bin\Qt6Network.dll
	File C:\Qt\6.9.3\mingw_64\bin\Qt6Svg.dll
	File C:\Qt\6.9.3\mingw_64\bin\Qt6Widgets.dll
	File C:\Qt\6.9.3\mingw_64\bin\D3Dcompiler_47.dll
	File C:\Qt\6.9.3\mingw_64\bin\libgcc_s_seh-1.dll
	File C:\Qt\6.9.3\mingw_64\bin\libstdc++-6.dll
	File C:\Qt\6.9.3\mingw_64\bin\libwinpthread-1.dll
	File C:\Qt\6.9.3\mingw_64\bin\opengl32sw.dll
	SetOutPath $INSTDIR\generic
	File release\generic\*.*
	SetOutPath $INSTDIR\iconengines
	File release\iconengines\*.*
	SetOutPath $INSTDIR\imageformats
	File release\imageformats\*.*
	SetOutPath $INSTDIR\networkinformation\*
	File release\networkinformation\*.*
	SetOutPath $INSTDIR\styles
	File release\styles\*.*
	SetOutPath $INSTDIR\tls
	File release\tls\*.*
	SetOutPath $INSTDIR\translations
	File release\translations\*.*
	SetOutPath $INSTDIR\platforms
	File release\platforms\*.*
	WriteUninstaller uninstall.exe
	CreateShortCut "$SMPROGRAMS\H2rename.lnk" "$INSTDIR\H2rename.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "DisplayName" "H2rename"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "Publisher" "c't Magazin für Computertechnik"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "URLInfoAbout" "https://www.ctmagazin.de"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "DisplayVersion" "0.8.3"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "VersionMajor" 0
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "VersionMinor" 8
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "NoModify" 3
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename" "NoRepair" 1
SectionEnd

Section "un.Installer"
	SetShellVarContext all

	Delete $INSTDIR\uninstall.exe
	Delete $INSTDIR\H2rename.exe
	Delete $INSTDIR\license.txt
	Delete $INSTDIR\COPYING
	Delete $INSTDIR\Qt6Concurrent.dll
	Delete $INSTDIR\Qt6Core.dll
	Delete $INSTDIR\Qt6Gui.dll
	Delete $INSTDIR\Qt6Network.dll
	Delete $INSTDIR\Qt6Svg.dll
	Delete $INSTDIR\Qt6Widgets.dll
	Delete $INSTDIR\D3Dcompiler_47.dll
	Delete $INSTDIR\libgcc_s_seh-1.dll
	Delete $INSTDIR\libstdc++-6.dll
	Delete $INSTDIR\libwinpthread-1.dll
	Delete $INSTDIR\opengl32sw.dll
	Delete $INSTDIR\generic\*.*
	Delete $INSTDIR\iconengines\*.*
	Delete $INSTDIR\imageformats\*.*
	Delete $INSTDIR\networkinformation\*.*
	Delete $INSTDIR\platforms\*.*
	Delete $INSTDIR\styles\*.*
	Delete $INSTDIR\tls\*.*
	Delete $INSTDIR\translations\*.*
	
	RMDir $INSTDIR\generic
	RMDir $INSTDIR\iconengines
	RMDir $INSTDIR\imageformats
	RMDir $INSTDIR\networkinformation
	RMDir $INSTDIR\platforms
	RMDir $INSTDIR\styles
	RMDir $INSTDIR\tls
	RMDir $INSTDIR\translations

	RMDir $INSTDIR\*.*
	RMDir $INSTDIR
	Delete $SMPROGRAMS\H2rename.lnk
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\H2rename"
SectionEnd
