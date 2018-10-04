function ADD=add1(ID,NAME)
NB=8;
FS=22050;
if (exist('voice_database2.dat','file')==2)
    load('voice_database2.dat','-mat');
    sound_number = sound_number+1;
else
    sound_number =1;
    data{sound_number,1} = [];
    data{sound_number,2} = [];
    %data{sound_number,3} = [];
    save('voice_database2.dat','data','sound_number','FS','NB');
end

ID=input('Enter a id');
% NAME=input('Enter name');
% duration=input('Enter the duration of recording(in seconds): ');
duration=3;
% if isempty(duration)
%     error('Invalid Duration');
% end
recording=audiorecorder(FS,NB,1);
% msgbox('Speak');
display('Speak');
record(recording,duration);
while(isrecording(recording)==1)
    close 
%     msgbox('Recording...')
    disp('recording...');
    pause(0.5);
end
    display('Recording stopped');
% close    
% msgbox('Recording stopped');
    

D1=getaudiodata(recording);
st=strcat('u',num2str(sound_number));
wavwrite(D1,FS,NB,st);
D1 =getaudiodata(recording, 'uint8');
if size(D1,2)==2
   D1=D1(:,1);
end
D1 = double(D1);
data{sound_number,1} = D1;
data{sound_number,2} = ID;
%data{sound_number,3} = NAME;

save('voice_database2.dat','data','sound_number','-append');
display('Voice added to database');
end