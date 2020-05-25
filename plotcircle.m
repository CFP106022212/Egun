function varargout = plotcircle(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plotline_OpeningFcn, ...
                   'gui_OutputFcn',  @plotline_OutputFcn, ...
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


% --- Executes just before plotline is made visible.
function plotline_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plotline_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
delete(hObject);

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)
load('pos.mat');
load('neg.mat');
load('blank.mat');
axes(handles.axes1);
scatter(pos_loc(:,3),pos_loc(:,2));hold on;
scatter(neg_loc(:,3),neg_loc(:,2));
scatter(blank_loc(:,3),blank_loc(:,2));
grid on;axis equal;
dragzoom();

function pushbutton2_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String);
x     = r*cos(theta)+ posx;
y     = r*sin(theta)+ posy;
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

function pushbutton3_Callback(hObject, eventdata, handles)
handles.output = [str2double(handles.edit1.String) str2double(handles.edit2.String) str2double(handles.edit3.String) str2double(handles.edit4.String) str2double(handles.edit5.String) get(handles.popupmenu1, 'value') get(handles.popupmenu2, 'value')];
guidata(hObject, handles);
uiresume(handles.figure1);

function pushbutton4_Callback(hObject, eventdata, handles)
cla reset;

