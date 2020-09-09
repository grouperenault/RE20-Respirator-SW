function initLcdDriver(blk)
%% Initialzation function of the LCD display driver block
%
%   Input
%
%       blk     [char]
%
%           LCD display driver to set
%
%   Ouput
%
%       None
%
%%

maskDisplay = 'LCD Display\nDriver\n';

%RS Pin
[pinNumber, pinName] = getPinNumber(get_param(blk, 'pRS'));
set_param([blk, '/TextLCD_System'], 'RS_Pin', ['int32(', mat2str(pinNumber),')']);
maskDisplay = [maskDisplay,'\n   RS: ', pinName];

%Enable Pin
[pinNumber, pinName] = getPinNumber(get_param(blk, 'pE'));
set_param([blk, '/TextLCD_System'], 'Enable_Pin', ['int32(', mat2str(pinNumber),')']);
maskDisplay = [maskDisplay,'\n     E: ', pinName];

%Data bit 1 Pin
[pinNumber, pinName] = getPinNumber(get_param(blk, 'pDB1'));
set_param([blk, '/TextLCD_System'], 'Data_Pin1', ['int32(', mat2str(pinNumber),')']);
maskDisplay = [maskDisplay,'\n   D1: ', pinName];

%Data bit 2 Pin
[pinNumber, pinName] = getPinNumber(get_param(blk, 'pDB2'));
set_param([blk, '/TextLCD_System'], 'Data_Pin2', ['int32(', mat2str(pinNumber),')']);
maskDisplay = [maskDisplay,'\n   D2: ', pinName];

%Data bit 3 Pin
[pinNumber, pinName] = getPinNumber(get_param(blk, 'pDB3'));
set_param([blk, '/TextLCD_System'], 'Data_Pin3', ['int32(', mat2str(pinNumber),')']);
maskDisplay = [maskDisplay,'\n   D3: ', pinName];

%Data bit 4 Pin
[pinNumber, pinName] = getPinNumber(get_param(blk, 'pDB4'));
set_param([blk, '/TextLCD_System'], 'Data_Pin4', ['int32(', mat2str(pinNumber),')']);
maskDisplay = [maskDisplay,'\n   D4: ', pinName];

blkMask = Simulink.Mask.get(gcb);
blkMask.set('Display', ['disp(', char(39), maskDisplay, char(39), ')']);

% pinFunc = get_param(blk, 'pinFunc');
% pinName = get_param(blk, 'pinSelected');
% sampleTime = get_param(blk, 'TS');
% 
% try
%     
%     pinNumber = eval(['int32(ePinout.', pinName, ');']);
%     
% catch
%     
%     pinName = '!!! ERROR !!!';
%     pinNumber = int32(ePinout.NC);
%     
% end
% 
% set_param([blk, '/MBED_ANA_IN'], 'Pin', mat2str(pinNumber));
% set_param([blk, '/MBED_ANA_IN'], 'SampleTime', sampleTime);
% 
% % Update mask display
% maskDisplay = ['Analogic IN\n', pinFunc, ': ', pinName];
% 
% blkMask = Simulink.Mask.get(gcb);
% blkMask.set('Display', ['disp(', char(39), maskDisplay, char(39), ')']);

end

%%
function [pinNumber, pinNameOut] = getPinNumber(pinNameIn)

try
    
    pinNumber = eval(['int32(ePinout.', pinNameIn, ');']);
    pinNameOut = pinNameIn;
    
catch
    
    pinNameOut = '!!! ERROR !!!';
    pinNumber = int32(ePinout.NC);
    
end

end