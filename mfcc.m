function R=mfcc(y,fs)
% [name,path]=uigetfile('*.wav');
% file=[path,name];
% [y,fs]=audioread(file);
N=256;
M=100;
stepsize=N-M;
nframes=(length(y)/stepsize)-1;
s1=1;
s2=N;
frame=[];
for i=1:nframes
    fr=y(s1:s2);
    frame=[frame,fr];
    s1=s1+stepsize;
    s2=s2+stepsize;
end
    h=hamming(256);
    H=diag(h)*frame;
    for i=1:nframes
        F(:,i)=fft(H(:,i));
    end
m=melfb(20,N,fs);
% figure(3),plot(linspace(0,fs/2, 129),m)
n2=1+floor(N/2);
z=m*abs(F(1:n2,:)).^2;
R=dct(log(z));
t=N/2;
tm=length(y)/fs;
% figure(1),imagesc(abs(F(1:t,:)).^2)
% axis xy
% title('Linear Power Spectrum');
% logarithmic
% figure(2),imagesc(20*log10(abs(F(1:t,:)).^2))
% title('Logarithmic Power Spectrum');
% axis xy
% figure(4),imagesc (z)
% title('Modified Power Spectrum');
% axis xy
end
%% 2 D plot of acoustic vectors
% plot(R(5,:),R(6,:),'or')
% hold on
% dtr={8};
% dtr=vqlbg(R,16);
% plot(dtr(5,:),dtr(6,:),'ok')