function varargout = plotcircle(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plotcircle_OpeningFcn, ...
                   'gui_OutputFcn',  @plotcircle_OutputFcn, ...
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

function plotcircle_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
uiwait(handles.figure1);

function varargout = plotcircle_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
delete(hObject);


% --- Executes on button press in pushbutton1.
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

% --- Executes on button press in pushbutton2.
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

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
handles.output = [str2double(handles.edit1.String) str2double(handles.edit2.String) str2double(handles.edit3.String) str2double(handles.edit4.String) str2double(handles.edit5.String) get(handles.popupmenu1, 'value') get(handles.popupmenu2, 'value')];
guidata(hObject, handles);
uiresume(handles.figure1);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
cla reset;



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

function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
set(handles.edit1,'string',num2str(posx+str2double(handles.edit6.String)));
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String);
x     = r*cos(theta)+ posx + str2double(handles.edit6.String);
y     = r*sin(theta)+ posy;
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
set(handles.edit1,'string',num2str(posx-str2double(handles.edit6.String)));
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String);
x     = r*cos(theta)+ posx - str2double(handles.edit6.String);
y     = r*sin(theta)+ posy;
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
set(handles.edit2,'string',num2str(posy+str2double(handles.edit7.String)));
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String);
x     = r*cos(theta)+ posx;
y     = r*sin(theta)+ posy + str2double(handles.edit7.String);
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
set(handles.edit2,'string',num2str(posy-str2double(handles.edit7.String)));
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String);
x     = r*cos(theta)+ posx;
y     = r*sin(theta)+ posy - str2double(handles.edit7.String);
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
set(handles.edit3,'string',num2str(r+str2double(handles.edit8.String)));
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String);
x     = (r+str2double(handles.edit8.String))*cos(theta)+ posx;
y     = (r+str2double(handles.edit8.String))*sin(theta)+ posy;
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
set(handles.edit3,'string',num2str(r-str2double(handles.edit8.String)));
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String);
x     = (r-str2double(handles.edit8.String))*cos(theta)+ posx;
y     = (r-str2double(handles.edit8.String))*sin(theta)+ posy;
try
    global line1
    delete(line1)
end
global line1;
line1 = plot(x,y);
grid on;axis equal;
dragzoom();

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String)+str2double(handles.edit9.String):0.001:str2double(handles.edit5.String);
set(handles.edit4,'string',num2str(str2double(handles.edit4.String)+str2double(handles.edit9.String)));
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

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String)-str2double(handles.edit9.String):0.001:str2double(handles.edit5.String);
set(handles.edit4,'string',num2str(str2double(handles.edit4.String)-str2double(handles.edit9.String)));
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

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String)+str2double(handles.edit10.String);
set(handles.edit5,'string',num2str(str2double(handles.edit5.String)+str2double(handles.edit10.String)));
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

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
posx  = str2double(handles.edit1.String);
posy  = str2double(handles.edit2.String);
r     = str2double(handles.edit3.String);
theta = str2double(handles.edit4.String):0.001:str2double(handles.edit5.String)-str2double(handles.edit10.String);
set(handles.edit5,'string',num2str(str2double(handles.edit5.String)-str2double(handles.edit10.String)));
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

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
