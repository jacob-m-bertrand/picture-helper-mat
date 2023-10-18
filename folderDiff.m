tic
clear
close all
clc

tic
[numTotal] = diff("C:\Users\jacob\Pictures\Device Pictures\Device Pictures")
toc

function [y] = diff(DIR)
y = 0;
% fprintf("Searching Directory %s\n", DIR)

NEW_DIR_BASE = "C:\Users\jacob\Pictures\Device Pictures\Sorted";
imgs = dir(DIR);
dirSize = size(imgs);

% Run until the end of the directory
for ii = 3:dirSize     
    
    name = imgs(ii).name;
    
    if imgs(ii).isdir 
        [tempy] = diff(DIR + "\" + name);
        y = y + tempy;
        continue
    end        
    
    y = y + 1;
end
end
