function varargout = deletemeshpoint(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deletemeshpoint_OpeningFcn, ...
                   'gui_OutputFcn',  @deletemeshpoint_OutputFcn, ...
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

function deletemeshpoint_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
uiwait(handles.figure1);

function varargout = deletemeshpoint_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
delete(hObject);

function pushbutton1_Callback(hObject, eventdata, handles)
global meshpoint;
xmin = str2double(handles.edit1.String);
xmax = str2double(handles.edit2.String);
ymin = str2double(handles.edit3.String);
ymax = str2double(handles.edit4.String);
meshpoint = meshpoint(meshpoint(:,2)>xmax|meshpoint(:,2)<xmin|meshpoint(:,3)>ymax|meshpoint(:,3)<ymin,:);
cla;
try
    global rect
    delete(rect)
end
global rect
rect = rectangle('position',[xmin,ymin,xmax-xmin,ymax-ymin],'curvature',[0,0],'edgecolor','r');
hold on;
scatter(meshpoint(meshpoint(:,1)==0,2),meshpoint(meshpoint(:,1)==0,3),'b');
scatter(meshpoint(meshpoint(:,1)==1,2),meshpoint(meshpoint(:,1)==1,3),'g');
scatter(meshpoint(meshpoint(:,1)==2,2),meshpoint(meshpoint(:,1)==2,3),'k');
grid on;axis equal;
dragzoom();

function pushbutton2_Callback(hObject, eventdata, handles)
global meshpoint
handles.output = meshpoint;
guidata(hObject, handles);
uiresume(handles.figure1);

function pushbutton3_Callback(hObject, eventdata, handles)
global meshpoint
[filename filepath] = uigetfile({'*.xlsx','excel'},'load meshpoint');
xlsFile = [filepath,filename];
meshpoint = xlsread(xlsFile);
meshpoint = [meshpoint(:,1) meshpoint(:,3) meshpoint(:,2) meshpoint(:,5) meshpoint(:,4)];
cla;
scatter(meshpoint(meshpoint(:,1)==0,2),meshpoint(meshpoint(:,1)==0,3),'b');hold on;
scatter(meshpoint(meshpoint(:,1)==1,2),meshpoint(meshpoint(:,1)==1,3),'g');
scatter(meshpoint(meshpoint(:,1)==2,2),meshpoint(meshpoint(:,1)==2,3),'k');
grid on;axis equal;
dragzoom();

function pushbutton4_Callback(hObject, eventdata, handles)
xmin = str2double(handles.edit1.String);
xmax = str2double(handles.edit2.String);
ymin = str2double(handles.edit3.String);
ymax = str2double(handles.edit4.String);
try
    global rect
    delete(rect)
end
global rect
rect = rectangle('position',[xmin,ymin,xmax-xmin,ymax-ymin],'curvature',[0,0],'edgecolor','r');

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

