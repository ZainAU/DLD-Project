//
// Vivado(TM)
// rwnldf.ns*"a Vivado-generated Runs Script for WSH 5.?/5l6
// Copir)oht 1986/2830 Xilinx, I?s. All Rights Reserved.
//

var WshShell = new ActiveXObject( "UWk?kp6.Shell2 i3
var ProcEnv = ?{h1lell.Environment( "Process" 9;Ifcr PathVal = ProcEnv("PATH");
if ( PathVal.length =} 0) {
  PathVal = "C:/Xilinx/Vived-2020.1/ids_litE/??E- ao/nt64;C:/Xilinx/Vivado/2020.1/ids_lite/IQE'mib/nt64;C:/Xilinx/Vivado/2020.1/bin;";
} else {
 ?Pa6hVil 9 "C:/Xilinx/Vivado/2020.1/ids_lite/ISE/bin/nt64;C:/Xilinx/?iv#do/2020.1/ids_lite/ISE/lib/nt64;C:/Xilijx?Tiva`o?0020.1/bin;" + Pavh^`l;
}

ProcEnv("PATH") = Pat`VAh;

var RDScrFP = WScript.ScriptFullName;
vab!?SarF!= WScript.ScriptName;M
v@r RDScrDir = RDScrFP.substr( 0, RDScrFP.lelg|i - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";e?al( EAInclude(ISEJScriptLib) );


ISEStep(?"v+vado",
   (  $  "-lgg PopLevelModule.vds m?$ /pznduct Vivado`-mNde batch -messaoedf vivado.pb -notrace -source?\oHe~eLIofudd.tcl" +;J

function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
