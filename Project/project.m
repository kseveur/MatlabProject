
%{

Edited From: RAHUL RANJAN, Avi Nehemiah, MATHWORKS & MATLAB Applications
Authors: Timothy F., Kevin S., Micheal M., Adrian M.

Description: To develop a GUI that recgonizes a face and matches it to the
application's database. The database will automatically check if the
matched faced from the live captured image is present in the database.
 
Assumptions: 
- User knows basic usage of a computers components (mouse, keyboard,
webcam, etc.)
- User has MATLAB2018a with Computer Vision toolbox, Image Acquistion
toolbox and correct video adapter for MATLAB installed. 

Comments: 
% The number of the lines of code will change as we edit the respective sections so disregard them for now. 

Program Outline & Responsiblities

    1.) GUI Initialization code (lines 31 to 48)
        function main_OpeningFcn(hObject, eventdata, handles, varargin)
        function varargout = main_OutputFcn(hObject, eventdata, handles)
        function pushbutton1_Callback(hObject, eventdata, handles) % Timothy F.
            methods (line 88-115 are similar to methods in edit1_KeyPressFcn)

    2.) function AD_NW_IMAGE_Callback(hObject, eventdata, handles)
        function DE_LETE_Callback(hObject, eventdata, handles)
        function TRAIN_ING_Callback(hObject, eventdata, handles)
        function STA_RT_Callback(hObject, eventdata, handles)
        function DATA_BASE_Callback(hObject, eventdata, handles)
        function RESET_ALL_Callback(hObject, eventdata, handles)
        function EXI_T_Callback(hObject, eventdata, handles)
        function HE_LP_Callback(hObject, eventdata, handles)
        function READ_ME_Callback(hObject, eventdata, handles)

    3.) function PRE_CAP_Callback(hObject, eventdata, handles) % Timothy F. 
            methods [line 157-241 are similar to BR_OWSE_Callback]

    4.) function SINGL_PIC_Callback(hObject, eventdata, handles) % Micheal M
            methods
        function MULTI_PIC_Callback(hObject, eventdata, handles) % Micheal M
            methods

    5.) function BR_OWSE_Callback(hObject, eventdata, handles) [lines 420 to 565] % Timothy F.
            methods [line 420-496 are similar to PRE_CAP_Callback]

    6.) function FRM_CAM_Callback(hObject, eventdata, handles) [lines 568 to ] % Micheal M.
            methods

    7.) function edit1_KeyPressFcn(hObject, eventdata, handles) % Timothy F.
            methods for password (line 694-736 similar to pushbutton1_Callback)

    8.) function VI_EW_Callback(hObject, eventdata, handles) % Kevin S. 
            methods % Show the images in the database
        function Start_Training_Callback % Kevin S. (maybe add AVI's machine learning model here)
            methods % To match any image found within the database
            Kevin: Line 339 to 349
            Kevin: Changed findsimilar function
            Kevin: Changed builddatabase function

    9.) function BYE_Callback % To delete the current figure  / Negligible 

    10.)function ATTENDENCE_Callback % Adrian M.
            methods % To record attendance
        function DEL_ATTENDENCE_Callback % Adrian M. 
            methods % To delete attendence sheets within program.
        function Untitled_1_Callback (lines ) % Adrian M. 
            methods  % To delete all the files generated from the GUI.
        function Untitled_2_Callback (lines ) % Adrian M. 
            methods % To clear and reset all handles

    11.)function Untitled_3_Callback % Negligble 
        function Untitled_4_Callback % Negligble 
        function Untitled_5_Callback % Negligble 





Detailed Code Comments Outline:
1. To inizializte the structure for the GUI (lines 31 to 48)
2. List the GUI elements by its callback function (lines 116 to 127,)
3. Selecting an existing image or capturing a new image (lines 127 to 290)
    - To check if there is an exisiting image (line 130-133)
    - To set tge database of the images (line 136)
    - Check to see if database contains an image (lines 138-148)
    - Face detection by detecting an object, stored in variable fd (line 152).
    - To allow user to select a jpeg image (lines 155-158)
    - Build a file based on the different parts selected from uigetfile. 
      Stores the specficiations (values) into variable p1 (line 162).
    - To identify objects with confindence regions within the specficed system. 
      The system must be within the selected image (im) and also detected by fd. 
    
