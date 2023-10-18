tic
clear
close all
clc

tic
sortDir("D:\All Pics")
toc

function x = sortDir(DIR)
fprintf("Searching Directory %s\n", DIR)

NEW_DIR_BASE = "C:\Users\jacob\Pictures\Device Pictures\Sorted";
imgs = dir(DIR);
dirSize = size(imgs);

% Run until the end of the directory
for ii = 3:dirSize     
    
    name = imgs(ii).name;
    
%     If the item in the folder is a directory, recursively call this
%     function on the directory then go to the next item.
    if imgs(ii).isdir 
        sortDir(DIR + "\" + name)
        continue
    end

    src = DIR + "\" + name;

%     Acquire the date from the metadata
    month = getLongMonth(imgs(ii).date(4:6));
    year = imgs(ii).date(8:11);
    
      
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
    
	dest = NEW_DIR_BASE + "\" + year + "\" + month + "\";
    
	while exist(dest + name, "file")
        dest = NEW_DIR_BASE + "\" + year + "\" + month + "\";
        dest = dest + "[" + num2str(floor(10000*rand())) + "]";
    end
    
	dest = dest + name;
    
	copyfile(src, dest)

    if ~exist(dest, "file")   
        fprintf("Error Copying File! src: %s, dest: %s\n", src, dest)   
    end
end
end


%     try 
%         longDate = imfinfo(name).DateTime;
%         tempString = strsplit(longDate);
%         date = char(tempString(1));
% 
%         tempString = strsplit(date, ':');
%         month = longMonths(str2num(cell2mat(tempString(2))));
%         year = char(tempString(1));
%     catch 

