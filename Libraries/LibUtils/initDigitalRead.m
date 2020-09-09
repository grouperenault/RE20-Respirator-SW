function initDigitalRead(blk)
%% Initialzation function of the RespiratorCtrlLib/Inputs/Digital Read block
%
%   Input
%
%       blk     [char]
%
%           Digital Read block to set
%
%   Ouput
%
%       None
%
%%

pinFunc = get_param(blk, 'pinFunc');
pinName = get_param(blk, 'pinSelected');
sampleTime = get_param(blk, 'TS');

try
    
    pinNumber = eval(['int32(ePinout.', pinName, ');']);
    
catch
    
    pinName = '!!! ERROR !!!';
    pinNumber = int32(ePinout.NC);
    
end

set_param([blk, '/MBED_DIG_IN'], 'Pin', mat2str(pinNumber));
set_param([blk, '/MBED_DIG_IN'], 'SampleTime', sampleTime);

% Update mask display
maskDisplay = ['Digital IN\n', pinFunc, ': ', pinName];

blkMask = Simulink.Mask.get(gcb);
blkMask.set('Display', ['disp(', char(39), maskDisplay, char(39), ')']);

end