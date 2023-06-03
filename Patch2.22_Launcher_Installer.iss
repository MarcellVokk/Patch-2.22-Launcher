#define MyAppName "Patch 2.22 Launcher"
#define MyAppExeName "PatchLauncherBFME.exe"
#define MyAppExeVersion "1.0.1.18"

[Setup]
AppName={#MyAppName}
AppId=Patch 2.22 Launcher
AppVersion={#MyAppExeVersion}
AppVerName={#MyAppName}
WizardStyle=modern
DefaultDirName=C:\{#MyAppName}
DefaultGroupName={#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
VersionInfoDescription=Patch 2.22 Launcher Setup
VersionInfoProductName=Patch 2.22 Launcher
OutputDir=setup
OutputBaseFilename=BFMELauncherSetup
DisableWelcomePage=no
PrivilegesRequired=admin
MissingMessagesWarning=yes
NotRecognizedMessagesWarning=yes
Compression=lzma2
SolidCompression=yes
ShowLanguageDialog=yes
WizardImageFile=setup.bmp
LicenseFile=ReadMe.txt
SetupIconFile=MainIcon.ico
VersionInfoVersion={#MyAppExeVersion}
AppSupportURL=https://discord.com/invite/Q5Yyy3XCuu
AppPublisher=Raphael Vogel
AppPublisherURL=https://github.com/Ravo92

ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: de; MessagesFile: "compiler:Languages\German.isl"

[Messages]
en.BeveledLabel=English
de.BeveledLabel=Deutsch

[Files]
Source: "BFME_Launcher\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion
Source: "BFME_Launcher\{#MyAppExeName}"; DestDir: "{app}"

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; Check: Not FileExists(ExpandConstant('{userdesktop}\{#MyAppName}.lnk')) 

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[UninstallDelete]
Type: filesandordirs; Name: "Downloads"

[InstallDelete]
Type: files; Name: "{app}\Accessibility.dll"
Type: files; Name: "{app}\api-ms-win-core-console-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-console-l1-2-0.dll"
Type: files; Name: "{app}\api-ms-win-core-datetime-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-debug-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-errorhandling-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-fibers-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-file-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-file-l1-2-0.dll"
Type: files; Name: "{app}\api-ms-win-core-file-l2-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-handle-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-heap-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-interlocked-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-libraryloader-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-localization-l1-2-0.dll"
Type: files; Name: "{app}\api-ms-win-core-memory-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-namedpipe-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-processenvironment-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-processthreads-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-processthreads-l1-1-1.dll"
Type: files; Name: "{app}\api-ms-win-core-profile-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-rtlsupport-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-string-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-synch-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-synch-l1-2-0.dll"
Type: files; Name: "{app}\api-ms-win-core-sysinfo-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-timezone-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-core-util-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-conio-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-convert-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-environment-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-filesystem-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-heap-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-locale-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-math-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-multibyte-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-private-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-process-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-runtime-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-stdio-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-string-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-time-l1-1-0.dll"
Type: files; Name: "{app}\api-ms-win-crt-utility-l1-1-0.dll"
Type: files; Name: "{app}\AutoUpdater.NET.dll"
Type: files; Name: "{app}\clretwrc.dll"
Type: files; Name: "{app}\clrjit.dll"
Type: files; Name: "{app}\coreclr.dll"
Type: files; Name: "{app}\createdump.exe"
Type: files; Name: "{app}\D3DCompiler_47_cor3.dll"
Type: files; Name: "{app}\dbgshim.dll"
Type: files; Name: "{app}\DirectWriteForwarder.dll"
Type: files; Name: "{app}\Downloader.dll"
Type: files; Name: "{app}\Helper.dll"
Type: files; Name: "{app}\Helper.pdb"
Type: files; Name: "{app}\hostfxr.dll"
Type: files; Name: "{app}\hostpolicy.dll"
Type: files; Name: "{app}\Microsoft.CSharp.dll"
Type: files; Name: "{app}\Microsoft.DiaSymReader.Native.amd64.dll"
Type: files; Name: "{app}\Microsoft.VisualBasic.Core.dll"
Type: files; Name: "{app}\Microsoft.VisualBasic.dll"
Type: files; Name: "{app}\Microsoft.VisualBasic.Forms.dll"
Type: files; Name: "{app}\Microsoft.Web.WebView2.Core.dll"
Type: files; Name: "{app}\Microsoft.Web.WebView2.WinForms.dll"
Type: files; Name: "{app}\Microsoft.Web.WebView2.Wpf.dll"
Type: files; Name: "{app}\Microsoft.Win32.Primitives.dll"
Type: files; Name: "{app}\Microsoft.Win32.Registry.AccessControl.dll"
Type: files; Name: "{app}\Microsoft.Win32.Registry.dll"
Type: files; Name: "{app}\Microsoft.Win32.SystemEvents.dll"
Type: files; Name: "{app}\mscordaccore.dll"
Type: files; Name: "{app}\mscordaccore_amd64_amd64_6.0.1322.58009.dll"
Type: files; Name: "{app}\mscordaccore_amd64_amd64_6.0.1623.17311.dll"
Type: files; Name: "{app}\mscordbi.dll"
Type: files; Name: "{app}\mscorlib.dll"
Type: files; Name: "{app}\mscorrc.dll"
Type: files; Name: "{app}\msquic.dll"
Type: files; Name: "{app}\netstandard.dll"
Type: files; Name: "{app}\Newtonsoft.Json.dll"
Type: files; Name: "{app}\PatchBetaUpdate_BFME1.xml"
Type: files; Name: "{app}\PatchLauncherBFME.deps.json"
Type: files; Name: "{app}\PatchLauncherBFME.dll"
Type: files; Name: "{app}\PatchLauncherBFME.dll.config"
Type: files; Name: "{app}\PatchLauncherBFME.exe"
Type: files; Name: "{app}\PatchLauncherBFME.pdb"
Type: files; Name: "{app}\PatchLauncherBFME.runtimeconfig.json"
Type: files; Name: "{app}\PatchUpdate_BFME1.xml"
Type: files; Name: "{app}\PenImc_cor3.dll"
Type: files; Name: "{app}\PresentationCore.dll"
Type: files; Name: "{app}\PresentationFramework-SystemCore.dll"
Type: files; Name: "{app}\PresentationFramework-SystemData.dll"
Type: files; Name: "{app}\PresentationFramework-SystemDrawing.dll"
Type: files; Name: "{app}\PresentationFramework-SystemXml.dll"
Type: files; Name: "{app}\PresentationFramework-SystemXmlLinq.dll"
Type: files; Name: "{app}\PresentationFramework.Aero.dll"
Type: files; Name: "{app}\PresentationFramework.Aero2.dll"
Type: files; Name: "{app}\PresentationFramework.AeroLite.dll"
Type: files; Name: "{app}\PresentationFramework.Classic.dll"
Type: files; Name: "{app}\PresentationFramework.dll"
Type: files; Name: "{app}\PresentationFramework.Luna.dll"
Type: files; Name: "{app}\PresentationFramework.Royale.dll"
Type: files; Name: "{app}\PresentationNative_cor3.dll"
Type: files; Name: "{app}\PresentationUI.dll"
Type: files; Name: "{app}\ReachFramework.dll"
Type: files; Name: "{app}\SevenZipExtractor.dll"
Type: files; Name: "{app}\SharpDX.dll"
Type: files; Name: "{app}\SharpDX.XAudio2.dll"
Type: files; Name: "{app}\System.AppContext.dll"
Type: files; Name: "{app}\System.Buffers.dll"
Type: files; Name: "{app}\System.CodeDom.dll"
Type: files; Name: "{app}\System.Collections.Concurrent.dll"
Type: files; Name: "{app}\System.Collections.dll"
Type: files; Name: "{app}\System.Collections.Immutable.dll"
Type: files; Name: "{app}\System.Collections.NonGeneric.dll"
Type: files; Name: "{app}\System.Collections.Specialized.dll"
Type: files; Name: "{app}\System.ComponentModel.Annotations.dll"
Type: files; Name: "{app}\System.ComponentModel.DataAnnotations.dll"
Type: files; Name: "{app}\System.ComponentModel.dll"
Type: files; Name: "{app}\System.ComponentModel.EventBasedAsync.dll"
Type: files; Name: "{app}\System.ComponentModel.Primitives.dll"
Type: files; Name: "{app}\System.ComponentModel.TypeConverter.dll"
Type: files; Name: "{app}\System.Configuration.ConfigurationManager.dll"
Type: files; Name: "{app}\System.Configuration.dll"
Type: files; Name: "{app}\System.Console.dll"
Type: files; Name: "{app}\System.Core.dll"
Type: files; Name: "{app}\System.Data.Common.dll"
Type: files; Name: "{app}\System.Data.DataSetExtensions.dll"
Type: files; Name: "{app}\System.Data.dll"
Type: files; Name: "{app}\System.Design.dll"
Type: files; Name: "{app}\System.Diagnostics.Contracts.dll"
Type: files; Name: "{app}\System.Diagnostics.Debug.dll"
Type: files; Name: "{app}\System.Diagnostics.DiagnosticSource.dll"
Type: files; Name: "{app}\System.Diagnostics.EventLog.dll"
Type: files; Name: "{app}\System.Diagnostics.EventLog.Messages.dll"
Type: files; Name: "{app}\System.Diagnostics.FileVersionInfo.dll"
Type: files; Name: "{app}\System.Diagnostics.PerformanceCounter.dll"
Type: files; Name: "{app}\System.Diagnostics.Process.dll"
Type: files; Name: "{app}\System.Diagnostics.StackTrace.dll"
Type: files; Name: "{app}\System.Diagnostics.TextWriterTraceListener.dll"
Type: files; Name: "{app}\System.Diagnostics.Tools.dll"
Type: files; Name: "{app}\System.Diagnostics.TraceSource.dll"
Type: files; Name: "{app}\System.Diagnostics.Tracing.dll"
Type: files; Name: "{app}\System.DirectoryServices.dll"
Type: files; Name: "{app}\System.dll"
Type: files; Name: "{app}\System.Drawing.Common.dll"
Type: files; Name: "{app}\System.Drawing.Design.dll"
Type: files; Name: "{app}\System.Drawing.dll"
Type: files; Name: "{app}\System.Drawing.Primitives.dll"
Type: files; Name: "{app}\System.Dynamic.Runtime.dll"
Type: files; Name: "{app}\System.Formats.Asn1.dll"
Type: files; Name: "{app}\System.Globalization.Calendars.dll"
Type: files; Name: "{app}\System.Globalization.dll"
Type: files; Name: "{app}\System.Globalization.Extensions.dll"
Type: files; Name: "{app}\System.IO.Compression.Brotli.dll"
Type: files; Name: "{app}\System.IO.Compression.dll"
Type: files; Name: "{app}\System.IO.Compression.FileSystem.dll"
Type: files; Name: "{app}\System.IO.Compression.Native.dll"
Type: files; Name: "{app}\System.IO.Compression.ZipFile.dll"
Type: files; Name: "{app}\System.IO.dll"
Type: files; Name: "{app}\System.IO.FileSystem.AccessControl.dll"
Type: files; Name: "{app}\System.IO.FileSystem.dll"
Type: files; Name: "{app}\System.IO.FileSystem.DriveInfo.dll"
Type: files; Name: "{app}\System.IO.FileSystem.Primitives.dll"
Type: files; Name: "{app}\System.IO.FileSystem.Watcher.dll"
Type: files; Name: "{app}\System.IO.IsolatedStorage.dll"
Type: files; Name: "{app}\System.IO.MemoryMappedFiles.dll"
Type: files; Name: "{app}\System.IO.Packaging.dll"
Type: files; Name: "{app}\System.IO.Pipes.AccessControl.dll"
Type: files; Name: "{app}\System.IO.Pipes.dll"
Type: files; Name: "{app}\System.IO.UnmanagedMemoryStream.dll"
Type: files; Name: "{app}\System.Linq.dll"
Type: files; Name: "{app}\System.Linq.Expressions.dll"
Type: files; Name: "{app}\System.Linq.Parallel.dll"
Type: files; Name: "{app}\System.Linq.Queryable.dll"
Type: files; Name: "{app}\System.Memory.dll"
Type: files; Name: "{app}\System.Net.dll"
Type: files; Name: "{app}\System.Net.Http.dll"
Type: files; Name: "{app}\System.Net.Http.Json.dll"
Type: files; Name: "{app}\System.Net.HttpListener.dll"
Type: files; Name: "{app}\System.Net.Mail.dll"
Type: files; Name: "{app}\System.Net.NameResolution.dll"
Type: files; Name: "{app}\System.Net.NetworkInformation.dll"
Type: files; Name: "{app}\System.Net.Ping.dll"
Type: files; Name: "{app}\System.Net.Primitives.dll"
Type: files; Name: "{app}\System.Net.Quic.dll"
Type: files; Name: "{app}\System.Net.Requests.dll"
Type: files; Name: "{app}\System.Net.Security.dll"
Type: files; Name: "{app}\System.Net.ServicePoint.dll"
Type: files; Name: "{app}\System.Net.Sockets.dll"
Type: files; Name: "{app}\System.Net.WebClient.dll"
Type: files; Name: "{app}\System.Net.WebHeaderCollection.dll"
Type: files; Name: "{app}\System.Net.WebProxy.dll"
Type: files; Name: "{app}\System.Net.WebSockets.Client.dll"
Type: files; Name: "{app}\System.Net.WebSockets.dll"
Type: files; Name: "{app}\System.Numerics.dll"
Type: files; Name: "{app}\System.Numerics.Vectors.dll"
Type: files; Name: "{app}\System.ObjectModel.dll"
Type: files; Name: "{app}\System.Printing.dll"
Type: files; Name: "{app}\System.Private.CoreLib.dll"
Type: files; Name: "{app}\System.Private.DataContractSerialization.dll"
Type: files; Name: "{app}\System.Private.Uri.dll"
Type: files; Name: "{app}\System.Private.Xml.dll"
Type: files; Name: "{app}\System.Private.Xml.Linq.dll"
Type: files; Name: "{app}\System.Reflection.DispatchProxy.dll"
Type: files; Name: "{app}\System.Reflection.dll"
Type: files; Name: "{app}\System.Reflection.Emit.dll"
Type: files; Name: "{app}\System.Reflection.Emit.ILGeneration.dll"
Type: files; Name: "{app}\System.Reflection.Emit.Lightweight.dll"
Type: files; Name: "{app}\System.Reflection.Extensions.dll"
Type: files; Name: "{app}\System.Reflection.Metadata.dll"
Type: files; Name: "{app}\System.Reflection.Primitives.dll"
Type: files; Name: "{app}\System.Reflection.TypeExtensions.dll"
Type: files; Name: "{app}\System.Resources.Extensions.dll"
Type: files; Name: "{app}\System.Resources.Reader.dll"
Type: files; Name: "{app}\System.Resources.ResourceManager.dll"
Type: files; Name: "{app}\System.Resources.Writer.dll"
Type: files; Name: "{app}\System.Runtime.CompilerServices.Unsafe.dll"
Type: files; Name: "{app}\System.Runtime.CompilerServices.VisualC.dll"
Type: files; Name: "{app}\System.Runtime.dll"
Type: files; Name: "{app}\System.Runtime.Extensions.dll"
Type: files; Name: "{app}\System.Runtime.Handles.dll"
Type: files; Name: "{app}\System.Runtime.InteropServices.dll"
Type: files; Name: "{app}\System.Runtime.InteropServices.RuntimeInformation.dll"
Type: files; Name: "{app}\System.Runtime.Intrinsics.dll"
Type: files; Name: "{app}\System.Runtime.Loader.dll"
Type: files; Name: "{app}\System.Runtime.Numerics.dll"
Type: files; Name: "{app}\System.Runtime.Serialization.dll"
Type: files; Name: "{app}\System.Runtime.Serialization.Formatters.dll"
Type: files; Name: "{app}\System.Runtime.Serialization.Json.dll"
Type: files; Name: "{app}\System.Runtime.Serialization.Primitives.dll"
Type: files; Name: "{app}\System.Runtime.Serialization.Xml.dll"
Type: files; Name: "{app}\System.Security.AccessControl.dll"
Type: files; Name: "{app}\System.Security.Claims.dll"
Type: files; Name: "{app}\System.Security.Cryptography.Algorithms.dll"
Type: files; Name: "{app}\System.Security.Cryptography.Cng.dll"
Type: files; Name: "{app}\System.Security.Cryptography.Csp.dll"
Type: files; Name: "{app}\System.Security.Cryptography.Encoding.dll"
Type: files; Name: "{app}\System.Security.Cryptography.OpenSsl.dll"
Type: files; Name: "{app}\System.Security.Cryptography.Pkcs.dll"
Type: files; Name: "{app}\System.Security.Cryptography.Primitives.dll"
Type: files; Name: "{app}\System.Security.Cryptography.ProtectedData.dll"
Type: files; Name: "{app}\System.Security.Cryptography.X509Certificates.dll"
Type: files; Name: "{app}\System.Security.Cryptography.Xml.dll"
Type: files; Name: "{app}\System.Security.dll"
Type: files; Name: "{app}\System.Security.Permissions.dll"
Type: files; Name: "{app}\System.Security.Principal.dll"
Type: files; Name: "{app}\System.Security.Principal.Windows.dll"
Type: files; Name: "{app}\System.Security.SecureString.dll"
Type: files; Name: "{app}\System.ServiceModel.Web.dll"
Type: files; Name: "{app}\System.ServiceProcess.dll"
Type: files; Name: "{app}\System.Text.Encoding.CodePages.dll"
Type: files; Name: "{app}\System.Text.Encoding.dll"
Type: files; Name: "{app}\System.Text.Encoding.Extensions.dll"
Type: files; Name: "{app}\System.Text.Encodings.Web.dll"
Type: files; Name: "{app}\System.Text.Json.dll"
Type: files; Name: "{app}\System.Text.RegularExpressions.dll"
Type: files; Name: "{app}\System.Threading.AccessControl.dll"
Type: files; Name: "{app}\System.Threading.Channels.dll"
Type: files; Name: "{app}\System.Threading.dll"
Type: files; Name: "{app}\System.Threading.Overlapped.dll"
Type: files; Name: "{app}\System.Threading.Tasks.Dataflow.dll"
Type: files; Name: "{app}\System.Threading.Tasks.dll"
Type: files; Name: "{app}\System.Threading.Tasks.Extensions.dll"
Type: files; Name: "{app}\System.Threading.Tasks.Parallel.dll"
Type: files; Name: "{app}\System.Threading.Thread.dll"
Type: files; Name: "{app}\System.Threading.ThreadPool.dll"
Type: files; Name: "{app}\System.Threading.Timer.dll"
Type: files; Name: "{app}\System.Transactions.dll"
Type: files; Name: "{app}\System.Transactions.Local.dll"
Type: files; Name: "{app}\System.ValueTuple.dll"
Type: files; Name: "{app}\System.Web.dll"
Type: files; Name: "{app}\System.Web.HttpUtility.dll"
Type: files; Name: "{app}\System.Windows.Controls.Ribbon.dll"
Type: files; Name: "{app}\System.Windows.dll"
Type: files; Name: "{app}\System.Windows.Extensions.dll"
Type: files; Name: "{app}\System.Windows.Forms.Design.dll"
Type: files; Name: "{app}\System.Windows.Forms.Design.Editors.dll"
Type: files; Name: "{app}\System.Windows.Forms.dll"
Type: files; Name: "{app}\System.Windows.Forms.Primitives.dll"
Type: files; Name: "{app}\System.Windows.Input.Manipulations.dll"
Type: files; Name: "{app}\System.Windows.Presentation.dll"
Type: files; Name: "{app}\System.Xaml.dll"
Type: files; Name: "{app}\System.Xml.dll"
Type: files; Name: "{app}\System.Xml.Linq.dll"
Type: files; Name: "{app}\System.Xml.ReaderWriter.dll"
Type: files; Name: "{app}\System.Xml.Serialization.dll"
Type: files; Name: "{app}\System.Xml.XDocument.dll"
Type: files; Name: "{app}\System.Xml.XmlDocument.dll"
Type: files; Name: "{app}\System.Xml.XmlSerializer.dll"
Type: files; Name: "{app}\System.Xml.XPath.dll"
Type: files; Name: "{app}\System.Xml.XPath.XDocument.dll"
Type: files; Name: "{app}\ucrtbase.dll"
Type: files; Name: "{app}\UIAutomationClient.dll"
Type: files; Name: "{app}\UIAutomationClientSideProviders.dll"
Type: files; Name: "{app}\UIAutomationProvider.dll"
Type: files; Name: "{app}\UIAutomationTypes.dll"
Type: files; Name: "{app}\unins000.dat"
Type: files; Name: "{app}\unins000.exe"
Type: files; Name: "{app}\vcruntime140_cor3.dll"
Type: files; Name: "{app}\WebView2Loader.dll"
Type: files; Name: "{app}\webView2_Version.log"
Type: files; Name: "{app}\WindowsBase.dll"
Type: files; Name: "{app}\WindowsFormsIntegration.dll"
Type: files; Name: "{app}\wpfgfx_cor3.dll"
Type: files; Name: "{app}\webView2_Version.log"

[Run]
Filename: {app}\{#MyAppExeName}; Description: "Launch Application after Install"; Flags: postinstall shellexec nowait unchecked skipifsilent;
Filename: {app}\{#MyAppExeName}; Flags: postinstall nowait shellexec skipifnotsilent