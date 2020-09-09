function [] = valveOutMode_CB(blk)
%% Valve driver block 'Output Mode' change callback
%  Shows the PWM or PPM settings according to user selection
%
%   Input
%
%       blk     [char]
%
%           Valve driver block to process
%
%   Output
%
%       None
%
%%

maskObj = Simulink.Mask.get(blk);
[hdlGrpPwm, ~] = maskObj.getDialogControl('grpPwmOut');
[hdlGrpPpm, ~] = maskObj.getDialogControl('grpPpmOut');

if strcmp(get_param(blk, 'outMode'), 'PWM')
    
    hdlGrpPwm.Visible = 'on';
    hdlGrpPpm.Visible = 'off';
    
else
    
    hdlGrpPwm.Visible = 'off';
    hdlGrpPpm.Visible = 'on';
    
end

end

