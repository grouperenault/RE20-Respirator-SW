function [] = setBlockPinNames(blk)
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
maskObj.Parameters(2).TypeOptions = pinNames;

end

