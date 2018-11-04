% Kevin Seveur
% CSc 4630 Homework #11
% Account: kseveur1 / 002206515
% Due date: November 6th
% A program to super-impose a rectangle over a selected part of an image.
% The input for this program is limited to a .jpg.



% First, use "uigetfile" to allow the user to select an image
[originalImage, folder] = uigetfile('*.jpg');

if originalImage == 0
	% User clicked the Cancel button.
	return;
end

fullFileName = fullfile(folder, originalImage);
myImage = imread(fullFileName);

% Keep the image data in one variable, and make a copy to another.
imageCopy = myImage;

% Show the image
imshow(imageCopy);
[imageRows, imageCols, n] = size(imageCopy);


% Allow the user to select 2 points, to form a rectangle.
 title('Select 2 points');
 [X, Y] = ginput(2);


% If the points are selected in reverse order, or out-of-bounds,it should 
% still work

xmin = min(X);
xmax = max(X);
ymin = min(Y);
ymax = max(Y);
    
if (xmin < 0)
    disp('test1');
    xmin = 3;
end
if(xmax > imageCols)
    disp('test2');
    xmax = imageCols;
end
if(ymin < 0)
    disp('test3');
    ymin = 3;
end
if(ymax > imageRows)
    disp('test4');
    ymax = imageRows;
end

% In the copy, put a red rectangle according to the selected points
rectangle('Position', [xmin - 2, ymin - 2, xmax-xmin+2,...
    ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