4.
5. 
6. 
7.
8.
9.
10.
11.


Unknowns:
- Not sure what findsimilar means (line 272)

%}

%%% PROJECT MATLAB code for project.fig %%%
% Begin initialization code - DO NOT EDIT
function varargout = project(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @project_OpeningFcn, ...
    'gui_OutputFcn',  @project_OutputFcn, ...
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


% Background Code prior to main_GUI made visible
function project_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);



% Outputs an image to the screen that is 300 * 300, also,  checks the version of MATLAB
% This portion can be deleted or ignored.
function varargout = project_OutputFcn(hObject, eventdata, handles)
global co
clc
warning off
st = version;
if str2double(st(1)) < 8
    beep
    hx  = msgbox('PLEASE RUN IT ON MATLAB 2013 or Higher','INFO...!!!','warn','modal');
    pause(3)
    delete(hx)
    close(gcf)
    return
end
co = get(hObject,'color');
addpath(pwd,'database','codes')
if size(ls('database'),2) == 2
    delete('features.mat');
    delete('info.mat');
end
varargout{1} = handles.output;

% Enabling all handles  of GUI so user can interact with program.
set(handles.AD_NW_IMAGE,'enable','on')
set(handles.DE_LETE,'enable','on')
set(handles.TRAIN_ING,'enable','on')
set(handles.STA_RT,'enable','on')
set(handles.RESET_ALL,'enable','on')
set(handles.EXI_T,'enable','on')
set(handles.HE_LP,'enable','on')
set(handles.DATA_BASE,'enable','on')
set(handles.text5,'visible','on')
set(handles.AD_NW_IMAGE,'enable','on')
set(handles.DE_LETE,'enable','on')
set(handles.TRAIN_ING,'enable','on')
set(handles.STA_RT,'enable','on')
set(handles.RESET_ALL,'enable','on')
set(handles.EXI_T,'enable','on')
set(handles.HE_LP,'enable','on')
set(handles.DATA_BASE,'enable','on')
set(handles.text5,'visible','on')

% The callback functions of the main project_Callback function.
function AD_NW_IMAGE_Callback(hObject, eventdata, handles)
function DE_LETE_Callback(hObject, eventdata, handles)
function TRAIN_ING_Callback(hObject, eventdata, handles)
function STA_RT_Callback(hObject, eventdata, handles)
function DATA_BASE_Callback(hObject, eventdata, handles)
function RESET_ALL_Callback(hObject, eventdata, handles)
function EXI_T_Callback(hObject, eventdata, handles)
function HE_LP_Callback(hObject, eventdata, handles)
function READ_ME_Callback(hObject, eventdata, handles)
system(['open help.txt']) % To open the text file with user's helpful information.

% If user selects an existing image.
function PRE_CAP_Callback(hObject, eventdata, handles)

% Selecting the image, formatting it and training it.
if exist('features.mat','file') == 0
    msgbox('FIRST TRAIN YOUR DATABASE','INFO...!!!','MODAL')
    return
end

% Database
ff = dir('database');

% Check to see if database contains an image.
if length(ff) == 2
    h = waitbar(0,'Please wait until MATLAB scans your database.','name','SCANNING IS IN PROGRESS');
    for k = 1:100
        waitbar(k/100)
        pause(0.03)
    end
    close(h)
    msgbox({'No image is found in database.';'First load your image into the database.';'USE ''ADD NEW IMAGE'' MENU'},'WARNING....!!!','WARN','MODAL')
    return
end

% For face detection, uses computer vision toolbox to detect the face.
% This will be stored in variable fd, (short for fd).
fd = vision.CascadeObjectDetector();

% To select a jpg image. Only works with jpegs.
[f,p] = uigetfile('*.jpg','PLEASE SELECT AN FACIAL IMAGE');
if f == 0
    return
end

% Build a file based on the different parts selected from uigetfile.
% Stores the specficiations (values) into variable p1.
p1 = fullfile(p,f);

% Reads the different parts of the selected image of p1.
im = imread(p1);

% To identify objects with confindence regions within the specficed system.
% The system must be within the selected image (im) and also detected by fd.
bbox = step(fd, im);

% Annotates the image and the annotated area is in a rectangular shape with the label 'FACE'.
vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');

