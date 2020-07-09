function varargout = plotfunction(varargin)
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
%xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
%ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton2_Callback(hObject, eventdata, handles)
handles.output = [str2double(handles.edit1.String) str2double(handles.edit2.String) str2double(handles.edit3.String) str2double(handles.edit4.String) str2double(handles.edit5.String) str2double(handles.edit6.String) str2double(handles.edit10.String) str2double(handles.edit11.String) str2double(handles.edit12.String) str2double(handles.edit13.String) get(handles.popupmenu1, 'value') get(handles.popupmenu2, 'value')];
%disp([str2double(handles.edit1.String) str2double(handles.edit2.String) str2double(handles.edit3.String) str2double(handles.edit4.String) str2double(handles.edit5.String) str2double(handles.edit6.String) str2double(handles.edit10.String) str2double(handles.edit11.String) str2double(handles.edit12.String) str2double(handles.edit13.String) get(handles.popupmenu1, 'value') get(handles.popupmenu2, 'value')]);
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
%xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
%ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
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
%xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
%ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
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
%xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
%ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
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
%xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
%ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
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

set(handles.edit1,'string',num2str(a1));a = a1;
set(handles.edit2,'string',num2str(b1));b = b1;
set(handles.edit3,'string',num2str(c1));c = c1;
set(handles.edit4,'string',num2str(d1));d = d1;
set(handles.edit5,'string',num2str(e1));e = e1;

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
%xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
%ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
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

set(handles.edit1,'string',num2str(a1));a = a1;
set(handles.edit2,'string',num2str(b1));b = b1;
set(handles.edit3,'string',num2str(c1));c = c1;
set(handles.edit4,'string',num2str(d1));d = d1;
set(handles.edit5,'string',num2str(e1));e = e1;

syms x y;
fun(x,y) = (a*x^2+b*y^2+c*x*y+d*x+e*y+f);
try
    global fc
    delete(fc)
end
global fc
fc = fcontour(fun);
fc.LevelList=[0,0];
%xlim([str2double(handles.edit10.String) str2double(handles.edit11.String)]);
%ylim([str2double(handles.edit12.String) str2double(handles.edit13.String)]);
grid on;axis equal;hold on
dragzoom();

function pushbutton9_Callback(hObject, eventdata, handles)
a = str2double(handles.edit1.String);
b = str2double(handles.edit2.String);
c = str2double(handles.edit3.String);
d = str2double(handles.edit4.String);
e = str2double(handles.edit5.String);
f = str2double(handles.edit6.String);
%meshpoint = zeros(2,2);
%i = 1;
xmin = str2double(handles.edit10.String);
xmax = str2double(handles.edit11.String);
ymin = str2double(handles.edit12.String);
ymax = str2double(handles.edit13.String);

position = get(handles.popupmenu1, 'value');
type     = get(handles.popupmenu2, 'value');
data     = findmesh([a,b,c,d,e,f,xmin,xmax,ymin,ymax,position,type]);
%disp([a,b,c,d,e,f,xmin,xmax,ymin,ymax,position,type]);
try
    global me
    delete(me)
end
global me
me = scatter(data(:,1),data(:,2));

function pushbutton10_Callback(hObject, eventdata, handles)
[filename filepath] = uigetfile({'*.xlsx','excel'},'load meshpoint');
xlsFile = [filepath,filename];
data = xlsread(xlsFile);
data = data(:,2:end);
linepoint = zeros(2,2);
j = 1;
for i = 1:length(data)
    if data(i,3) == 2
        linepoint(j,:)=[data(i,1),data(i,2)+data(i,4)];
        j = j+1;
    elseif data(i,4) == 2
        linepoint(j,:)=[data(i,1)+data(i,3),data(i,2)];
        j = j+1;
    else
        linepoint(j,:)=[data(i,1)+data(i,3),data(i,2)];
        linepoint(j+1,:)=[data(i,1),data(i,2)+data(i,4)];
        j = j+2;
    end
end
scatter(linepoint(:,2),linepoint(:,1));
grid on;axis equal;hold on
dragzoom();

function pushbutton11_Callback(hObject, eventdata, handles)
cla reset;
set(handles.edit1,'string','0');
set(handles.edit2,'string','0');
set(handles.edit3,'string','0');
set(handles.edit4,'string','0');
set(handles.edit5,'string','0');
set(handles.edit6,'string','0');
set(handles.edit7,'string','0');
set(handles.edit8,'string','0');
set(handles.edit9,'string','0');

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
