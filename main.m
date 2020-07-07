function varargout = main(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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

function main_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global meshpoint
global allfunction
global i
global fntic
meshpoint   = zeros(2, 5);
allfunction = zeros(2,12);
i = 1;
fntic = 1;
% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function pushbutton1_Callback(hObject, eventdata, handles)
N = plotfunction(handles);
global i
global meshpoint
global fntic
global allfunction
allfunction(fntic,:) = N;
fntic = fntic+1;

disp(N);
data = findmesh(N);
for j = 1:length(data)
    meshpoint(i,:) = [N(12),data(j,:)];
    i = i+1;
end

syms x y;
fun(x,y) = (N(1)*x^2+N(2)*y^2+N(3)*x*y+N(4)*x+N(5)*y+N(6));
fcontour(fun,'LevelList',[0,0]);
xlim([N(7) N(8)]);
ylim([N(9) N(10)]);
hold on
scatter(meshpoint(:,2),meshpoint(:,3));
grid on;axis equal;
dragzoom();

function pushbutton2_Callback(hObject, eventdata, handles)
global allfunction
global oldfn
try
    new = [oldfn;allfunction];
catch
    new = allfunction;
end
[filename filepath] = uiputfile({'*.xlsx','excel'},'save function','function.xlsx');
xlswrite([filepath,filename],new);

function pushbutton3_Callback(hObject, eventdata, handles)
global meshpoint
[filename filepath] = uiputfile({'*.xlsx','excel'},'save meshpoint','meshpoint.xlsx');
new = [meshpoint(:,1) meshpoint(:,3) meshpoint(:,2) meshpoint(:,5) meshpoint(:,4)];
xlswrite([filepath,filename],new);

function pushbutton4_Callback(hObject, eventdata, handles)
global oldfn;
[filename filepath] = uigetfile({'*.xlsx','excel'},'load function');
xlsFile = [filepath,filename];
oldfn = xlsread(xlsFile);

function pushbutton5_Callback(hObject, eventdata, handles)
global oldmesh;
[filename filepath] = uigetfile({'*.xlsx','excel'},'load meshpoint');
xlsFile = [filepath,filename];
oldmesh = xlsread(xlsFile);
data = oldmesh(:,2:end);
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

function pushbutton8_Callback(hObject, eventdata, handles)
cla reset;
clc;clear;