% To check the bbox variable, to  see if it stored anything in the bbox variable.
r = size(bbox,1);

% If the box is empty then resets all axes1 one handles.
% This will delete the image in the left window of the GUI.
if isempty(bbox)
    axes(handles.axes1)
    imshow(vo);
    msgbox({'NO FACE IN THIS PIC';'PLEASE SELECT SINGLE FACE IMAGE'},'WARNING...!!!','warn','modal')
    uiwait
    cla(handles.axes1); reset(handles.axes1); set(handles.axes1,'box','on','xtick',[],'ytick',[])
    return
    
    % To check if the variable bbox has more than one fd (faceDectected) area.
elseif r > 1
    axes(handles.axes1)
    imshow(vo);
    msgbox({'TOO MANY FACES IN THIS PIC';'PLEASE SELECT SINGLE FACE IMAGE'},'WARNING...!!!','warn','modal')
    uiwait
    cla(handles.axes1); reset(handles.axes1); set(handles.axes1,'box','on','xtick',[],'ytick',[])
    return
end

% To select how the face in the image will be extracted.
axes(handles.axes1)
image(vo);
set(handles.axes1,'xtick',[],'ytick',[],'box','on')
bx = questdlg({'CORRECT IMAGE IS SELECTED';'SELECT OPTION FOR FACE EXTRACTION'},'SELECT AN OPTION','MANUALLY','AUTO','CC');

% To allow the user to manually select the face to be extracted from the image.
if strcmp(bx,'MANUALLY') == 1
    % To crop the image.
    while 1
        fhx = figure(2);
        set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
        imc = imcrop(im);
        bbox1 = step(fd, imc);
        if size(bbox1,1) ~= 1
            msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
            uiwait
        else
            close gcf
            break
        end
        close gcf
    end
    
    % To resize the extracted face image to 300 by 300.
    imc = imresize(imc,[300  300]); % imc is short for cropped image.
    image(imc)
    text(20,20,'\bfUr Precaptured image.','fontsize',12,'color','y','fontname','comic sans ms')
    set(handles.axes1,'xtick',[],'ytick',[],'box','on')
end

% To allow the user to have the face extracted automatically by the program.
if strcmp(bx,'AUTO') == 1
    imc = imcrop(im,[bbox(1)-50  bbox(2)-250   bbox(3)+100    bbox(4)+400]); % imc short for cropped image.
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(imc)
    qx = questdlg({'ARE YOU SATISFIED WITH THE RESULTS?';' ';'IF YES THEN PROCEED';' ';'IF NOT BETTER DO MANUAL CROPING'},'SELECT','PROCEED','MANUAL','CC');
    if strcmpi(qx,'proceed') == 1 % Compares strings that are insensitive to case.
        close gcf
        
        % Resizes the image and display the image.
        imc = imresize(imc,[300  300]);
        axes(handles.axes1)
        image(imc)
        text(20,20,'\bfUr Precaptured image.','fontsize',12,'color','y','fontname','comic sans ms')
        set(handles.axes1,'xtick',[],'ytick',[],'box','on')
        
        % Checks to see if image is cropped.
    elseif strcmpi(qx,'manual') == 1 % Compares strings that are insensitive to case.
        while 1
            fhx = figure(2);
            set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
            imc = imcrop(im);
            bbox1 = step(fd, imc);
            if size(bbox1,1) ~= 1
                msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
                uiwait % Block program execution and wait to resume.
            else
                break
            end
            close gcf
        end
        close gcf
        imc = imresize(imc,[300 300]); % Resize the image 300 by 300.
        axes(handles.axes1)
        image(imc)
        text(20,20,'\bfYour precaptured image.','fontsize',12,'color','y','fontname','comic sans ms')
        set(handles.axes1,'xtick',[],'ytick',[],'box','on')
    else
    end
end

