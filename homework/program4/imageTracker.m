classdef imageTracker < handle
    % This class houses all the functionality needed to manipulate images
    % via the GUI
    
    properties
        images=[];  % stores versions of the images
        index;      % Index for image count
        hRectangle; % stores
    end
    
    methods
        % Contructor
        function obj = imageTracker(image1)
            obj.index = 1;
            obj.images{obj.index} = imread(image1);
        end
        
        
        % Getter method to returns the image file matrix
        function obj = getImage(obj)
            obj = obj.images{end};
        end
        
        
        % Setter method to set a new image into the image array
        function obj = setImage(obj, N)
            newindex = (obj.index + 1);
            obj.index = newindex;
            try
                obj.images{obj.index} = imread(N);
            catch
                obj.images{obj.index} = N;
            end
        end
        
        
        % Function that controls the red-eye correction in the image
        function obj = redctrl(obj,src,eventData)
            %             if (obj.hRectangle ~= 0)
            %                 delete(obj.hRectangle);
            %             end
            
            tempImage = obj.getImage();
            [imageRows, imageCols, n] = size(tempImage);
            
            
            % Allow the user to select 2 points, to form a rectangle.
            title('Select 2 points');
            [X, Y] = ginput(2);
            
            
            % If the points are selected in reverse order, or out-of-bounds,it should
            % still work
            
            xmin = round(min(X));
            xmax = round(max(X));
            ymin = round(min(Y));
            ymax = round(max(Y));
            
            if (xmin < 0)
                xmin = 3;
            end
            if(xmax > imageCols)
                xmax = imageCols;
            end
            if(ymin < 0)
                ymin = 3;
            end
            if(ymax > imageRows)
                ymax = imageRows;
            end
            
            % Put a red rectangle according to the selected points
            obj.hRectangle = rectangle('Position', [xmin - 2, ymin - 2, ...
                xmax-xmin+2, ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
            
            % Remove red from the image in the selected area
            tempImage(ymin:ymax,xmin:xmax,1) = 0;
            
            % Set the new image into the image array
            obj.setImage(tempImage); 
            imshow(obj.getImage());
            
            % Redraw the rectangle to give visibility to user
            obj.hRectangle = rectangle('Position', [xmin - 2, ymin - 2, ...
                xmax-xmin+2, ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
            pause(2);
            
            % Remove the red rectangle from image
            delete(obj.hRectangle);
        end
        
        
        % Function to control the greyscale feature
        function obj = greyctrl(obj,src,eventData)
            
            tempImage = obj.getImage();
            [imageRows, imageCols, n] = size(tempImage);
            
            
            % Allow the user to select 2 points, to form a rectangle.
            title('Select 2 points');
            [X, Y] = ginput(2);
            
            
            % If the points are selected in reverse order, or out-of-bounds,it should
            % still work
            
            xmin = round(min(X));
            xmax = round(max(X));
            ymin = round(min(Y));
            ymax = round(max(Y));
            
            if (xmin < 0)
                xmin = 3;
            end
            if(xmax > imageCols)
                xmax = imageCols;
            end
            if(ymin < 0)
                ymin = 3;
            end
            if(ymax > imageRows)
                ymax = imageRows;
            end
            
            % Put a red rectangle according to the selected points
            obj.hRectangle = rectangle('Position', [xmin - 2, ymin - 2, ...
                xmax-xmin+2, ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
            BW = rgb2gray(tempImage(ymin:ymax,xmin:xmax,:));
            size(BW)
            size(tempImage)
            
            tempImage(ymin:ymax,xmin:xmax) = BW;
            
            obj.setImage(tempImage);
            imshow(obj.getImage());
            obj.hRectangle = rectangle('Position', [xmin - 2, ymin - 2, ...
                xmax-xmin+2, ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
            pause(2);
            delete(obj.hRectangle);
        end
        
        
        % Function to control the bluring of the image
        function obj = blurctrl(obj,src,eventData)
            tempImage = obj.getImage();
            [imageRows, imageCols, n] = size(tempImage);
            
            
            % Allow the user to select 2 points, to form a rectangle.
            title('Select 2 points');
            [X, Y] = ginput(2);
            
            
            % If the points are selected in reverse order, or out-of-bounds,it should
            % still work
            
            xmin = round(min(X));
            xmax = round(max(X));
            ymin = round(min(Y));
            ymax = round(max(Y));
            
            if (xmin < 0)
                xmin = 3;
            end
            if(xmax > imageCols)
                xmax = imageCols;
            end
            if(ymin < 0)
                ymin = 3;
            end
            if(ymax > imageRows)
                ymax = imageRows;
            end
            
            % In the copy, put a red rectangle according to the selected points
            obj.hRectangle = rectangle('Position', [xmin - 2, ymin - 2, ...
                xmax-xmin+2, ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
            iblur = imgaussfilt(tempImage(ymin:ymax,xmin:xmax, :),10);
            
            tempImage(ymin:ymax,xmin:xmax,:) = iblur(:,:,:);
            obj.setImage(tempImage);
            imshow(obj.getImage());
            obj.hRectangle = rectangle('Position', [xmin - 2, ymin - 2, ...
                xmax-xmin+2, ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
            pause(2);
            delete(obj.hRectangle);
        end
        
        
        % Function to control the undo feature
        function obj = undoctrl(obj,src,eventData)
            if (obj.index > 1)
                obj.index= obj.index - 1;
                obj.images(end) = [];
                imshow(obj.getImage());
            end
        end
        
        
        % Function to control the closing of the program
        function obj = closectrl(obj,src,eventData)
            close all;
        end
        
    end
end

