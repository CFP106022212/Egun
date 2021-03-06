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
global oldmesh
global oldfn
global fntic
global i
meshpoint   = zeros(1, 5);
allfunction = zeros(1,14);
oldmesh     = zeros(1, 5);
oldfn       = zeros(1,14);
fntic = 1;
i = 1;
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

data = findmesh(N);
for j = 1:length(data)
    if N(14)~=0
        if data(j,3) == 0
            data(j,3) = 0.001;
        end
        if data(j,4) == 0
            data(j,4) = 0.001;
        end
    end 
    meshpoint(i,:) = [N(14),data(j,:)];
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
try
    delete([filepath,filename]);
end
xlswrite([filepath,filename],new);

function pushbutton4_Callback(hObject, eventdata, handles)
global oldfn;
global oldmesh;
[filename filepath] = uigetfile({'*.xlsx','excel'},'load function');
xlsFile = [filepath,filename];
oldfn = xlsread(xlsFile);
%%%%%%%%
for i = 1:length(oldfn(:,1))
    data = findmesh(oldfn(i,:));
    oldmesh = [oldmesh;[oldfn(i,14)*ones(length(data(:,1)),1) data]];
end
oldmesh = oldmesh(2:end,:);
%%%%%%%%
linepoint = zeros(2,3);
j = 1;
for i = 1:length(oldmesh(:,1))
    if oldmesh(i,4) == 2
        linepoint(j,:)=[oldmesh(i,1),oldmesh(i,2),oldmesh(i,3)+oldmesh(i,5)];
        j = j+1;
    elseif oldmesh(i,5) == 2
        linepoint(j,:)=[oldmesh(i,1),oldmesh(i,2)+oldmesh(i,4),oldmesh(i,3)];
        j = j+1;
    else
        linepoint(j,:)=[oldmesh(i,1),oldmesh(i,2)+oldmesh(i,4),oldmesh(i,3)];
        linepoint(j+1,:)=[oldmesh(i,1),oldmesh(i,2),oldmesh(i,3)+oldmesh(i,5)];
        j = j+2;
    end
end
cla;
scatter(linepoint(linepoint(:,1)==0,3),linepoint(linepoint(:,1)==0,2),'b');hold on;
scatter(linepoint(linepoint(:,1)==1,3),linepoint(linepoint(:,1)==1,2),'g');
scatter(linepoint(linepoint(:,1)==2,3),linepoint(linepoint(:,1)==2,2),'k');
scatter(linepoint(linepoint(:,1)==3,3),linepoint(linepoint(:,1)==3,2),'c');
scatter(linepoint(linepoint(:,1)==4,3),linepoint(linepoint(:,1)==4,2),'m');
scatter(linepoint(linepoint(:,1)==5,3),linepoint(linepoint(:,1)==5,2),'y');
grid on;axis equal;
dragzoom();

function pushbutton5_Callback(hObject, eventdata, handles)
global oldmesh;
[filename filepath] = uigetfile({'*.xlsx','excel'},'load meshpoint');
xlsFile = [filepath,filename];
oldmesh = xlsread(xlsFile);
linepoint = zeros(2,3);
j = 1;
for i = 1:length(oldmesh)
    if oldmesh(i,4) == 2
        linepoint(j,:)=[oldmesh(i,1),oldmesh(i,2),oldmesh(i,3)+oldmesh(i,5)];
        j = j+1;
    elseif oldmesh(i,5) == 2
        linepoint(j,:)=[oldmesh(i,1),oldmesh(i,2)+oldmesh(i,4),oldmesh(i,3)];
        j = j+1;
    else
        linepoint(j,:)=[oldmesh(i,1),oldmesh(i,2)+oldmesh(i,4),oldmesh(i,3)];
        linepoint(j+1,:)=[oldmesh(i,1),oldmesh(i,2),oldmesh(i,3)+oldmesh(i,5)];
        j = j+2;
    end
end
cla;
scatter(linepoint(linepoint(:,1)==0,3),linepoint(linepoint(:,1)==0,2),'b');hold on;
scatter(linepoint(linepoint(:,1)==1,3),linepoint(linepoint(:,1)==1,2),'g');
scatter(linepoint(linepoint(:,1)==2,3),linepoint(linepoint(:,1)==2,2),'k');
scatter(linepoint(linepoint(:,1)==3,3),linepoint(linepoint(:,1)==3,2),'c');
scatter(linepoint(linepoint(:,1)==4,3),linepoint(linepoint(:,1)==4,2),'m');
scatter(linepoint(linepoint(:,1)==5,3),linepoint(linepoint(:,1)==5,2),'y');
grid on;axis equal;
dragzoom();

function pushbutton8_Callback(hObject, eventdata, handles)
cla reset;
clc;clear;
global meshpoint
global allfunction
global oldmesh
global oldfn
global fntic
global i
meshpoint   = zeros(1, 5);
allfunction = zeros(1,14);
oldmesh     = zeros(1, 5);
oldfn       = zeros(1,14);
fntic = 1;
i = 1;

function pushbutton9_Callback(hObject, eventdata, handles)
global oldmesh
meshpoint = oldmesh(:,2:3);
meshpoint = sortrows(meshpoint);
doublepoint = zeros(1,2);
j = 1;
for i = 1:length(meshpoint)-1
   if  meshpoint(i,1)==meshpoint(i+1,1) && meshpoint(i,2)==meshpoint(i+1,2)
       doublepoint(j,:) = meshpoint(i,1:2);
       j = j+1;
   end
end
if j~=1
   scatter(doublepoint(:,2),doublepoint(:,1),100,'r');
   disp(doublepoint);
   grid on;axis equal;
   
else
   disp('No double used points');
end

function pushbutton10_Callback(hObject, eventdata, handles)
%global oldmesh
global meshpoint
N = deletemeshpoint(handles);
meshpoint = N;
cla;
scatter(N(N(:,1)==0,2),N(N(:,1)==0,3),'b');hold on;
scatter(N(N(:,1)==1,2),N(N(:,1)==1,3),'g');
scatter(N(N(:,1)==2,2),N(N(:,1)==2,3),'k');
scatter(N(N(:,1)==3,2),N(N(:,1)==3,3),'c');
scatter(N(N(:,1)==4,2),N(N(:,1)==4,3),'m');
scatter(N(N(:,1)==5,2),N(N(:,1)==5,3),'y');
hold on;grid on;axis equal;
dragzoom();

