clear
fid=fopen('clean_qpoints.txt','r');
nq=fscanf(fid,'%d',1);
natom=fscanf(fid,'%d',1);
nband=3*natom;
for i=1:3
    for j=1:3
        vb(i,j)=fscanf(fid,'%g',1)*2*pi*1e10;
    end
end
DM=zeros(nq,nband,nband);
for iq=1:nq
    for i=1:3
        qposition(iq,i)=fscanf(fid,'%g',1);
    end
    for i=1:3
        qp(iq,i)=vb(1,i)*qposition(iq,1)+vb(2,i)*qposition(iq,2)+vb(3,i)*qposition(iq,3);
    end
    for i=1:nband
        for j=1:nband
            re=fscanf(fid,'%g',1); im=fscanf(fid,'%g',1);
            DM(iq,i,j)=re+1j*im;
        end
    end
    for i=1:(2*nband+nband/3+2)*nband
        fscanf(fid,'%g',1);
    end
end
DM=DM*(1.602176634e-19/1.66053886e-27)/1.0e-20; % convert to standard unit
