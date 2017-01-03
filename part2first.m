function varargout = part2first(varargin)
% PART2FIRST MATLAB code for part2first.fig
%      PART2FIRST, by itself, creates a new PART2FIRST or raises the existing
%      singleton*.
%
%      H = PART2FIRST returns the handle to a new PART2FIRST or the handle to
%      the existing singleton*.
%
%      PART2FIRST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2FIRST.M with the given input arguments.
%
%      PART2FIRST('Property','Value',...) creates a new PART2FIRST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2first_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2first_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2first

% Last Modified by GUIDE v2.5 06-Dec-2016 06:51:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2first_OpeningFcn, ...
                   'gui_OutputFcn',  @part2first_OutputFcn, ...
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


% --- Executes just before part2first is made visible.
function part2first_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2first (see VARARGIN)

% Choose default command line output for part2first
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2first wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2first_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bisectionButton.
function bisectionButton_Callback(hObject, eventdata, handles)
% hObject    handle to bisectionButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
newbisectionfirst;

% --- Executes on button press in secantButton.
function secantButton_Callback(hObject, eventdata, handles)
% hObject    handle to secantButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
newsecantfirst;

% --- Executes on button press in falseButton.
function falseButton_Callback(hObject, eventdata, handles)
% hObject    handle to falseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
newfalsepositionfirst;


% --- Executes on button press in newtonButton.
function newtonButton_Callback(hObject, eventdata, handles)
% hObject    handle to newtonButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
newnewtonraphsonfirst;

% --- Executes on button press in fixedButton.
function fixedButton_Callback(hObject, eventdata, handles)
% hObject    handle to fixedButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
fixedPointFirst;

% --- Executes on button press in newtonGButton.
function newtonGButton_Callback(hObject, eventdata, handles)
% hObject    handle to newtonGButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
