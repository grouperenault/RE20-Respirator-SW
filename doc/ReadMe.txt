RSR COVID-19 Respirator software for Nucleo F411RE board Simulink Project

Models tree

	NucleoRespirator.slx 				[Code generation model for Nucleo F411RE]
	|
	--  RespiratorControl.slx 			[Full respirator controle model]
		|
		-- UserCommands.slx 			[User command processing model]
		|
		-- InputProcessing.slx 			[Sensors scaling model]
		|
		-- PressureControl.slx 			[Respirator air pressure control model]
        |   Uses "PressureControlData.sldd" Simulink data dictionary
		|
		-- RespiratorAlarms.slx 		[System alarms model]
		|
		-- LCDScreenControl.slx.slx 	[LCD Screen management model]
		|
		-- Telemetry.slx 				[Serial line data transmission control model]
		
Simulink library "RespiratorCtrlLib.slx" contains common or generic blocks		
All models are linked to the "RespiratorControlData.sldd" Simulink data dictionary
"PressureControlData.sldd" Simulink data dictionary is included in "RespiratorControlData.sldd" Simulink data dictionary