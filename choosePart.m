function varargout = choosePart(varargin)
% CHOOSEPART MATLAB code for choosePart.fig
%      CHOOSEPART, by itself, creates a new CHOOSEPART or raises the existing
%      singleton*.
%
%      H = CHOOSEPART returns the handle to a new CHOOSEPART or the handle to
%      the existing singleton*.
%
%      CHOOSEPART('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOOSEPART.M with the given input arguments.
%
%      CHOOSEPART('Property','Value',...) creates a new CHOOSEPART or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before choosePart_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to choosePart_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help choosePart

% Last Modified by GUIDE v2.5 06-Dec-2016 06:24:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @choosePart_OpeningFcn, ...
                   'gui_OutputFcn',  @choosePart_OutputFcn, ...
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


% --- Executes just before choosePart is made visible.
function choosePart_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to choosePart (see VARARGIN)

% Choose default command line output for choosePart
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes choosePart wait for user response (see UIRESUME)
% uiwait(handles.choosePanel);


% --- Outputs from this function are returned to the command line.
function varargout = choosePart_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in part1Button.
function part1Button_Callback(hObject, eventdata, handles)
% hObject    handle to part1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
newpart1first

% --- Executes on button press in part2Button.
function part2Button_Callback(hObject, eventdata, handles)
% hObject    handle to part2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
part2first

% --- Executes on button press in part3Button.
function part3Button_Callback(hObject, eventdata, handles)
% hObject    handle to part3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
newpart3first
