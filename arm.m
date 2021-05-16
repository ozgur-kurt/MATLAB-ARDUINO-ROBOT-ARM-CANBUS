function varargout = arm(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arm_OpeningFcn, ...
                   'gui_OutputFcn',  @arm_OutputFcn, ...
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

function arm_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);


function varargout = arm_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

disp('Gui icin Peter Corke Robotics Toolbox robot-9.10 yuklu olmalidir.')
disp('Peter Corke Robotics Toolbox robot-9.10 should be installed in order to executing the GUI')
movegui(gcf,'center')





function theta_one_Callback(hObject, eventdata, handles)

edit_theta_one=get(hObject,'string');
set(handles.slider1,'value',str2num(edit_theta_one));
guidata(hObject,handles);


global ard;
fwrite(ard,strcat(edit_theta_one,'1','\n'), 'uchar')

function theta_one_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function slider1_Callback(hObject, eventdata, handles)

theta1value=round(get(hObject,'value'))
set(handles.theta_one,'string',num2str(theta1value));
guidata(hObject,handles);

global ard;
fwrite(ard,strcat(num2str(theta1value),'1','\n'), 'uchar')


function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function theta_two_Callback(hObject, eventdata, handles)

edit_theta_two=get(hObject,'string');
set(handles.slider3,'value',str2num(edit_theta_two));
guidata(hObject,handles);

global ard;
fwrite(ard,strcat(edit_theta_two,'2','\n'), 'uchar')

function theta_two_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider3_Callback(hObject, eventdata, handles)

theta2value=round(get(hObject,'value'))
set(handles.theta_two,'string',num2str(theta2value));
guidata(hObject,handles);


global ard;
fwrite(ard,strcat(num2str(theta2value),'2','\n'), 'uchar')


function slider3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function theta_three_Callback(hObject, eventdata, handles)

edit_theta_three=get(hObject,'string');
set(handles.slider4,'value',str2num(edit_theta_three));
guidata(hObject,handles);


global ard;
fwrite(ard,strcat(edit_theta_three,'3','\n'), 'uchar')

function theta_three_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function slider4_Callback(hObject, eventdata, handles)

theta3value=round(get(hObject,'value'))
set(handles.theta_three,'string',num2str(theta3value));
guidata(hObject,handles);


global ard;
fwrite(ard,strcat(num2str(theta3value),'3','\n'), 'uchar')






function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function pos_x_Callback(hObject, eventdata, handles)

function pos_x_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_y_Callback(hObject, eventdata, handles)

function pos_y_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_z_Callback(hObject, eventdata, handles)


function pos_z_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function button_forward_Callback(hObject, eventdata, handles)

thetaone = str2double(handles.theta_one.String)*pi/180;
thetatwo = str2double(handles.theta_two.String)*pi/180;
thetathree = str2double(handles.theta_three.String)*pi/180;

Lone=20;
Ltwo=50;
Lthree=40;

L (1) = Link([0 Lone 0 pi/2]);
L (2) = Link([0 0 Ltwo 0]);
L (3) = Link([0 0 Lthree 0]);

Manipulator = SerialLink(L);
Manipulator.name = '3DofManipulator';
Manipulator.plot([thetaone thetatwo thetathree])

T = Manipulator.fkine([thetaone thetatwo thetathree])
handles.pos_x.String = num2str(floor(T(1,4)));
handles.pos_y.String = num2str(floor(T(2,4)));
handles.pos_z.String = num2str(floor(T(3,4)));
movegui(gcf,'center')


function button_inverse_Callback(hObject, eventdata, handles)
PosX = str2double(handles.pos_x.String);
PosY = str2double(handles.pos_y.String);
PosZ = str2double(handles.pos_z.String);

Lone=20;
Ltwo=50;
Lthree=40;

L (1) = Link([0 Lone 0 pi/2]);
L (2) = Link([0 0 Ltwo 0]);
L (3) = Link([0 0 Lthree 0]);

Manipulator = SerialLink(L);
Manipulator.name = '3DofManipulator';

T = [ 1 0 0 PosX ;
      0 1 0 PosY ; 
      0 0 1 PosZ ; 
      0 0 0 1    ]

J = Manipulator.ikine(T,[0 0 0],[1 1 1 0 0 0])*180/pi;
handles.theta_one.String = num2str(floor(J(1)));
handles.theta_two.String = num2str(floor(J(2)));
handles.theta_three.String = num2str(floor(J(3)));

Manipulator.plot(J*pi/180);
global ard;
fwrite(ard,strcat(num2str(round(floor(J(1)))),'1','\n'), 'uchar')
pause(0.2)
fwrite(ard,strcat(num2str(round(floor(J(2)))),'2','\n'), 'uchar')
pause(0.2)
fwrite(ard,strcat(num2str(round(floor(J(3)))),'3','\n'), 'uchar')

movegui(gcf,'center')


function comport_Callback(hObject, eventdata, handles)



function comport_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', ComPortsFind()); 


function baudrate_Callback(hObject, eventdata, handles)



function baudrate_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function connect_Callback(hObject, eventdata, handles)
contents = get(handles.comport,'String'); 
com = contents{get(handles.comport,'Value')};
global baud;
global baudindex;
baudindex = handles.baudrate.Value;
baudrate_value();


global ard;
delete(instrfind);
ard = serial(com);
set(ard,'Baudrate',baud); 
set(ard,'Timeout',5); 
if strcmp(get(ard,'Status'),'closed') && ~strcmp(ComPortsFind(),'')
fopen(ard); 
end
disp('Arduino baglandi')
disp('Arduino is connected')
movegui(gcf,'center')





function disconnect_Callback(hObject, eventdata, handles)
global ard;

if strcmp(get(ard,'Status'),'open')
    fclose(ard);
    delete(instrfind);
    disp('<< Arduino baglantisi kesildi >>')
    disp('<< Arduino is disconnected >>')
end
disp('Baglanti bulunamadi')
disp('No connection')
movegui(gcf,'center')


function [] = baudrate_value()

global baud;
global baudindex;
switch baudindex
    case 1
    baud = 1200;
    case 2
    baud = 1800;
    case 3
    baud = 2400;
    case 4
    baud = 4800;
    case 5
    baud = 9600;
    case 6
    baud = 19200;
    case 7
    baud = 38400;
    case 8
    baud = 115200;
  end

   

function COMPortID = ComPortsFind()
try
    s=serial('No Port(Port bulunamadi)');fopen(s); 
catch
    MessageError = lasterr;
end
IndexID1 = findstr(MessageError,'COM');
IndexID2 = findstr(MessageError,'Use')-3;
COMPORTStr = MessageError(IndexID1:IndexID2);
IndexNUM = findstr(COMPORTStr,',');

if isempty(IndexID1)
    COMPortID{1}='';
    return;
end
if isempty(IndexNUM)
    COMPortID{1}=COMPORTStr;
    return;
end
COMPortID{1} = COMPORTStr(1:IndexNUM(1)-1);
for i=1:numel(IndexNUM)+1
    if (i==1)
        COMPortID{1,1} = COMPORTStr(1:IndexNUM(i)-1);
    elseif (i==numel(IndexNUM)+1)
        COMPortID{i,1} = COMPORTStr(IndexNUM(i-1)+2:end);       
    else
        COMPortID{i,1} = COMPORTStr(IndexNUM(i-1)+2:IndexNUM(i)-1);
    end
end    
