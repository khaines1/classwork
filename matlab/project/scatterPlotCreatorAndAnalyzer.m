% plotter.m
%
% Author: Kayla Haines
% Account: khaines1@student.gsu.edu
% CSc 4630/6630 Project
%
% Due date: Apr 27 2021
%
% Description
% The purpose of this program is to graph scatter plots
% This program will accept a csv file and plot the data in a scatter plot.
% Calculates line of best fit and the correlation coefficient
%
% Usage
% Upload button: upload a csv file
% Plot button: plot the data, and calculate line of best fit and
    % correlation coefficient
% radio button: toggle line of best fit
% drop-down-list: select line or dot color

function varargout = plotter(varargin)
% PLOTTER MATLAB code for plotter.fig
%      PLOTTER, by itself, creates a new PLOTTER or raises the existing
%      singleton*.
%
%      H = PLOTTER returns the handle to a new PLOTTER or the handle to
%      the existing singleton*.
%
%      PLOTTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTTER.M with the given input arguments.
%
%      PLOTTER('Property','Value',...) creates a new PLOTTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plotter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plotter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plotter

% Last Modified by GUIDE v2.5 26-Apr-2021 19:47:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plotter_OpeningFcn, ...
                   'gui_OutputFcn',  @plotter_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before plotter is made visible.
function plotter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plotter (see VARARGIN)

% Choose default command line output for plotter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plotter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plotter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in uploadButton.
function uploadButton_Callback(hObject, eventdata, handles)
% hObject    handle to uploadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file;
% when upload button is pressed, pop up a file browser
[file,path] = uigetfile('*.csv'); % limit visible files to only .csv files
if isequal(file,0)
   % user selected Cancel
else
   % user chose a file
end
fsname = sprintf("Selected File: %s",file);
set(handles.selectedFile, 'String', fsname);


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c % correlation coefficient
global strength % correlation strength

plotData();
bestFitLine();
estimateStrength(c);
r = sprintf("r = %f",c);
set(handles.coefficientText, 'String', r);
set(handles.corrStrength, 'String', strength);



% --- Executes on button press in radioBestFit.
function radioBestFit_Callback(hObject, eventdata, handles)
% hObject    handle to radioBestFit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radioBestFit
global LBF; % boolean to check if radio button is filled

LBF = get(hObject,'Value'); % value is one if selected, 0 if not


% --- Executes on selection change in dotColor.
function dotColor_Callback(hObject, eventdata, handles)
% hObject    handle to dotColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dotColor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dotColor
global dotColor

color = get(hObject,'Value'); 
switch color
    case 1 % red
        dotColor = 'r'; 
    case 2 % blue
        dotColor = 'b';
    case 3 % green
        dotColor = 'g';
    case 4 % yellow
        dotColor = 'y';
    case 5 % cyan
        dotColor = 'c';
    case 6 % magenta
        dotColor = 'm';
    case 7 % black
        dotColor = 'k';
end

% --- Executes during object creation, after setting all properties.
function dotColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dotColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lineColor.
function lineColor_Callback(hObject, eventdata, handles)
% hObject    handle to lineColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lineColor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lineColor
global lineColor

color = get(hObject,'Value'); 
switch color
    case 1 % black
        lineColor = 'k';
    case 2 % red
        lineColor = 'r'; 
    case 3 % blue
        lineColor = 'b';
    case 4 % green
        lineColor = 'g';
    case 5 % yellow
        lineColor = 'y';
    case 6 % cyan
        lineColor = 'c';
    case 7 % magenta
        lineColor = 'm';
end

% --- Executes during object creation, after setting all properties.
function lineColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lineColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

    
function bestFitLine()
% calculate line of best fit using linear regression
% Y = a + bX
% n = sample size
global xVals
global yVals
global eq % equation for line of best fit
    
n = size(xVals,1);
    
% create x^2 vector
xSquared = xVals.^2;
% create y ^2 vector
ySquared = yVals.^2;
% create x*y vector
xTimesY = xVals.* yVals;
  
% sum all vectors
sumX = sum(xVals);
sumY = sum(yVals);
sumXY = sum(xTimesY);
sumXSq = sum(xSquared);
sumYSq = sum(ySquared);
    
% calculate a
a = ((sumY * sumXSq) - (sumX * sumXY)) / (n * sumXSq - sumX^2);
% calculate b
b = (n * sumXY - (sumX * sumY)) / (n * sumXSq - sumX^2);
   
% write equation
xmin = min(xVals);
xmax = max(xVals);
x = linspace(xmin,xmax, xmax);
eq = a + b * x;

% calculate correlation coefficient
findCorStrength(n,sumX,sumY,sumXY,sumXSq,sumYSq);

function plotData()
global file
global xVals
global yVals
global lineColor
global dotColor
global LBF % boolean to check if radio button is filled
global eq % equation for line of best fit

% read csv file and save x and y columns as vectors
data = csvread(file);
rCount = size(data,[1]); % total amount of rows
xVals = data(1:rCount,1);
yVals = data(1:rCount,2);

% clear previous plot and graph new scatterplot
cla; 
scatter(xVals,yVals,"filled",dotColor);
    
% check if radioBestFit is filled, if so, graph line of best fit
if(LBF == 1)
    hold on
    plot(eq,lineColor);
end
       
function findCorStrength(n,sumX,sumY,sumXY,sumXSq,sumYSq)
% calculate correlation coefficient

global c % correlation coefficient
c = ((n * sumXY) - (sumX * sumY)) / sqrt((n * sumXSq - sumX^2) * (n * sumYSq - sumY^2));
%r = sprintf("r = %f",c);

function estimateStrength(corrCoef)
% assume the strength of the correlation by range
global strength % correlation strength

% very strong correlation - between +-0.8 and +-1.0
if(corrCoef > 0.8) 
    strength = "Very Strong; Positive";
elseif(corrCoef < -0.8) 
    strength = "Very Strong; Negative";
    
% strong correlation - between +-0.6 and +-0.8   
elseif(corrCoef > 0.6 && corrCoef < 0.8)
    strength = "Strong; Positive";
elseif(corrCoef > -0.8 && corrCoef < -0.6) 
    strength = "Strong; Negative";
    
% moderate correlation - between +-0.4 and +-0.6   
elseif(corrCoef > 0.4 && corrCoef < 0.6)
    strength = "Moderate; Positive";
elseif(corrCoef > -0.6 && corrCoef < -0.4)
    strength = "Moderate; Negative";
    
% weak correlation - between +-0.2 and +- 0.4
elseif(corrCoef > 0.2 && corrCoef < 0.4) 
    strength = "Weak; Positive";
elseif(corrCoef > -0.4 && corrCoef < -0.2) 
    strength = "Weak; Negative";
    
% very weak correlation - between 0.0 and +-0.2 
elseif(corrCoef > 0.0 && corrCoef < 0.2)
    strength = "Very Weak; Positive";    
elseif(corrCoef > -0.2 && corrCoef < 0)
    strength = "Very Weak; Negative";
    
end
strength = sprintf("Correlation Strength: %s",strength);
