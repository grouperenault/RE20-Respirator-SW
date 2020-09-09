function initAnalogicRead(blk)
%% Initialzation function of the RespiratorCtrlLib/Inputs/Analogic Read block
%
%   Input
%
%       blk     [char]
%
%           Analogic Read block to set
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

set_param([blk, '/MBED_ANA_IN'], 'Pin', mat2str(pinNumber));
set_param([blk, '/MBED_ANA_IN'], 'SampleTime', sampleTime);

% Update mask display
maskDisplay = ['Analogic IN\n', pinFunc, ': ', pinName];

blkMask = Simulink.Mask.get(gcb);
blkMask.set('Display', ['disp(', char(39), maskDisplay, char(39), ')']);

end