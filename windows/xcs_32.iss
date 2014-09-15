; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "X-Copter Studio onboard"
#define MyAppVersion "0.3"
#define MyAppPublisher "X-Copter Studio team"
#define MyAppURL "http://www.drones.ms.mff.cuni.cz/xcs/wiki"
#define MyAppExeName "onboard.bat"
#define XCSdir "C:\Users\Ondrap\Documents\xcs_32"
#define MSVCP100dir "C:\Users\Ondrap\Documents\xcs-installer\windows"
#define BuildType "Release"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5E803928-712C-4449-BC09-A46006CE9790}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=C:\Users\Ondrap\Documents\xcs_installer
OutputBaseFilename=xcs_onboard_setup
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes
PrivilegesRequired=admin

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; OnlyBelowVersion: 0,6.1

[Components]
Name: "main"; Description: "X-Copter Studio"; Types: full compact custom; Flags: fixed
Name: "source"; Description: "Developer files"; Types: full compact
Name: "doc"; Description: "Documentation"; Types: full

[Files]
;icon
;Source: "{#XCSdir}\logo.ico"; DestDir: "{app}"; Flags: ignoreversion; Components: main
;documentation
Source: "{#XCSdir}\onboard\doc\*.pdf"; DestDir: "{app}\doc"; Flags: ignoreversion; Components: doc
Source: "{#XCSdir}\onboard\doc\html\*"; DestDir: "{app}\doc\developer_doc"; Flags: ignoreversion; Components: doc
;bat files
Source: "{#XCSdir}\onboard\onboard.bat"; DestDir: "{app}"; Flags: ignoreversion; Components: main
;urbi
Source: "{#XCSdir}\3rd-party\urbi\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main
Source: "{#XCSdir}\3rd-party\urbi\lib\*"; DestDir: "{app}\lib"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main
Source: "{#XCSdir}\3rd-party\urbi\include\*"; DestDir: "{app}\include"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: source
Source: "{#XCSdir}\3rd-party\urbi\share\*"; DestDir: "{app}\share"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main
;urbiscripts
Source: "{#XCSdir}\onboard\urbiscript\onboard\*"; DestDir: "{app}\share\xcs\urbiscript\onboard"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main

