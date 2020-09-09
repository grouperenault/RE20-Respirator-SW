function [] = clean()
%% Clean \work\cache and \work\codegen folders
%
%   Inputs
%
%       None
%
%   Output
%
%       None
%
%   Exemple
%
%       clean();
%
%%

% \work\cache
cmd = ['del ', cd, '\cache /f /q /s *.* > NUL'];
dos(cmd);

cmd = ['rmdir /q /s ' cd, '\cache\slprj'];
dos(cmd);

% \work\codegen
dirElements = struct2cell(dir('codegen'));
elementCount =size(dirElements);

for i=1: elementCount(2)

    if ~(strcmp(dirElements{1,i}, '.') || strcmp(dirElements{1,i}, '..'))
        if dirElements{5,i} % isdir
            
            cmd = ['rmdir /q /s ' cd, '\codegen\', dirElements{1,i}];
            dos(cmd);
            
        end
    end

end

cmd = ['del ', cd, '\codegen /f /q /s *.* > NUL'];
dos(cmd);

end

