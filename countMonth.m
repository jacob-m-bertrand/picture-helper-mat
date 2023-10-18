function [found] = countYear(array, monthVal)
    found = 0;
    
    [~, ySize] = size(array);
    
    if ySize == 0
        return;
    end
    
    for ii = 1:ySize
        if array(ii) == monthVal
            found = 1;
        end
    end
end