function varargout = program3(varargin)


% PROG3GUIDE MATLAB code for prog3Guide.fig
%      PROG3GUIDE, by itself, creates a new PROG3GUIDE or raises the existing
%      singleton*.
%
%      H = PROG3GUIDE returns the handle to a new PROG3GUIDE or the handle to
%      the existing singleton*.
%
%      PROG3GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROG3GUIDE.M with the given input arguments.
%
%      PROG3GUIDE('Property','Value',...) creates a new PROG3GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prog3Guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prog3Guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prog3Guide

% Last Modified by GUIDE v2.5 02-Apr-2021 16:35:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prog3Guide_OpeningFcn, ...
                   'gui_OutputFcn',  @prog3Guide_OutputFcn, ...
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

% --- Executes just before prog3Guide is made visible.
function prog3Guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prog3Guide (see VARARGIN)

% Choose default command line output for prog3Guide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes prog3Guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prog3Guide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function fs1_Callback(hObject, eventdata, handles)
% hObject    handle to fs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
global freq1;
global phase1;
global amp1;
global wave1;
%global wtime;
%global wave;

    disp(round(get(hObject,'Value')));
    freq1 = round(get(hObject,'Value'));
    %sinusoid(wamp,wfreq,wphase,wtime);
    
function fs1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.

%set(hObject, 'SliderStep' , [1/100,1/100] );
global freq1;
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
freq1 = round(get(hObject,'Value'));
%disp(round(get(hObject,'Value')));

% --- Executes on slider movement.
function fs2_Callback(hObject, eventdata, handles)
% hObject    handle to fs2 (see GCBO)
global freq2;
    disp(round(get(hObject,'Value')));
    freq2 = round(get(hObject,'Value'));
    
function fs2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs2 (see GCBO)
global freq2;
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
freq2 = round(get(hObject,'Value'));

% --- Executes on slider movement.
function fs3_Callback(hObject, eventdata, handles)
% hObject    handle to fs3 (see GCBO)
global freq3;
    disp(round(get(hObject,'Value')));
    freq3 = round(get(hObject,'Value'));
    
function fs3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs3 (see GCBO)
global freq3;
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
freq3 = round(get(hObject,'Value'));

% --- Executes on slider movement.
function ps1_Callback(hObject, eventdata, handles)
% hObject    handle to ps1 (see GCBO)
global phase1;
    disp(get(hObject,'Value'));
    phase1 = get(hObject,'Value');
    
function ps1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ps1 (see GCBO)
global phase1;
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
phase1 = round(get(hObject,'Value'));

% --- Executes on slider movement.
function ps2_Callback(hObject, eventdata, handles)
% hObject    handle to ps2 (see GCBO)
global phase2;
    disp(get(hObject,'Value'));
    phase2 = get(hObject,'Value');
    
function ps2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ps2 (see GCBO)
global phase2;
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
phase2 = round(get(hObject,'Value'));

% --- Executes on slider movement.
function ps3_Callback(hObject, eventdata, handles)
% hObject    handle to ps3 (see GCBO)
global phase3;
    disp(get(hObject,'Value'));
    phase3 = get(hObject,'Value');

function ps3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ps3 (see GCBO)
global phase3
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
phase3 = round(get(hObject,'Value'));

% --- Executes on slider movement.
function as1_Callback(hObject, eventdata, handles)
% hObject    handle to as1 (see GCBO)
global amp1;
    disp(get(hObject,'Value'));
    amp1 = get(hObject,'Value');
   

function as1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to as1 (see GCBO)
global amp1;
set(hObject, 'SliderStep' , [0.1,0.1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
amp1 = get(hObject,'Value');

% --- Executes on slider movement.
function as2_Callback(hObject, eventdata, handles)
% hObject    handle to as2 (see GCBO)
global amp2;
    disp(round(get(hObject,'Value')));
    amp2 = round(get(hObject,'Value'));

function as2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to as2 (see GCBO)
global amp2;
set(hObject, 'SliderStep' , [0.1,0.1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
amp2 = round(get(hObject,'Value'));

% --- Executes on slider movement.
function as3_Callback(hObject, eventdata, handles)
% hObject    handle to as3 (see GCBO)
global amp3;
    disp(round(get(hObject,'Value')));
    amp3 = round(get(hObject,'Value'));

function as3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to as3 (see GCBO)
global amp3;
set(hObject, 'SliderStep' , [0.1,0.1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
amp3 = round(get(hObject,'Value'));

% --- Executes on button press in createButton.
function createButton_Callback(hObject, eventdata, handles)
% hObject    handle to createButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amp1;
global freq1;
global phase1;
sinusoid(amp1,freq1,phase1);
