function initPwmOutput(blk)
%% Initialzation function of the RespiratorCtrlLib/Inputs/PWM Output block
%
%   Input
%
%       blk     [char]
%
%           PWM Output block to set
%
%   Ouput
%
%       None
%
%%

pinFunc = get_param(blk, 'pinFunc');
pinName = get_param(blk, 'pinSelected');
pwmFreq = get_param(blk, 'pwmFreq');

try
    
    pinNumber = eval(['int32(ePinout.', pinName, ');']);
    
catch
    
    pinName = '!!! ERROR !!!';
    pinNumber = int32(ePinout.NC);
    
end

set_param([blk, '/Set on value changed/MBED_PWM_OUT'], 'Pin', mat2str(pinNumber));
set_param([blk, '/Set on value changed/MBED_PWM_OUT'], 'InitialFrequency', pwmFreq);
set_param([blk, '/Set on value changed/MBED_PWM_OUT'], 'InitialDutyCycle', '0');


% Update mask display
maskDisplay = ['PWM OUT\n', pinFunc, ': ', pinName,'\n', pwmFreq, ' Hz'];

blkMask = Simulink.Mask.get(gcb);
blkMask.set('Display', ['disp(', char(39), maskDisplay, char(39), ')']);

end