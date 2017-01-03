function varargout = falsePositionFirst(varargin)
% FALSEPOSITIONFIRST MATLAB code for falsePositionFirst.fig
%      FALSEPOSITIONFIRST, by itself, creates a new FALSEPOSITIONFIRST or raises the existing
%      singleton*.
%
%      H = FALSEPOSITIONFIRST returns the handle to a new FALSEPOSITIONFIRST or the handle to
%      the existing singleton*.
%
%      FALSEPOSITIONFIRST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FALSEPOSITIONFIRST.M with the given input arguments.
%
%      FALSEPOSITIONFIRST('Property','Value',...) creates a new FALSEPOSITIONFIRST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before falsePositionFirst_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to falsePositionFirst_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help falsePositionFirst

% Last Modified by GUIDE v2.5 07-Dec-2016 13:50:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @falsePositionFirst_OpeningFcn, ...
                   'gui_OutputFcn',  @falsePositionFirst_OutputFcn, ...
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


% --- Executes just before falsePositionFirst is made visible.
function falsePositionFirst_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to falsePositionFirst (see VARARGIN)

% Choose default command line output for falsePositionFirst
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes falsePositionFirst wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = falsePositionFirst_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.radiobutton1, 'value') == 0)  
    interval = str2num(get(handles.edit1, 'string'));
    f = get(handles.edit2, 'string');
    precision = str2num(get(handles.edit3, 'string'));
    c = falsePositionWithPrecision(f, interval, precision);
else
    interval = str2num(get(handles.edit1, 'string'));
    f = get(handles.edit2, 'string');
    numberOfIteration = str2num(get(handles.edit3, 'string'));
    c = falsePositionWithNumberOfIteration(f, interval, numberOfIteration);
end


f = figure('units','pixels',...
       'menubar','none',...
       'position',[750 510 200 100]); % Create a new GUI.
E = uicontrol('style','text',...
              'units','pixels',...
              'position',[10 20 180 60],...
              'string',c);
          


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
