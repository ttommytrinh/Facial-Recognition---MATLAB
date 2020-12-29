function [] = image_taker(name)
%IMAGE_TAKER uses the webcam to take photos of the person to be saved in
%the database for deep learning.
%Create a database folder, parameter is the person whose photos are being taken.
%Make sure you have selected that folder on Matlab.
%Toolboxes needed: Webcam, Computer Vision, Deep Learning

if ~exist(name, 'dir')
    mkdir(name)
end
a = dir(strcat(name,'\','*.bmp'));
n = numel(a);
cao = webcam;
faceDetector = vision.CascadeObjectDetector;
c = n+75;
temp = n+0;
while true
    e = cao.snapshot;
    bboxes = step(faceDetector,e);
    if (sum(sum(bboxes))~= 0)
    if (temp >= c)
        break;
    else
        es = imcrop(e,bboxes(1,:));
        es = imresize(es,[227 227]);
        filename=strcat(num2str(temp),'.bmp');
        fullfile = strcat(name,"\",filename);
        imwrite(es,fullfile);
        temp = temp+1;
        imshow(es);
        drawnow;
    end
    else
        imshow(e);
        drawnow;
    end
end
close
end

