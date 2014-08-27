; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "X-Copter Studio server"
#define MyAppVersion "0.1"
#define MyAppPublisher "X-Copter Studio team"
#define MyAppURL "http://drones.ms.mff.cuni.cz/xcs/wiki"
#define MyAppExeName "run.bat"
#define XCSdir "C:\Users\Ondrap\Documents\xcs"
#define NODEdir "C:\Users\Ondrap\Documents\xcs-installer\windows"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{4CB39538-9A66-402B-A28B-9EB1029C9965}
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
OutputBaseFilename=xcs_server_setup
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=poweruser

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Components]
Name: "main"; Description: "Main Files"; Types: full compact custom; Flags: fixed
Name: "nodejs"; Description: "Nodejs"; Types: full

[Files]
Source: "{#NODEdir}\node.msi"; DestDir: "{tmp}"; Components: nodejs
Source: "{#XCSdir}\server\run.bat"; DestDir: "{app}"; Flags: ignoreversion; Components: main
Source: "{#XCSdir}\server\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main
Source: "{#XCSdir}\server\setup.bat"; DestDir: "{app}"; Flags: ignoreversion; Components: main
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}";
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\node.msi"""; Components: nodejs
Filename: "{app}\setup.bat"; Flags: shellexec;
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent;

