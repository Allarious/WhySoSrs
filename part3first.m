function varargout = part3first(varargin)
% PART3FIRST MATLAB code for part3first.fig
%      PART3FIRST, by itself, creates a new PART3FIRST or raises the existing
%      singleton*.
%
%      H = PART3FIRST returns the handle to a new PART3FIRST or the handle to
%      the existing singleton*.
%
%      PART3FIRST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART3FIRST.M with the given input arguments.
%
%      PART3FIRST('Property','Value',...) creates a new PART3FIRST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part3first_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part3first_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part3first

% Last Modified by GUIDE v2.5 07-Dec-2016 16:05:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part3first_OpeningFcn, ...
                   'gui_OutputFcn',  @part3first_OutputFcn, ...
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


% --- Executes just before part3first is made visible.
function part3first_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part3first (see VARARGIN)

% Choose default command line output for part3first
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part3first wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part3first_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in interpolation.
function interpolation_Callback(hObject, eventdata, handles)
% hObject    handle to interpolation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cu

% --- Executes on button press in curveFitting.
function curveFitting_Callback(hObject, eventdata, handles)
% hObject    handle to curveFitting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
numberOfPoints = str2num(get(handles.numberOfPointsEdit, 'string'));
close(gcbf);
curveFittingFirst(numberOfPoints);

function numberOfPointsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to numberOfPointsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberOfPointsEdit as text
%        str2double(get(hObject,'String')) returns contents of numberOfPointsEdit as a double


% --- Executes during object creation, after setting all properties.
function numberOfPointsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberOfPointsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