%
immxx = getimage(handles.axes1);
fxz = findsimilar(immxx);
% zz = findsimilar(immxx);
% zz = strtrim(zz); % To remove leading and trailing whitespace from string array or character array.
% fxz = imread(['database/'  zz]);
% q1= ehd(immxx,0.1);
% q2 = ehd(fxz,0.1);
% q3 = pdist([q1 ; q2]);
% disp(q3)
% if q3 < 0.5
if true
    axes(handles.axes2)
    image(fxz)
    set(handles.axes1,'xtick',[],'ytick',[],'box','on')
    text(20,20,'\bfUr Database Entered Image.','fontsize',12,'color','y','fontname','comic sans ms')
    set(handles.axes2,'xtick',[],'ytick',[],'box','on')
    xs = load('info.mat');
    xs1 = xs.z2;
    for k = 1:length(xs1)
        st = xs1{k};
        stx = st{1};
        if strcmp(stx,zz) == 1
            str = st{2};
            break
        end
    end
    fid = fopen('attendence_sheet.txt','a');
    fprintf(fid,'%s              %s                %s                %s\r\n\n', 'Name','Date','Time', 'Attendence');
    c = clock;
    if c(4) > 12
        s = [num2str(c(4)-12) ,':',num2str(c(5)), ':', num2str(round(c(6))) ];
    else
        s = [num2str(c(4)) ,':',num2str(c(5)), ':', num2str(round(c(6))) ];
    end
    fprintf(fid,'%s          %s          %s                  %s\r\n\n', str, date,s,'Present');
    fclose(fid);
    set(handles.text5,'string',['Hello ' str ' ,Your attendence has been Marked.'])
    try
        s = serial('com22');
        fopen(s);
        fwrite(s,'A');
        pause(1)
        fclose(s);
        clear s
    catch
        msgbox({'PLZ CONNECT CABLE OR';'INVALID COM PORT SELECTED'},'WARNING','WARN','MODAL')
        uiwait
        delete(s)
        clear s
    end
else
    msgbox('YOU ARE NOT A VALID PERSON', 'WARNING','WARN','MODAL')
    cla(handles.axes1)
    reset(handles.axes1)
    cla(handles.axes2)
    reset(handles.axes2)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5);
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end


% GUI's optional elements continued.
function SINGL_PIC_Callback(hObject, eventdata, handles)
flist  =  dir('database');
if length(flist) == 2
    msgbox('NOTHING TO DELETE','INFO','modal');
    return
end
cd('database')
[f,p] = uigetfile('*.jpg','SELECT A PIC TO DELETE IT');
if f == 0
    cd ..
    return
end
p1 = fullfile(p,f);
delete(p1)
flist  =  dir(pwd);
if length(flist) == 2
    cd ..
    return
end
for k =  3:length(flist)
    z = flist(k).name;
    z(strfind(z,'.') : end) = [];
    nlist(k-2) = str2double(z);
end
nlist  = sort(nlist);
h = waitbar(0,'PLZ WAIT, WHILE MATLAB IS RENAMING','name','PROGRESS...');
for k = 1:length(nlist)
    if k ~= nlist(k)
        p = nlist(k);
        movefile([num2str(p)  '.jpg']  ,  [num2str(k)  '.jpg'])
        waitbar((k-2)/length(flist),h,sprintf('RENAMED  %s   to  %s',[num2str(p)  '.jpg'],[num2str(k)  '.jpg']))
    end
    pause(.5)
end
close(h)
cd ..

% GUI's optional element continued.
% The constructor portion of this element is simlar to previous
% but for multiple cases.
function MULTI_PIC_Callback(hObject, eventdata, handles)
flist  =  dir('database');
if length(flist) == 2
    msgbox('NOTHING TO DELETE','INFO','modal');
    return
end
for k =  3:length(flist)
    na1(k-2,1) = {flist(k).name};
end
[a,b] = listdlg('promptstring','SELECT FILE/FILES TO DELETE','liststring',na1,'listsize',[125  100]);
if b == 0
    return
end
cd ('database')
for k = 1:length(a)
    str = na1{k};
    delete(str)
end
cd ..
flist  =  dir('database');
if length(flist) == 2
    msgbox({'NOTHING TO RENAME';'ALL DELETED'},'INFO','modal');
    return
end
cd('database')
flist  =  dir(pwd);
for k =  3:length(flist)
    z = flist(k).name;
    z(strfind(z,'.') : end) = [];
    nlist(k-2) = str2double(z);
