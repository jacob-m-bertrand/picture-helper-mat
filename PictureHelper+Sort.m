tic
clear
close all
clc

% Jacob Bertrand 2020
% Purpose: a tool to help me sort through pictures
% Timing: processes approx. 171.1 MB of mixed format photo/video per second
% Method: sorts the pictures into month/year. The data will still be kept
% by device in a separate folder area, but this is really for convenience
% Will be modified to allow catagory sorting
% TO DO: Add needs to be deleted and buzz lightyear scores folder (scores
% folder being a master folder outside of the year filestructure)

% Constants
DIR_BASE = "C:\Users\jacob\Desktop\Programming\Picture Helper";
DIR_EXT = "\Sample2";
DIR = strcat(DIR_BASE, DIR_EXT);
NEW_DIR_BASE = DIR_BASE + "\Sample_Sorted";

% Initialize variables
imgs = dir(DIR);
sortedImgs = dir(NEW_DIR_BASE);
dirSize = size(imgs);
deleteImgs = [];

figure 
hold on

fprintf("1 for nice pictures\n2 for memes\n3 for buzz scores\n4 to mark for deletion\nAny other key to continue\n");

% Run until the end of the directory
for ii = 3:dirSize  
    name = imgs(ii).name;
    extension = name(size(name, 2) - 3:size(name,2));
    if ~strcmp(extension, ".JPG") && ~strcmp(extension, ".PNG")
        fprintf("WARNING: EXTENSION %s SKIPPED\n", extension)
        src = DIR + "\" + name;
        dest = NEW_DIR_BASE + "\" + year + "\" + month + "\unsorted" + "\" + name;
        copyfile(src, dest);
        
        continue;
    end
    

    month = getLongMonth(imgs(ii).date(4:6));
    year = imgs(ii).date(8:11);

    
%     If the long month is NULL, we have a problem
    if strcmp(month,"(NULL)") 
        fprintf("This is the end for you my master") 
        break
    end
    
%     If the year is not found, then create a dir for the year
    tempDir = NEW_DIR_BASE + "\" + year;
    if ~exist(tempDir, "dir")
        mkdir(NEW_DIR_BASE, year);
    end
        
%     if there isnt a directory for the month, create one
    tempDir = NEW_DIR_BASE + "\" + year + "\" + month;
    if ~exist(tempDir, "dir")
        mkdir(tempDir)
    end
    
    tempDir = NEW_DIR_BASE + "\" + year + "\" + month + "\unsorted";
    if ~exist(tempDir, "dir")
        mkdir(tempDir)
    end
    
    tempDir = NEW_DIR_BASE + "\" + year + "\" + month + "\Nice Pictures";
    if ~exist(tempDir, "dir")
        mkdir(tempDir)
    end
    
    tempDir = NEW_DIR_BASE + "\" + year + "\" + month + "\memes";
    if ~exist(tempDir, "dir")
        mkdir(tempDir)
    end
    
    tempDir = NEW_DIR_BASE + "\Buzz Scores";
    if ~exist(tempDir, "dir")
        mkdir(tempDir)
    end
    
    
    tempDir = DIR_BASE + DIR_EXT + "\" + name;
    imgDraw = imread(tempDir);
    imshow(imgDraw);
    
    drawnow
    
    Copy the file into the directory
    src = DIR + "\" + name;
    dest = NEW_DIR_BASE + "\" + year + "\" + month + "\unsorted" + "\" + name;
    copyfile(src, dest);
    


    
    
    k = waitforbuttonpress;
    fate = double(get(gcf, "CurrentCharacter"));
    
    switch fate
        case 49
            dest = NEW_DIR_BASE + "\" + year + "\" + month + "\Nice Pictures" + "\" + name;
        case 50
            dest = NEW_DIR_BASE + "\" + year + "\" + month + "\memes" + "\" + name;
        case 51
            dest = NEW_DIR_BASE + "\Buzz Scores\" + name;
        case 52
            deleteImgs = [deleteImgs name];
        otherwise
            continue;
    end
    
    copyfile(src, dest);
end

toc



