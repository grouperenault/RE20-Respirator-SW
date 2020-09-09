classdef DriverLCD < matlab.System ...
        & coder.ExternalDependency ...
        & matlab.system.mixin.Propagates ...
        & matlab.system.mixin.CustomIcon
    %
    % System object template for a sink block.
    % 
    % This template includes most, but not all, possible properties,
    % attributes, and methods that you can implement for a System object in
    % Simulink.
    %
    % NOTE: When renaming the class name Sink, the file name and
    % constructor name must be updated to use the class name.
    %
    
    % Copyright 2014 The MathWorks, Inc.
    %#codegen
    %#ok<*EMCA>
    
    properties
        % Public, tunable properties.
    end
    
    properties (Nontunable) % Public, non-tunable properties.
        RS_Pin = int32(1)
        Enable_Pin = int32(2)
        Data_Pin1 = int32(3)
        Data_Pin2 = int32(4)
        Data_Pin3 = int32(5)
        Data_Pin4 = int32(6)
    end
    
    properties (Access = private)
        % Pre-computed constants.
    end
    
    properties (Constant, Hidden)
        % AvailablePin specifies the range of values allowed for Pin. You
        % can customize the AvailablePin for a particular board. For
        % example, use AvailablePin = 2:13 for Arduino Uno.
        AvailablePin = 0:49;
    end
    
    methods
        % Constructor
        function obj = DriverLCD(varargin)
            coder.allowpcode('plain');
            % Support name-value pair arguments when constructing the object.
            setProperties(obj,nargin,varargin{:});
        end
        
        function set.RS_Pin(obj,value)
            obj.RS_Pin = int32(value);
        end
        
        function set.Enable_Pin(obj,value)
            obj.Enable_Pin = int32(value);
        end
        
        function set.Data_Pin1(obj,value)
            obj.Data_Pin1 = int32(value);
        end
        
        function set.Data_Pin2(obj,value)
            obj.Data_Pin2 = int32(value);
        end
        
        function set.Data_Pin3(obj,value)
            obj.Data_Pin3 = int32(value);
        end
        
        function set.Data_Pin4(obj,value)
            obj.Data_Pin4 = int32(value);
        end
    end
    
    methods (Access=protected)
        function setupImpl(obj) %#ok<MANU>
            if coder.target('Rtw')
                % Call C-function implementing device initialization
                coder.cinclude('TextLCD_Wrapper.h');
                coder.ceval('initScreen', obj.RS_Pin, ...
                            obj.Enable_Pin, obj.Data_Pin1, ...
                            obj.Data_Pin2, obj.Data_Pin3, ...
                            obj.Data_Pin4);
            else
                % Place simulation setup code here
            end
        end
        
        function stepImpl(obj,r1, r2, r3, r4)  %#ok<INUSD>
            if coder.target('Rtw')
                % Call C-function implementing device output
                coder.ceval('writeToScreen', coder.rref(r1), coder.rref(r2), coder.rref(r3), coder.rref(r4));
            else
                % Place simulation output code here
            end
        end
        
        function releaseImpl(obj) %#ok<MANU>
            if coder.target('Rtw')
                % Call C-function implementing device termination
                %coder.ceval('sink_terminate');
            else
                % Place simulation termination code here
            end
        end
    end
    
    methods (Access=protected)
        %% Define input properties
        function num = getNumInputsImpl(~)
            num = 4;
        end
        
        function num = getNumOutputsImpl(~)
            num = 0;
        end
        
        function flag = isInputSizeLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isInputFixedSizeImpl(~,~)
            varargout{1} = true;
        end
        
        function flag = isInputComplexityLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isInputComplexImpl(~)
            varargout{1} = false;
        end
        
        function validateInputsImpl(~, r1,r2,r3,r4)
            if isempty(coder.target)
                % Run input validation only in Simulation
                validateattributes(r1,{'int8'},{'row'},'','Row1');
                validateattributes(r2,{'int8'},{'row'},'','Row2');
                validateattributes(r3,{'int8'},{'row'},'','Row3');
                validateattributes(r4,{'int8'},{'row'},'','Row4');
            end
        end
        
        function icon = getIconImpl(~)
            % Define a string as the icon for the System block in Simulink.
            icon = 'MBED\nTextLCD';
        end

        function [name,name2,name3,name4] = getInputNamesImpl(obj)
            % Return input port names for System block
            name = 'Row1';
            name2 = 'Row2';
            name3 = 'Row3';
            name4 = 'Row4';
        end
    end
    
    methods (Static, Access=protected)
        function simMode = getSimulateUsingImpl(~)
            simMode = 'Interpreted execution';
        end
        
        function isVisible = showSimulateUsingImpl
            isVisible = false;
        end
    end
    
    methods (Static)
        function name = getDescriptiveName()
            name = 'Liquid Crystal';
        end
        
        function b = isSupportedContext(context)
            b = context.isCodeGenTarget('rtw');
        end
        
        function updateBuildInfo(buildInfo, context)
            if context.isCodeGenTarget('rtw')
                % Update buildInfo
                rootDir = fullfile(fileparts(mfilename('fullpath')),'ExternalCode\TextLCD');
                buildInfo.addIncludePaths(rootDir);
                % Use the following API's to add include files, sources and
                % linker flags
                addIncludeFiles(buildInfo,'TextLCD.h');
                addIncludeFiles(buildInfo,'TextLCD_Wrapper.h');
                addSourceFiles(buildInfo,'TextLCD.cpp',rootDir);
                addSourceFiles(buildInfo,'TextLCD_Wrapper.cpp',rootDir);
                %addLinkFlags(buildInfo,{'-llibSink'});
            end
        end
    end
end