end
nlist  = sort(nlist);
h = waitbar(0,'PLZ WAIT, WHILE MATLAB IS RENAMING','name','PROGRESS...');
for k = 1:length(nlist)
    if k ~= nlist(k)
        p = nlist(k);
        movefile([num2str(p)  '.jpg']  ,  [num2str(k)  '.jpg'])
        waitbar((k-2)/length(flist),h,sprintf('RENAMED  %s   to  %s',[num2str(p)  '.jpg'],[num2str(k)  '.jpg']))
    end
    pause(.5)
end
close(h)
cd ..

% --------------------------------------------------------------------
% GUI's optional elements are continued.
function BR_OWSE_Callback(hObject, eventdata, handles)
[f,p] = uigetfile('*.jpg','PLEASE SELECT AN FACIAL IMAGE');
if f == 0
    return
end
p1 = fullfile(p,f);
im = imread(p1);
fd = vision.CascadeObjectDetector();
bbox = step(fd, im);
vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');
r = size(bbox,1);
if isempty(bbox)
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(vo);
    msgbox({'WHAT HAVE U CHOOSEN?';'NO FACE FOUND IN THIS PIC,';'SELECT SINGLE FACE IMAGE.'},'WARNING...!!!','warn','modal')
    uiwait
    delete(fhx)
    return
elseif r > 1
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(vo);
    msgbox({'TOO MANY FACES IN THIS PIC';'PLEASE SELECT SINGLE FACE IMAGE'},'WARNING...!!!','warn','modal')
    uiwait
    delete(fhx)
    return
end
bx = questdlg({'CORRECT IMAGE IS SELECTED';'SELECT OPTION FOR FACE EXTRACTION'},'SELECT AN OPTION','MANUALLY','AUTO','CC');
if strcmp(bx,'MANUALLY') == 1
    while 1
        fhx = figure(2);
        set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
        imc = imcrop(im);
        bbox1 = step(fd, imc);
        if size(bbox1,1) ~= 1
            msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
            uiwait
        else
            break
        end
        close gcf
    end
    close gcf
    imc = imresize(imc,[300  300]);
    cd ('database');
    l = length(dir(pwd));
    n = [int2str(l-1)    '.jpg'];
    imwrite(imc,n);
    cd ..
    while 1
        qq = inputdlg('WHAT IS UR NAME?','FILL');
        if isempty(qq)
            msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
            uiwait
        else
            break
        end
    end
    qq = qq{1};
    if exist('info.mat','file') == 2
        load ('info.mat')
        r = size(z2,1);
        z2{r+1,1} = {n , qq};
        save('info.mat','z2')
    else
        z2{1,1} = {n,qq};
        save('info.mat','z2')
    end
end
if strcmp(bx,'AUTO') == 1
    imc = imcrop(im,[bbox(1)-50  bbox(2)-250   bbox(3)+100    bbox(4)+400]);
    fhx = figure(2);
    set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
    imshow(imc)
    qx = questdlg({'ARE YOU SATISFIED WITH THE RESULTS?';' ';'IF YES THEN PROCEED';' ';'IF NOT BETTER DO MANUAL CROPING'},'SELECT','PROCEED','MANUAL','CC');
    if strcmpi(qx,'proceed') == 1
        imc = imresize(imc,[300  300]);
        cd ('database');
        l = length(dir(pwd));
        n = [int2str(l-1)    '.jpg'];
        imwrite(imc,n);
        cd ..
        while 1
            qq = inputdlg('WHAT IS UR NAME?','FILL');
            if isempty(qq)
                msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
                uiwait
            else
                break
            end
        end
        qq = qq{1};
        if exist('info.mat','file') == 2
            load ('info.mat')
            r = size(z2,1);
            z2{r+1,1} = {n , qq};
            save('info.mat','z2')
        else
            z2{1,1} = {n,qq};
            save('info.mat','z2')
        end
        close gcf
    elseif strcmpi(qx,'manual') == 1
        while 1
            fhx = figure(2);
            set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
            imc = imcrop(im);
            bbox1 = step(fd, imc);
            if size(bbox1,1) ~= 1
                msgbox({'YOU HAVENT CROPED A FACE';'CROP AGAIN'},'BAD ACTION','warn','modal')
                uiwait
            else
                break
            end
            close gcf
        end
        close gcf
        imc = imresize(imc,[300  300]);
        cd ('database');
        l = length(dir(pwd));
        n = [int2str(l-1)    '.jpg'];
        imwrite(imc,n);
        cd ..
        while 1
            qq = inputdlg('WHAT IS UR NAME?','FILL');
            if isempty(qq)
                msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
                uiwait
            else
                break
            end
        end
        qq = qq{1};
        if exist('info.mat','file') == 2
            load ('info.mat')
            r = size(z2,1);
            z2{r+1,1} = {n , qq};
            save('info.mat','z2')
        else
            z2{1,1} = {n,qq};
            save('info.mat','z2')
        end
    else
        return
    end