;xobjects
Source: "{#XCSdir}\onboard\build\bin\{#BuildType}\xline_drawer.dll"; DestDir: "{app}\lib\xcs\xobjects"; Flags: ignoreversion; Components: main 
Source: "{#XCSdir}\onboard\build\lib\{#BuildType}\*.dll"; DestDir: "{app}\lib\xcs\xobjects"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\onboard\build\lib\{#BuildType}\xobject.lib"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\onboard\build\bin\{#BuildType}\*.dll"; DestDir: "{app}\bin"; Excludes: "xlinedrawer.dll"; Flags: ignoreversion; Components: main
;xcs source files
;xcs
Source: "{#XCSdir}\onboard\src\xcs\exception.hpp"; DestDir: "{app}\include\xcs"; Flags: ignoreversion; Components: source
Source: "{#XCSdir}\onboard\src\xcs\logging.hpp"; DestDir: "{app}\include\xcs"; Flags: ignoreversion; Components: source
Source: "{#XCSdir}\onboard\src\xcs\pid.hpp"; DestDir: "{app}\include\xcs"; Flags: ignoreversion; Components: source
Source: "{#XCSdir}\onboard\build\xcs\xcs_export.h"; DestDir: "{app}\include\xcs"; Flags: ignoreversion; Components: source
;xci
Source: "{#XCSdir}\onboard\src\xcs\xci\xci.hpp"; DestDir: "{app}\include\xcs\xci"; Flags: ignoreversion; Components: source
;xobject
Source: "{#XCSdir}\onboard\src\xcs\nodes\xobject\x.h"; DestDir: "{app}\include\xcs\nodes\xobject"; Flags: ignoreversion; Components: source
Source: "{#XCSdir}\onboard\src\xcs\nodes\xobject\*.hpp"; DestDir: "{app}\include\xcs\nodes\xobject"; Flags: ignoreversion; Components: source
Source: "{#XCSdir}\onboard\build\xcs\nodes\xobject\xobject_export.h"; DestDir: "{app}\include\xcs\nodes\xobject"; Flags: ignoreversion; Components: source
;xstructs
Source: "{#XCSdir}\onboard\src\xcs\types\*"; DestDir: "{app}\include\xcs\types"; Excludes: "type_utils.hpp"; Flags: ignoreversion; Components: source

;xcs general cmakes
Source: "{#XCSdir}\onboard\src\cmake\FindUrbiAll.cmake"; DestDir: "{app}\share\cmake\xcs"; Flags: ignoreversion; Components: source

;xcs example xobject
Source: "{#XCSdir}\onboard\src\xcs\nodes\pid.xob\CMakeLists_example.txt"; DestName: "CMakeLists.txt"; DestDir: "{app}\share\xcs\examples\nodes\pid.xob"; Flags: ignoreversion; Components: source;
Source: "{#XCSdir}\onboard\src\xcs\nodes\pid.xob\x_pid.hpp"; DestDir: "{app}\share\xcs\examples\nodes\pid.xob"; Flags: ignoreversion; Components: source;
Source: "{#XCSdir}\onboard\src\xcs\nodes\pid.xob\x_pid.cpp"; DestDir: "{app}\share\xcs\examples\nodes\pid.xob"; Flags: ignoreversion; Components: source;

;console scripts
Source: "{#XCSdir}\onboard\data\scripts\*"; DestDir: "{app}\data\scripts"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main
;logs file
Source: "{#XCSdir}\onboard\data\logs\*"; DestDir: "{app}\data\logs"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main
;xsettings files
Source: "{#XCSdir}\onboard\data\settings\*"; DestDir: "{app}\data\settings"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main
;dfg settings
Source: "{#XCSdir}\onboard\data\dfgs\*"; DestDir: "{app}\data\dfgs"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main

;3-rd party files
;windows files
Source: "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT\msvcp120.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT\msvcr120.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#MSVCP100dir}\msvcp100.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#MSVCP100dir}\msvcr100.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
;blast lapack
Source: "{#XCSdir}\3rd-party\blas\libblas.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\3rd-party\lapack\liblapack.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
;boost libraries
Source: "{#XCSdir}\3rd-party\boost\lib\boost_system-vc120-mt-1_55.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\3rd-party\boost\lib\boost_filesystem-vc120-mt-1_55.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\3rd-party\boost\lib\boost_log-vc120-mt-1_55.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\3rd-party\boost\lib\boost_chrono-vc120-mt-1_55.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\3rd-party\boost\lib\boost_date_time-vc120-mt-1_55.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\3rd-party\boost\lib\boost_thread-vc120-mt-1_55.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\3rd-party\boost\lib\boost_regex-vc120-mt-1_55.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main

Source: "{#XCSdir}\3rd-party\boost\lib\*.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: source
Source: "{#XCSdir}\3rd-party\boost\lib\*.lib"; DestDir: "{app}\lib"; Flags: ignoreversion; Components: source
Source: "{#XCSdir}\3rd-party\boost\include\boost-1_55\*"; DestDir: "{app}\include"; Flags: recursesubdirs createallsubdirs ignoreversion; Components: source
;opencv libraries
Source: "{#XCSdir}\3rd-party\opencv\x86\vc12\bin\*.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main

;libav
Source: "{#XCSdir}\3rd-party\libav\bin\*.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main
;pthread
Source: "{#XCSdir}\3rd-party\pthreads\dll\x86\pthreadVC2.dll"; DestDir: "{app}\bin"; Flags: ignoreversion; Components: main


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; 
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}";
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}";
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon;
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon;

[Run]
;Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
ValueType: expandsz; ValueName: "URBI_PATH"; ValueData: "{app}\share\xcs\urbiscript\onboard";        \
Flags: uninsdeletevalue

Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
ValueType: expandsz; ValueName: "URBI_UOBJECT_PATH"; ValueData: "{app}\lib\xcs\xobjects";   \
Flags: uninsdeletevalue