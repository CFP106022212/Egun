function varargout = plotfunction(varargin)
% PLOTFUNCTION MATLAB code for plotfunction.fig
%      PLOTFUNCTION, by itself, creates a new PLOTFUNCTION or raises the existing
%      singleton*.
%
%      H = PLOTFUNCTION returns the handle to a new PLOTFUNCTION or the handle to
%      the existing singleton*.
%
%      PLOTFUNCTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTFUNCTION.M with the given input arguments.
%
%      PLOTFUNCTION('Property','Value',...) creates a new PLOTFUNCTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plotfunction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plotfunction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plotfunction

% Last Modified by GUIDE v2.5 04-Jul-2020 22:42:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plotfunction_OpeningFcn, ...
                   'gui_OutputFcn',  @plotfunction_OutputFcn, ...
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


% --- Executes just before plotfunction is made visible.
function plotfunction_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plotfunction_OutputFcn(hObject, eventdata, handles) 
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


function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu2_Callback(hObject, eventdata, handles)
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton2_Callback(hObject, eventdata, handles)
handles.output = [str2double(handles.edit1.String) str2double(handles.edit2.String) str2double(handles.edit3.String) str2double(handles.edit4.String) str2double(handles.edit5.String) str2double(handles.edit6.String) str2double(handles.edit10.String) str2double(handles.edit11.String) str2double(handles.edit12.String) str2double(handles.edit13.String) get(handles.popupmenu1, 'value') get(handles.popupmenu2, 'value')];
guidata(hObject, handles);
uiresume(handles.figure1);

function pushbutton3_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
h = str2double(handles.edit7.String);

f = f+  a*h^2+d*h;
d = d+2*a*h;
e = e+  c*h;

set(handles.edit4,'string',num2str(d));
set(handles.edit5,'string',num2str(e));
set(handles.edit6,'string',num2str(f));

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton4_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
h = -str2double(handles.edit7.String);

f = f+  a*h^2+d*h;
d = d+2*a*h;
e = e+  c*h;

set(handles.edit4,'string',num2str(d));
set(handles.edit5,'string',num2str(e));
set(handles.edit6,'string',num2str(f));

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton5_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
h = -str2double(handles.edit8.String);

f = f+  b*h^2+e*h;
d = d+  c*h;
e = e+2*b*h;

set(handles.edit4,'string',num2str(d));
set(handles.edit5,'string',num2str(e));
set(handles.edit6,'string',num2str(f));

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton6_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
h = str2double(handles.edit8.String);

f = f+  b*h^2+e*h;
d = d+  c*h;
e = e+2*b*h;

set(handles.edit4,'string',num2str(d));
set(handles.edit5,'string',num2str(e));
set(handles.edit6,'string',num2str(f));

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton7_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
theta = -str2double(handles.edit9.String);

a1 = a*cos(theta)^2+b*sin(theta)^2+c*cos(theta)*sin(theta);
b1 = a*sin(theta)^2+b*cos(theta)^2-c*cos(theta)*sin(theta);
c1 = -2*a*cos(theta)*sin(theta)+2*b*cos(theta)*sin(theta)+c*cos(theta)^2-c*sin(theta)^2;
d1 = d*cos(theta)+e*sin(theta);
e1 = -d*sin(theta)+e*cos(theta);

set(handles.edit1,'string',num2str(a1));
set(handles.edit2,'string',num2str(b1));
set(handles.edit3,'string',num2str(c1));
set(handles.edit4,'string',num2str(d1));
set(handles.edit5,'string',num2str(e1));

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton8_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
theta = str2double(handles.edit9.String);

a1 = a*cos(theta)^2+b*sin(theta)^2+c*cos(theta)*sin(theta);
b1 = a*sin(theta)^2+b*cos(theta)^2-c*cos(theta)*sin(theta);
c1 = -2*a*cos(theta)*sin(theta)+2*b*cos(theta)*sin(theta)+c*cos(theta)^2-c*sin(theta)^2;
d1 = d*cos(theta)+e*sin(theta);
e1 = -d*sin(theta)+e*cos(theta);

set(handles.edit1,'string',num2str(a1));
set(handles.edit2,'string',num2str(b1));
set(handles.edit3,'string',num2str(c1));
set(handles.edit4,'string',num2str(d1));
set(handles.edit5,'string',num2str(e1));

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton9_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
meshpoint = zeros(2,2);
i = 0;
for x=str2double(handles.edit10.String):str2double(handles.edit11.String)
    a1 = b;
    b1 = c*x+e;
    c1 = d*x+f+a*x^2;
    if b1^2-4*a1*c1>0
        if (-b1+sqrt(b1^2-4*a1*c1))/2/a1<str2double(handles.edit11.String)
    end
end 

function pushbutton10_Callback(hObject, eventdata, handles)

function pushbutton11_Callback(hObject, eventdata, handles)

function edit10_Callback(hObject, eventdata, handles)
function edit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(hObject, eventdata, handles)
function edit11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit12_Callback(hObject, eventdata, handles)
function edit12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_Callback(hObject, eventdata, handles)
function edit13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
