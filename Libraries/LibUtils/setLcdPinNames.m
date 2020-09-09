function [] = setLcdPinNames(blk)
%% Set the pin selection popup with names contained in the ePinout enumeration
%
%   Input
%
%       blk     [char]
%
%           Block to set
%
%   Output
%
%       None
%
%%

[~, pinNames] = enumeration('ePinout');


% Get current block mask
maskObj = Simulink.Mask.get(blk);
maskObj.Parameters(1).TypeOptions = pinNames;
maskObj.Parameters(2).TypeOptions = pinNames;
maskObj.Parameters(3).TypeOptions = pinNames;
maskObj.Parameters(4).TypeOptions = pinNames;
maskObj.Parameters(5).TypeOptions = pinNames;
maskObj.Parameters(6).TypeOptions = pinNames;

end