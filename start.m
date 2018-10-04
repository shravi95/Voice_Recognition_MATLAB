function varargout = start(varargin)
% START MATLAB code for start.fig
%      START, by itself, creates a new START or raises the existing
%      singleton*.
%
%      H = START returns the handle to a new START or the handle to
%      the existing singleton*.
%
%      START('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in START.M with the given input arguments.
%
%      START('Property','Value',...) creates a new START or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before start_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to start_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help start

% Last Modified by GUIDE v2.5 21-Jul-2014 14:44:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start_OpeningFcn, ...
                   'gui_OutputFcn',  @start_OutputFcn, ...
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


% --- Executes just before start is made visible.
function start_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to start (see VARARGIN)

% Choose default command line output for start
handles.output = hObject;
global tone1 Q
a=imread('back.jpg');
axes(handles.axes1);
set(handles.play,'visible','off');
set(handles.help,'visible','off');
set(handles.quit,'visible','off');
set(handles.easy,'visible','off');
set(handles.medium,'visible','off');
set(handles.hard,'visible','off');
set(handles.back,'visible','off');
set(handles.rules,'visible','off');
set(handles.text4,'visible','off');
imagesc(a);
axis off;
[y,fs]=audioread('tone1.mp3');
tone1=audioplayer(y,fs);
start = 1;
stop = tone1.SampleRate * 12;
playblocking(tone1,[start,stop])
%player=audioplayer(y,fs);
%play(player);
i1=imread('play.png');
i1=imresize(i1,[69,418]);
set(handles.play,'CData',i1);
i2=imread('help.png');
i2=imresize(i2,[69,418]);
set(handles.help,'CData',i2);
i3=imread('quit.png');
i3=imresize(i3,[69,418]);
i4=imread('previous.png');
i4=imresize(i4,[69,418]);
set(handles.hard,'CData',i4);
set(handles.quit,'CData',i3);
set(handles.play,'visible','on');
pause(0.15)
set(handles.help,'visible','on');
pause(0.15)
set(handles.quit,'visible','on');
pause(0.15)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes start wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = start_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axis off;
set(handles.play,'visible','off');
set(handles.help,'visible','off');
set(handles.quit,'visible','off');
set(handles.rules,'visible','off');
set(handles.text4,'visible','off');
i1=imread('easy.png');
i1=imresize(i1,[69,418]);
set(handles.easy,'CData',i1);
i2=imread('medium.png');
i2=imresize(i2,[69,418]);
set(handles.medium,'CData',i2);
i3=imread('hard.png');
i3=imresize(i3,[69,418]);
set(handles.hard,'CData',i3);
i4=imread('previous.png');
i4=imresize(i4,[69,418]);
set(handles.back,'CData',i4);
set(handles.easy,'visible','on');
set(handles.medium,'visible','on');
set(handles.hard,'visible','on');
set(handles.back,'visible','on');


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clf;
i4=imread('previous.png');
i4=imresize(i4,[69,418]);
set(handles.back,'CData',i4);
set(handles.play,'visible','off');
set(handles.help,'visible','off');
set(handles.quit,'visible','off');
set(handles.back,'visible','on');
set(handles.rules,'visible','on');
set(handles.text4,'visible','on');
a=imread('back1.png');
axes(handles.axes1);
imagesc(a);
axis off;

% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --- Executes on button press in easy.
function easy_Callback(hObject, eventdata, handles)
% hObject    handle to easy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Q
Q=1;
close all;

easy
% --- Executes on button press in medium.
function medium_Callback(hObject, eventdata, handles)
% hObject    handle to medium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Q
Q=2;
close all;
easy

% --- Executes on button press in hard.
function hard_Callback(hObject, eventdata, handles)
% hObject    handle to hard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Q
Q=3;
close all;
easy

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=imread('back.jpg');
axes(handles.axes1);
imagesc(a);
axis off;
set(handles.easy,'visible','off');
set(handles.medium,'visible','off');
set(handles.hard,'visible','off');
set(handles.back,'visible','off');
set(handles.play,'visible','on');
set(handles.help,'visible','on');
set(handles.quit,'visible','on');
set(handles.rules,'visible','off');
set(handles.text4,'visible','off');


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figuretone1
global tone1
stop(tone1)
delete(hObject);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
