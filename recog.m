function R=recog()
NB=8;
FS=22050;
if (exist('voice_database2.dat','file')==2)
    load('voice_database2.dat','-mat');
    else
    warndlg('Database is Empty');
    error('Database is Empty');
end
% duration=input('Enter the duration of recording(in seconds): ');
duration=3;
% if isempty(duration)
%     error('Invalid Duration');
% end
recording=audiorecorder(FS,NB,1);
display('Speak');
record(recording,duration);
while(isrecording(recording)==1)
%     msgbox('Recording...');
    disp('recording...');
    pause(0.5);
%     close
end
    display('Recording stopped');
% msgbox('Recording Stopped');

D1=getaudiodata(recording);
st='U';
wavwrite(D1,FS,NB,st);
k=16;
code={8};
v={8};
D1 = getaudiodata(recording, 'uint8');
if size(D1,2)==2
   D1=D1(:,1);
end
D1 = double(D1);

for i=1:sound_number
    v=mfcc(data{i,1}, FS);
%     whos v
    code{i}=vqlbg(v,k);
    display('...');
end
v = mfcc(D1,FS);
distmin = Inf;
k1=0;
for i=1:sound_number
    d = disteu(v, code{i});
    dist = sum(min(d,[],2)) / size(d,1);
        if dist < distmin
           distmin = dist;
           k1 = i;
        end
end
display(distmin)
if (distmin>4 && distmin<8)
    speech_id=data{k1,2};
%     name=data{k1,3};
    A=strcat('Recognised speaker Id # ',num2str(speech_id));
    msgbox(A);
%     stl_mario_main;
%     pause(1);
%     H=actxserver('SAPI.SpVoice');
%     invoke(H,'speak',A);
    
    
%     sprintf('Recognised speaker Id%d');
else
    warndlg('Wrong User','Unauthorised');
end
end