function varargout = values(varargin)
% VALUES MATLAB code for values.fig
%      VALUES, by itself, creates a new VALUES or raises the existing
%      singleton*.
%
%      H = VALUES returns the handle to a new VALUES or the handle to
%      the existing singleton*.
%
%      VALUES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VALUES.M with the given input arguments.
%
%      VALUES('Property','Value',...) creates a new VALUES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before values_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to values_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help values

% Last Modified by GUIDE v2.5 04-Aug-2016 22:28:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @values_OpeningFcn, ...
                   'gui_OutputFcn',  @values_OutputFcn, ...
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


% --- Executes just before values is made visible.
function values_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to values (see VARARGIN)

% Choose default command line output for values
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes values wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = values_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in generate.
function generate_Callback(hObject, eventdata, handles)
% hObject    handle to generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im1;
global im2;
[peaksnr, snr] = psnr(im2, im1);
[ssimval, ssimmap] = ssim(im2,im1);
err = immse(im2, im1);
pic1 = imgtype(im1);
pic2 = imgtype(im2);
c = corr2(pic1,pic2);
set(handles.pvalue,'String',peaksnr);
set(handles.svalue,'String',ssimval);
set(handles.mvalue,'String',err);
set(handles.cvalue,'String',c);

% --- Executes on button press in loadimage1.
function loadimage1_Callback(hObject, eventdata, handles)
% hObject    handle to loadimage1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im1;
[impath, user_canceled] = imgetfile;
if user_canceled
    msgbox(sprintf('Cancelled by user!\nOperation could not be completed'),'error','error');
    return;
end
im1=imread(impath);
axes(handles.axes1);
imshow(im1);

% --- Executes on button press in loadimage2.
function loadimage2_Callback(hObject, eventdata, handles)
% hObject    handle to loadimage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2;
[impath, user_canceled] = imgetfile;
if user_canceled
    msgbox(sprintf('Cancelled by user!\nOperation could not be completed'),'error','error');
    return;
end
im2=imread(impath);
axes(handles.axes2);
imshow(im2);