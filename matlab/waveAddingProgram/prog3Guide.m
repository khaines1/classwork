function varargout = prog3Guide(varargin)
% program3.m
%
% Author: Kayla Haines
% Account: khaines1@student.gsu.edu
% CSc 4630/6630 Program #3
%
% Due date: Apr 4, 2021
%
% Description:
% User changes sliders to create a sinusoid from 3 separate waves
% Each wave has a frequency, phase, and amplitude slider
% When the user changes a slider value, the waves will be added and graphed
% When the user presses the create button, an image is created and saved.
% The added sinusoids are used to create a backgroung image of mountains
%


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
%frequency slider one callback function
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
global wave2;
global wave3;
global swave;

freq1 = round(get(hObject,'Value'));
disp(sprintf('changed frequency 1 to %d',freq1));
wave1 = sinusoid(amp1,freq1,phase1);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);
    
function fs1_CreateFcn(hObject, eventdata, handles)
% frequency slider one create function
% hObject    handle to fs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.

%set(hObject, 'SliderStep' , [1/100,1/100] );
global freq1;

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
freq1 = round(get(hObject,'Value')); % get frequency from slider
%disp(round(get(hObject,'Value')));

% --- Executes on slider movement.
function fs2_Callback(hObject, eventdata, handles)
%frequency slider two callback function
% hObject    handle to fs2 (see GCBO)
global freq2;
global phase2;
global amp2;
global wave1;
global wave2;
global wave3;
global swave;

freq2 = round(get(hObject,'Value')); % get frequency from slider
disp(sprintf('changed frequency 2 to %d',freq2));
% update sinusoid graph
wave2 = sinusoid(amp2,freq2,phase2);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);
    
function fs2_CreateFcn(hObject, eventdata, handles)
% frequency slider two create function
% hObject    handle to fs2 (see GCBO)
global freq2;
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
freq2 = round(get(hObject,'Value')); % get frequency from slider

% --- Executes on slider movement.
function fs3_Callback(hObject, eventdata, handles)
% frequency slider three callback function
% hObject    handle to fs3 (see GCBO)
global freq3;
global phase3;
global amp3;
global wave1;
global wave2;
global wave3;
global swave;

freq3 = round(get(hObject,'Value')); % get frequency from slider
disp(sprintf('changed frequency 3 to %d',freq3));
% update sinusoid graph
wave3 = sinusoid(amp3,freq3,phase3);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);

function fs3_CreateFcn(hObject, eventdata, handles)
% frequency slider three create function
% hObject    handle to fs3 (see GCBO)
global freq3;

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
freq3 = round(get(hObject,'Value')); % get freqency from slider

% --- Executes on slider movement.
function ps1_Callback(hObject, eventdata, handles)
% phase slider one callback function
% hObject    handle to ps1 (see GCBO)
global freq1;
global phase1;
global amp1;
global wave1;
global wave2;
global wave3;
global swave;

phase1 = get(hObject,'Value'); % get phase from slider
disp(sprintf('changed phase 1 to %.2f',phase1));
% update sinusoid graph
wave1 = sinusoid(amp1,freq1,phase1); 
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);
    
function ps1_CreateFcn(hObject, eventdata, handles)
% phase slider one create function
% hObject    handle to ps1 (see GCBO)
global phase1;

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
phase1 = get(hObject,'Value'); % get phase from slider

% --- Executes on slider movement.
function ps2_Callback(hObject, eventdata, handles)
% phase slider two callback function
% hObject    handle to ps2 (see GCBO)
global freq2;
global phase2;
global amp2;
global wave1;
global wave2;
global wave3;
global swave;

phase2 = get(hObject,'Value'); % get phase from slider
disp(sprintf('changed phase 2 to %.2f',phase2));
% update sinusoid graph
wave2 = sinusoid(amp2,freq2,phase2);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);
    
function ps2_CreateFcn(hObject, eventdata, handles)
% phase slider two create function
% hObject    handle to ps2 (see GCBO)
global phase2;

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
phase2 = get(hObject,'Value'); % get phase from slider

% --- Executes on slider movement.
function ps3_Callback(hObject, eventdata, handles)
% phase slider three callback function
% hObject    handle to ps3 (see GCBO)
global freq3;
global phase3;
global amp3;
global wave1;
global wave2;
global wave3;
global swave;

phase3 = get(hObject,'Value'); % get phase from slider
disp(sprintf('changed phase 3 to %.2f',phase3));
% update sinusoid graph
wave3 = sinusoid(amp3,freq3,phase3);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);

function ps3_CreateFcn(hObject, eventdata, handles)
% phase slider three create function
% hObject    handle to ps3 (see GCBO)
global phase3;

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
phase3 = get(hObject,'Value'); % get phase from slider