end

% --------------------------------------------------------------------
function FRM_CAM_Callback(hObject, eventdata, handles)
global co
if isfield(handles,'vdx')
    vid = handles.vdx;
    stoppreview(vid)
    delete(vid)
    handles = rmfield(handles,'vdx');
    guidata(hObject,handles)
    cla(handles.axes1)
    reset(handles.axes1)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    cla(handles.axes2)
    rescet(handles.axes2)
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end
fd = vision.CascadeObjectDetector();
info = imaqhwinfo('macvideo'); %https://www.mathworks.com/help/imaq/macintosh-video-hardware.html
did = info.DeviceIDs;
if isempty(did)
    msgbox({'YOUR SYSTEM DO NOT HAVE A WEBCAM';' ';'CONNECT A ONE'},'WARNING....!!!!','warn','modal')
    return
end
did = cell2mat(did);
for k = 1:length(did)
    devinfo = imaqhwinfo('macvideo',k); %https://www.mathworks.com/help/imaq/macintosh-video-hardware.htm
    na(1,k) = {devinfo.DeviceName};
    sr(1,k) = {devinfo.SupportedFormats};
end
[a,b] = listdlg('promptstring','SELECT A WEB CAM DEVICE','liststring',na,'ListSize', [125, 75],'SelectionMode','single');
if b == 0
    return
end
if b ~= 0
    frmt = sr{1,a};
    [a1,b1] = listdlg('promptstring','SELECT RESOLUTION','liststring',frmt,'ListSize', [150, 100],'SelectionMode','single');
    if b1 == 0
        return
    end
end
frmt = frmt{a1};
l = find(frmt == '_');
res = frmt(l+1 : end);
l = find(res == 'x');
res1 = str2double(res(1: l-1));
res2 = str2double(res(l+1 : end));
axes(handles.axes1)
vid = videoinput('macvideo', a); % https://www.mathworks.com/help/imaq/macintosh-video-hardware.html
vr  =  [res1    res2];
nbands  =  get(vid,'NumberofBands');
h2im  = image(zeros([vr(2)  vr(1)  nbands] , 'uint8'));
preview(vid,h2im);
handles.vdx = vid;
guidata(hObject,handles)
tx = msgbox('PLZ STAND IN FRONT OF CAMERA STILL','INFO......!!!');
pause(1)
delete(tx)
kx  =  0;
while 1
    im = getframe(handles.axes1);
    im =  im.cdata;
    bbox = step(fd, im);
    vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');
    axes(handles.axes2)
    imshow(vo)
    if size(bbox,1) > 1
        msgbox({'TOO MANY FACES IN FRAME';' ';'ONLY ONE FACE IS ACCEPTED'},'WARNING.....!!!','warn','modal')
        uiwait
        stoppreview(vid)
        delete(vid)
        handles = rmfield(handles,'vdx');
        guidata(hObject,handles)
        cla(handles.axes1)
        reset(handles.axes1)
        set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        cla(handles.axes2)
        reset(handles.axes2)
        set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        return
    end
    kx = kx + 1;
    if kx > 10 && ~isempty(bbox)
        break
    end
end
imc = imcrop(im,[bbox(1)+3    bbox(2)-35    bbox(3)-10      bbox(4)+70]);
imx  =   imresize(imc,[300  300]);
fhx = figure(2);
set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
imshow(imx)
cd ('database');
l = length(dir(pwd));
n = [int2str(l-1)    '.jpg'];
imwrite(imx,n);
cd ..
while 1
    qq = inputdlg('WHAT IS UR NAME?','FILL');
    if isempty(qq)
        msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
        uiwait
    else
        break
    end
end
qq = qq{1};
if exist('info.mat','file') == 2
    load ('info.mat')
    r = size(z2,1);
    z2{r+1,1} = {n , qq};
    save('info.mat','z2')
