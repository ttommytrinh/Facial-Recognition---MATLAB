function [] = face_matching()
%FACE_MATCHING this function will open a live webcam, if the face
%recognizes one in the database, it will appear the name of the person
%(folder name)
c = webcam;
load FaceMatching;
faceDetector = vision.CascadeObjectDetector;
while true
    e = c.snapshot;
    bboxes = step(faceDetector,e);
    if (sum(sum(bboxes))~= 0)
        es = imcrop(e,bboxes(1,:));
        es = imresize(es,[227 227]);
        label = classify(FaceMatching,es);
        image(e);
        title(char(label));
        drawnow;
    else
        image(e);
        title('No Face Detected');
    end
end
end

