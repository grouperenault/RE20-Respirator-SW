function initDigitalWrite(blk)
%% Initialzation function of the RespiratorCtrlLib/Inputs/Digital Write block
%
%   Input
%
%       blk     [char]
%
%           Digital Write block to set
%
%   Ouput
%
%       None
%
%%

pinFunc = get_param(blk, 'pinFunc');
pinName = get_param(blk, 'pinSelected');

try
    
    pinNumber = eval(['int32(ePinout.', pinName, ');']);
    
catch
    
    pinName = '!!! ERROR !!!';
    pinNumber = int32(ePinout.NC);
    
end

set_param([blk, '/Set on value changed/MBED_DIG_OUT'], 'Pin', mat2str(pinNumber));

% Update mask display
maskDisplay = ['Digital OUT\n', pinFunc, ': ', pinName];

blkMask = Simulink.Mask.get(gcb);
blkMask.set('Display', ['disp(', char(39), maskDisplay, char(39), ')']);

end