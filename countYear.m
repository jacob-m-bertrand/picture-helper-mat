function [foundAt] = countYear(array, yearVal)
    foundAt = 0;
    
    [~, ySize] = size(array);
    
    if ySize == 0
        return;
    end
    
    for ii = 1:ySize
        if array(ii).year == yearVal
            foundAt = ii;
        end
    end
end