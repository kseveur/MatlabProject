classdef imageTracker < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        images=[];
        index;
        hRectangle;
    end
    
    methods
        function obj = imageTracker(image1)
            obj.index = 1;
            obj.images{obj.index} = imread(image1);
            obj.hRectangle = 0;
            
        end
        
        %Returns the image file matrix
        function obj = getImage(obj)
            obj = obj.images{end};
        end
        
        function obj = setImage(obj, N)
            newindex = (obj.index + 1);
            obj.index = newindex;
            try
                obj.images{obj.index} = imread(N);
            catch
                obj.images{obj.index} = N;
            end
        end
        
        
        
        function obj = redctrl(obj,src,eventData)
            if (obj.hRectangle ~= 0)
                delete(obj.hRectangle);
            end
            
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
            
            tempImage(ymin:ymax,xmin:xmax,1) = 0;
            obj.setImage(tempImage);
             %delete(obj.hRectangle);
            %axes(axisHandle);
            imshow(obj.getImage());
            obj.hRectangle = rectangle('Position', [xmin - 2, ymin - 2, ...
                xmax-xmin+2, ymax-ymin+2],'EdgeColor', 'r','LineWidth',3);
        end
    end
end

