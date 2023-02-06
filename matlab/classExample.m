% calclass.m
%
% This is a simple class example.
% It assumes that file "myarray.mat" exists and has 
% a char array (col 1) followed by a number (col 2)
%
% -MCW, February, 2021
%
% Usage example:
%   mycalendar = calclass();
%   disp(mycalendar.getName(5));
%   disp(mycalendar.getNumber(5));
%

classdef calclass

    properties
        numEntries;
        month_struct;
    end

    methods
        % constructor
        function obj = calclass()  %varargin)
            load myarray1.mat
            % copy it to one of our property names
            % Set the length
            obj.numEntries = length(myarray);
            % MATLAB (at least R2019b) does not support {} as class property,
            % so copy to struct.
            for m=1:obj.numEntries
                obj.month_struct(m).name = myarray{m,1};
                obj.month_struct(m).number = myarray{m,2};
            end
            %if (nargin > 0)
        end

        function this_name = getName(obj, index)
            % Simply return the "name" at the index (col 1)
            if(index > 12)
                this_name = '';
            else
                this_name = obj.month_struct(index).name;
            end
        end
        function this_number = getNumber(obj, index)
            % Simply return the "number" at the index (col 2)
            if(index > 12)
                this_number = [];
            else 
                this_number = obj.month_struct(index).number;
            end
        end

    end
end