else
    z2{1,1} = {n,qq};
    save('info.mat','z2')
end
close gcf
stoppreview(vid)
delete(vid)
handles = rmfield(handles,'vdx');
guidata(hObject,handles)
cla(handles.axes1)
reset(handles.axes1)
set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
cla(handles.axes2)
reset(handles.axes2)
set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)

% --------------------------------------------------------------------
function VI_EW_Callback(hObject, eventdata, handles)
f = dir('database');
if length(f) == 2
    msgbox('YOUR DATA BASE HAS NO IMAGE TO DISPLAY','SORRY','modal')
    return
end
l = length(f)-2;
while 1
    a = factor(l);
    if length(a) >= 4
        break
    end
    l = l+1;
end
d  = a(1: ceil(length(a)/2));
d = prod(d);
d1 = a(ceil(length(a)/2)+1  : end);
d1 = prod(d1);
zx = sort([d d1]);
figure('menubar','none','numbertitle','off','name','Images of Database','color',[0.0431  0.5176  0.7804],'position',[300 200 600 500])
for k = 3:length(f)
    im = imread(f(k).name);
    subplot(zx(1),zx(2),k-2)
    imshow(im)
    title(f(k).name,'fontsize',10,'color','w')
end

% --------------------------------------------------------------------
function Start_Training_Callback(hObject, eventdata, handles)
ff = dir('database');
if length(ff) == 2
    h = waitbar(0,'Plz wait Matlab is scanning ur database...','name','SCANNING IS IN PROGRESS');
    for k = 1:100
        waitbar(k/100)
        pause(0.03)
    end
    close(h)
    msgbox({'NO IMAGE FOUND IN DATABASE';'FIRST LOAD YOUR DATABASE';'USE ''ADD NEW IMAGE'' MENU'},'WARNING....!!!','WARN','MODAL')
    return
end
if exist('features.mat','file') == 2
    bx = questdlg({'TRAINING HAS ALREDY BEEN DONE';' ';'WANT TO TRAIN DATABASE AGAIN?'},'SELECT','YES','NO','CC');
    if strcmpi(bx,'yes') == 1
        builddatabase
        msgbox('TRAINING DONE....PRESS OK TO CONTINUE','OK','modal')
        return
    else
        return
    end
else
    builddatabase
    msgbox('TRAINING DONE....PRESS OK TO CONTINUE','OK','modal')
    return
end


% --------------------------------------------------------------------
function BYE_Callback(hObject, eventdata, handles)
close gcf

% --------------------------------------------------------------------
function ATTENDENCE_Callback(hObject, eventdata, handles)
if  exist('attendence_sheet.txt','file') == 2
    winopen('attendence_sheet.txt')
else
    msgbox('NO ATTENDENCE SHEET TO DISPLAY','INFO...!!!','HELP','MODAL')
end

% --------------------------------------------------------------------
function DEL_ATTENDENCE_Callback(hObject, eventdata, handles)
if  exist('attendence_sheet.txt','file') == 2
    delete('attendence_sheet.txt')
    msgbox('ATTENDENCE DELETED','INFO...!!!','MODAL')
else
    msgbox('NO ATTENDENCE SHEET TO DELETE','INFO...!!!','HELP','MODAL')
end

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
x  = questdlg({'Resetting will Clear the followings: ';'1. Attendence_sheet';'2. Database';'3. features.mat';'4. Info.mat';'Do u want to continue?'},'Please select...!!');
if strcmpi(x,'yes') == 1
    delete('attendence_sheet.txt')
    delete('features.mat')
    delete('info.mat')
    cd ([pwd, '\database'])
    f = dir(pwd);
    for k = 1:length(f)
        delete(f(k).name)
    end
    cd ..
    cla(handles.axes1);
    reset(handles.axes1);
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    cla(handles.axes2);
    reset(handles.axes2);
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    set(handles.text5,'string','')
    beep
    msgbox('All Reset','Info','modal')
end

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
cla(handles.axes1);
reset(handles.axes1);
set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
cla(handles.axes2);
reset(handles.axes2);
set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
set(handles.text5,'string','')

function Untitled_3_Callback(hObject, eventdata, handles)
function Untitled_4_Callback(hObject, eventdata, handles)
function Untitled_5_Callback(hObject, eventdata, handles)
