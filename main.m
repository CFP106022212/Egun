function varargout = main(varargin)
% Begin initialization code - DO NOT EDIT
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



% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = main_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
N = plotline(handles);
a    = N(1);
b    = N(2);
xmin = N(3);
xmax = N(4);
y1   = xmin*a+b;
y2   = xmax*a+b;

tick = 1;
result = zeros(2,4);
for i = floor(xmin):ceil(xmax)
    for j = floor(min([y1,y2]))-1:ceil(max(y1,y2))+1
        if abs(j-i*a-b)<1 || abs(i-(j-b)/a)<1
            result(tick,1:2) = [i,j];
            result(tick,3:4) = [i-(j-b)/a,j-i*a-b];
            tick = tick+1;
        end 
    end 
end 
switch N(5)
    case 1
        result = result(result(:,4)>=0,:);
    case 2
        result = result(result(:,4)<=0,:);
    case 3
        result = result(result(:,3)<=0,:);
    case 4
        result = result(result(:,3)>=0,:);
end
for i = 1:length(result)
    if result(i,3)>1
        result(i,3) = 2;
    end 
    if result(i,4)>1
        result(i,4) = 2;
    end 
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
load('pos.mat');
load('neg.mat');
load('blank.mat');
axes(handles.axes1);
scatter(pos_loc(:,3),pos_loc(:,2));hold on;
scatter(neg_loc(:,3),neg_loc(:,2));
scatter(blank_loc(:,3),blank_loc(:,2));
grid on;axis equal;
dragzoom();


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
cla reset;