% --- Executes on slider movement.
function as1_Callback(hObject, eventdata, handles)
% amplitude slider one callback function
% hObject    handle to as1 (see GCBO)
global freq1;
global phase1;
global amp1;
global wave1;
global wave2;
global wave3;
global swave;

amp1 = get(hObject,'Value'); % get amplitude from slider
disp(sprintf('changed amplitude 1 to %.2f',amp1));
% update sinusoid graph
wave1 = sinusoid(amp1,freq1,phase1);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);

function as1_CreateFcn(hObject, eventdata, handles)
% amplitude slider one create function
% hObject    handle to as1 (see GCBO)
global amp1;

set(hObject, 'SliderStep' , [0.1,0.1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
amp1 = get(hObject,'Value'); % get amplitude from slider

% --- Executes on slider movement.
function as2_Callback(hObject, eventdata, handles)
% amplitude slider two callback function
% hObject    handle to as2 (see GCBO)
global freq2;
global phase2;
global amp2;
global wave1;
global wave2;
global wave3;
global swave;

amp2 = get(hObject,'Value'); % get amplitude from slider
disp(sprintf('changed amplitude 2 to %.2f',amp2));
% update sinusoid graph
wave2 = sinusoid(amp2,freq2,phase2);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);
function as2_CreateFcn(hObject, eventdata, handles)
% amplitude slider two create function
% hObject    handle to as2 (see GCBO)
global amp2;

set(hObject, 'SliderStep' , [0.1,0.1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
amp2 = round(get(hObject,'Value')); % get amplitude from slider

% --- Executes on slider movement.
function as3_Callback(hObject, eventdata, handles)
% amplitude slider three callback function
% hObject    handle to as3 (see GCBO)
global freq3;
global phase3;
global amp3;
global wave1;
global wave2;
global wave3;
global swave;

amp3 = get(hObject,'Value'); % get amplitude from slider
disp(sprintf('changed amplitude 3 to %.2f',amp3));
% update sinusoid graph
wave3 = sinusoid(amp3,freq3,phase3);
swave = addSinusoid(wave1,wave2,wave3);
plot(swave);

function as3_CreateFcn(hObject, eventdata, handles)
% amplitude slider three create function
% hObject    handle to as3 (see GCBO)
global amp3;

set(hObject, 'SliderStep' , [0.1,0.1]);
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
amp3 = round(get(hObject,'Value')); % get amplitude from slider

% --- Executes on button press in createButton.
function createButton_Callback(hObject, eventdata, handles)
% create button callback function
% hObject    handle to createButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% when pushed, generates and saves image based on the final sinusoid wave.

% I could not finish this part
% I know I need to use alpha() but I'm not sure how to get the values
    % from the addSinusiod function.
global wave1;
global wave2;
global wave3;
global swave;

displayValues();
createMountains(swave);

function wave = sinusoid(wamp,wfreq,wphase)
%calculates a sinusoid wave given amplitude, frequency, and phase     
time = (0:0.01:1);
%disp('computed');
wave = wamp * sin(2*pi*wfreq*time + wphase);
%plot(wave);

function wave = addSinusoid(w1,w2,w3)
%adds three sinusoidal waves and plots result
%global swave;
wave = w1 + w2 + w3;
%plot(wave);

function createMountains(wave)
% create figure and define dimentions
% dimentsions are 480x6400 based on screen size of 480x640
%global swave;

figure;
width = 6400;
height = 480;
mcolor = [46 8 52];
% create alpha
alpha = uint8(mcolor * 255);
% Each column should be 0 above function and 255 if at or below function.
% final wave has 101 columns
mountains = imresize(wave,[480 6400]);
%disp(mountains(1:101));
mountains(:,:,1) = 46;
mountains(:,:,2) = 8;
mountains(:,:,3) = 52;
% write mountain image to file
%imwrite(mountains, 'mountains.png', 'PNG', 'Alpha', myalpha);
imshow(mountains);

function displayValues()
% display the current values of each slider
global freq1;
global freq2;
global freq3;
global phase1;
global phase2;
global phase3;
global amp1;
global amp2;
global amp3;

disp(sprintf('Frequency 1 is %d',freq1));
disp(sprintf('Frequency 2 is %d',freq2));
disp(sprintf('Frequency 3 is %d',freq3));
disp(sprintf('Phase 1 is %.2f',phase1));
disp(sprintf('Phase 2 is %.2f',phase2));
disp(sprintf('Phase 3 is %.2f',phase3));
disp(sprintf('Amplitude 1 is %.2f',amp1));
disp(sprintf('Amplitude 2 is %.2f',amp2));
disp(sprintf('Amplitude 3 is %.2f',amp3));
