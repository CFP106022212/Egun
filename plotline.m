function varargout = plotline(varargin)
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
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
x = str2double(handles.edit3.String):0.01:str2double(handles.edit4.String);
y = a*x+b;
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

function pushbutton3_Callback(hObject, eventdata, handles)
handles.output = [str2double(handles.edit1.String) str2double(handles.edit2.String) str2double(handles.edit3.String) str2double(handles.edit4.String) ];
guidata(hObject, handles);
uiresume(handles.figure1);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
cla reset;



function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)
function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
a  = str2double(handles.edit1.String);
da = str2double(handles.edit6.String);
a  = a + da;
set(handles.edit1,'string',num2str(a));
b = str2double(handles.edit2.String);
x = str2double(handles.edit3.String):0.01:str2double(handles.edit4.String);
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
a  = str2double(handles.edit1.String);
da = str2double(handles.edit6.String);
a  = a - da;
set(handles.edit1,'string',num2str(a));
b = str2double(handles.edit2.String);
x = str2double(handles.edit3.String):0.01:str2double(handles.edit4.String);
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
b  = str2double(handles.edit2.String);
db = str2double(handles.edit7.String);
b  = b + db;
set(handles.edit2,'string',num2str(b));
a = str2double(handles.edit1.String);
x = str2double(handles.edit3.String):0.01:str2double(handles.edit4.String);
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
b  = str2double(handles.edit2.String);
db = str2double(handles.edit7.String);
b  = b - db;
set(handles.edit2,'string',num2str(b));
a = str2double(handles.edit1.String);
x = str2double(handles.edit3.String):0.01:str2double(handles.edit4.String);
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
xmin  = str2double(handles.edit3.String);
dxmin = str2double(handles.edit8.String);
xmin  = xmin + dxmin;
set(handles.edit3,'string',num2str(xmin));
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
x = xmin:0.01:str2double(handles.edit4.String);
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
xmin  = str2double(handles.edit3.String);
dxmin = str2double(handles.edit8.String);
xmin  = xmin - dxmin;
set(handles.edit3,'string',num2str(xmin));
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
x = xmin:0.01:str2double(handles.edit4.String);
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();
% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
xmax  = str2double(handles.edit4.String);
dxmax = str2double(handles.edit9.String);
xmax  = xmax + dxmax;
set(handles.edit4,'string',num2str(xmax));
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
x = str2double(handles.edit3.String):0.01:xmax;
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();
% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
xmax  = str2double(handles.edit4.String);
dxmax = str2double(handles.edit9.String);
xmax  = xmax - dxmax;
set(handles.edit4,'string',num2str(xmax));
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
x = str2double(handles.edit3.String):0.01:xmax;
y = a*x+b;
global line1;
delete(line1);
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();
