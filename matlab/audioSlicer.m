% program4.m
%
% Author: Kayla Haines
% Account: khaines1@student.gsu.edu
% CSc 4630/6630 Program 4
%
% Due date: Apr 25 2021
%
% Description:
% This is a simple sound editor with a GUI.
% The user can record audio, cut it, and save it.
% When the recording is stopped, the sound is plotted.
% The user can select two points indicating the area they wish to cut.
%
% Usage:
% Press a button:
    % Record: begin recording
    % Stop: stop recording and plot recorded sound
    % Play: play recorded sound
    % Select: Select two points on the graph
    % Cut: delete selected area of audio
    % Save: save audio under filename prog4Sound.ogg
% 
%
  
function varargout = program4(varargin)
% PROGRAM4 MATLAB code for program4.fig
%      PROGRAM4, by itself, creates a new PROGRAM4 or raises the existing
%      singleton*.
%
%      H = PROGRAM4 returns the handle to a new PROGRAM4 or the handle to
%      the existing singleton*.
%
%      PROGRAM4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAM4.M with the given input arguments.
%
%      PROGRAM4('Property','Value',...) creates a new PROGRAM4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before program4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to program4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help program4

% Last Modified by GUIDE v2.5 23-Apr-2021 13:34:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @program4_OpeningFcn, ...
                   'gui_OutputFcn',  @program4_OutputFcn, ...
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


% --- Executes just before program4 is made visible.
function program4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to program4 (see VARARGIN)

global fs;
global myAudioObject;

fs = 8000; %sampling frequency
myAudioObject = audiorecorder(fs, 16, 1);

% Choose default command line output for program4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes program4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = program4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in recordButton.
function recordButton_Callback(hObject, eventdata, handles)
% hObject    handle to recordButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myAudioObject;

set(handles.text2,"String","Recording Audio. Press Stop to end and plot")
disp("Recording audio");

% begin audio recording
record(myAudioObject);


% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myAudioObject;
global audioData;

% stop audio recording
stop(myAudioObject); 
audioData = getaudiodata(myAudioObject);

set(handles.text2,"String","Recording stopped.")
disp("recording stopped");

plot(audioData);


% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs;
global audioData;

set(handles.text2,"String","Playing audio.")
disp("Playing audio");

% Play audio
myAudioPlayer = audioplayer(audioData,fs);
playblocking(myAudioPlayer);


% --- Executes on button press in selectButton.
function selectButton_Callback(hObject, eventdata, handles)
% hObject    handle to selectButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global y;

disp("Selecting points");
set(handles.text2,"String","Selecting... Chose two points on graph")

[x,y] = ginput(2); % get two points
% Draw red line between selected points
hold on;
plot([x(1), x(2)], [y(1), y(2)], 'r*-')

% --- Executes on button press in cutButton.
function cutButton_Callback(hObject, eventdata, handles)
% hObject    handle to cutButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audioData
global x;

% delete selected area of audio
audioData(round(x(1)):round(x(2))) = [];
cla;
plot(audioData);

disp("Cutting audio");
set(handles.text2,"String","Audio was cut")


% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs;
global audioData;

% save audio
audiowrite('prog4Sound.ogg',audioData,fs); 

set(handles.text2,"String","Audio saved")
disp("Saving audio");
