linux=1;
for i=1:nband
    for j=1:nband
        D(i,j)=DM(1,i,j);   % iq = 1
    end
end
[dd,w2]=eig(D);
disp('Frequency of phonons without NAC:')
wp=diag(real(sqrt(w2))/(2*pi))
disp('Frequency of phonons with NAC:')
wp=transpose(abs(freq_nac))*1e12
dd=transpose(ph_dspl);
%wp(42)=wp(42)+30*0.03*1e12
load lifetime.dat  % phono3py输出的gammas-***.dat文件
x=lifetime(:,1)*1e12;
y=lifetime(:,2)*1e12;
lifet=interp1(x,y,wp);
fid=fopen('dielectric.txt','w');
M1=(Zm*dd);
M2=(ctranspose(dd)*transpose(Zm));%每行除f(wp(k))
for wL=0.1e12:0.01e12:5e13    % laser frequency
    for k=1:nband
        fwp=1/(wp(k)^2-wL^2-1j*lifet(k)*wL); %还需要读入声子的寿命lifet(k)
        tM2(k,:)=M2(k,:)*fwp;
    end
    dielec=1.602e-19^2/Vol*M1*tM2/(2*pi)^2/8.85e-12+eps0;
    % output laser frequency(Hz),laser wave length (nm), wave number (cm-1), dielec 
    fprintf(fid,'%g  %g  %g  %g  %g  %g  %g  %g  %g  %g  %g  %g  %g  %g  %g\n',wL,3e8/wL*1e9,wL/3e8/100,real(dielec(1,1:3)),real(dielec(2,2:3)),real(dielec(3,3)),imag(dielec(1,1:3)),imag(dielec(2,2:3)),imag(dielec(3,3)));
end
fclose(fid);