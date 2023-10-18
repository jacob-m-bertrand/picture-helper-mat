clear
close all
clc

DIR = "C:\Users\jacob\Pictures\Device Pictures\Sorted\2016\December
";
DELETED_DIR = "C:\Users\jacob\Pictures\Device Pictures\Deletes";

imgs = dir(DIR);
dirSize = size(imgs);

fprintf("Press numpad enter if the image is a duplicate, any other button if they are not\n")

% Run until the end of the directory
for ii = 3:dirSize         
    anchorName = imgs(ii).name;
    anchorSrc = DIR + "\" + anchorName;
    
    imreads = [];
    todelete = [];
    

    
    for jj = ii:dirSize
        name = imgs(jj).name;
        
        if name(1) ~= '[' 
            continue 
        end
        
        if ~strcmp(extractAfter(name,']'), anchorName)
            continue
        end
        
        [~, ~, ext] = fileparts(name);
        
        if ~strcmpi(ext, '.jpg') && ~strcmpi(ext, '.png')
            continue
        end
                
        src = DIR + "\" + name;
        
        try
            anchorImg = imread(anchorSrc);
        catch
            continue
        end
        img = imread(src);
        if mean(mean(anchorImg(1,10,1)))~=mean(mean(img(1,10,1)))
            continue
        end
        
        try
            imreads = [imreads imresize(imread(src),.1)];
            todelete = [todelete src];
        catch
            continue
        end
    end   
    if size(imreads) > 0
        close all;
        figure
        try
            imshow([imresize(imread(anchorSrc),.1) imreads]);
        catch
            continue
        end

        k = waitforbuttonpress;
        value = double(get(gcf,'CurrentCharacter'));
        
        if value == 13
           for jj=1:size(todelete,2)
               temp = todelete(jj);
               copyfile(temp, DELETED_DIR);

               delete(temp)
           end
        end  
    end
end

close all
fprintf("Directory %s clear of duplicates\n", DIR)

