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

data = findmesh(N);
for j = 1:length(data)
    meshpoint(i,:) = [N(12),data(j,:)];
    i = i+1;
end

syms x y;
fun(x,y) = (N(1)*x^2+N(2)*y^2+N(3)*x*y+N(4)*x+N(5)*y+N(6));
fc = fcontour(fun);
fc.LevelList=[0,0];
xlim([N(7) N(8)]);
ylim([N(9) N(10)]);
hold on
scatter(meshpoint(:,1),meshpoint(:,2));
grid on;axis equal;
dragzoom();

function pushbutton2_Callback(hObject, eventdata, handles)




function pushbutton3_Callback(hObject, eventdata, handles)




function pushbutton4_Callback(hObject, eventdata, handles)




function pushbutton5_Callback(hObject, eventdata, handles)




function pushbutton6_Callback(hObject, eventdata, handles)




function pushbutton7_Callback(hObject, eventdata, handles)
cla reset;
clc;clear;
