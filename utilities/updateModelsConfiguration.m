function [] = updateModelsConfiguration(configurationFile)
%% Set given model configuration as active configuration for current model
% and all models referenced in the current model
%
%   Input
%
%       configurationFile   [char]
%
%           Name of the model configuration to set as active configuration
%
%   Output
%
%       None
%
%   Throws
%
%       Throws an error if configuration name does not exist
%
%       Trows an error if given configuration name does not resolve a
%       model configuration class
%
%   Exemple
%
%       updateModelsConfiguration('CodeGenMdlConfig.mat');
%
%%

if ~exist(configurationFile, 'file')
    
    error(['Model configuration file ', configurationFile, ' does not exist']);
    
end

fileVars = load(configurationFile);
if isfield(fileVars, 'cs')
    
    mdlConfig = fileVars.cs;
    
    if ~isa(mdlConfig, 'Simulink.ConfigSet')
        
        error(['Mat file ', configurationFile, ' does not contain any model', ...
              ' configuration object']);
    end
    
else
    
    error(['Mat file ', configurationFile, ' does not contain any model', ...
          ' configuration object']);
end

% Set config in current model and all referenced model
disp(['Set ', get_param(mdlConfig, 'Name'), ' model configuration']);
disp(newline);

updateReferencedModels(bdroot, mdlConfig);

disp(newline);
disp('Models configurations update done');
disp(newline);

end

%%
function [] = updateReferencedModels(currentModel, mdlConfig)

setModelConfig(currentModel, mdlConfig);
refModels = find_system(currentModel, 'BlockType','ModelReference');

if ~isempty(refModels)
    
    for i=1 : numel(refModels)
        
        refModel = load_system(get_param(refModels{i,1}, 'ModelFile'));
        refModel = get_param(refModel, 'Name');
        
        updateReferencedModels(refModel, mdlConfig);
        
        close_system(refModel);
    
    end
    
end

end

%%
function [] = setModelConfig(model, config)

config = copy(config);

oldCfg = getActiveConfigSet(model);
set_param(oldCfg, 'Name', 'OldConfig');

attachConfigSet(model,config);
setActiveConfigSet(model, get_param(config, 'Name'));

detachConfigSet(model, 'OldConfig');

save_system(model);
disp(['>>> ', model, ' model configuration updated']);

end
