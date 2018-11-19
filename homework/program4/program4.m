% Kevin Seveur
% CSc 4630 Program #4
% Account: kseveur1 / 002206515
% Due date: November 27th




function program4()
clc;
clear;
close all;


figHandle = figure('pos',[10 10 900 600]);
[originalImage, folder] = uigetfile('*.jpg');

if originalImage == 0
	% User clicked the Cancel button.
	return;
end

fullFileName = fullfile(folder, originalImage);
currentImage = imageTracker(fullFileName);



redButton = uicontrol(figHandle, ...
    'Style', 'pushButton',...
    'String', 'Red Eye Removal',...
    'Position', [40 500 200 50], ...
    'Callback', @currentImage.redctrl);

greyButton = uicontrol(figHandle, ...
    'Style', 'pushButton',...
    'String', 'Gray Scale',...
    'Position', [40 425 200 50], ...
    'Callback', 'ex_closeCB');

blurButton = uicontrol(figHandle, ...
    'Style', 'pushButton',...
    'String', 'Blur',...
    'Position', [40 350 200 50], ...
    'Callback', 'ex_closeCB');

undoButton = uicontrol(figHandle, ...
    'Style', 'pushButton',...
    'String', 'Undo',...
    'Position', [40 275 200 50], ...
    'Callback', 'ex_closeCB');

axisHandle = axes(figHandle, ...
    'position',[.3  .0  .6  1.1],...
    'Visible', 'off');





% Show the image
imshow(currentImage.getImage(), 'Parent', axisHandle);


end

