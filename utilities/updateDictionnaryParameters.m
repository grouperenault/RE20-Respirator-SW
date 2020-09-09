function [] = updateDictionnaryParameters(dictionary, dataFileName)
%% Update parameter object value of the given Simulink data dictionary
% with contained in the given MAT file
%
%   Inputs
%
%       dictionary      [char]
%
%           Name of the data dictionnary to update
%
%       dataFileName    [char]
%
%           Name of the Matlab MAT file containing paramter values to set
%
%   Output
%
%       None
%
%   Throws
%
%       Throws an error if Simulink data dictionnary does not exist
%
%       Throws an error if Matlab MAT file does not exist
%
%   Exemple
%
%       updateDictionnaryParameters('PressureControlData.sldd', 'MyData.mat');
%
%%

if ~exist(dataFileName, 'file')
    error(['MAT file', dataFileName, ' does not exist']);
end

try
    
    dataDictionnary = Simulink.data.dictionary.open(dictionary);
    dataSection = getSection(dataDictionnary, 'Design Data');
    
catch
    
    error(['Data dictionary ', dictionary, ' does not exist']);
    
end

matVars = struct2cell(whos('-file', dataFileName));
varNum = size(matVars);

load(dataFileName);

for i=1: varNum(2)
    
    paramName = matVars{1,i};
    
    try
        
        paramEntry = getEntry(dataSection, paramName);
        paramObj = getValue(paramEntry);
        
        if isa(paramObj, 'Simulink.Parameter')
            
            paramObj.Value = eval(paramName);
            setValue(paramEntry, paramObj);
            
        else
            
            warning(['Dictionary entry ', paramName, ' is not a ', ...
                     'Simulink.Parameter object']);
            
        end
        
    catch
        
        warning(['Parameter ', paramName, ' does not exist in ' ...
                dictionary, ' data dictionnary']);
        
    end
    
end

saveChanges(dataDictionnary);
disp(['Data dictionary ', dictionary, ' updated !']);

end

