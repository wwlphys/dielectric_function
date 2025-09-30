fid=fopen('clean_OUTCAR.txt','r');
eps0(1,1)=fscanf(fid,'%g',1); eps0(1,2)=fscanf(fid,'%g',1); eps0(1,3)=fscanf(fid,'%g',1);
eps0(2,1)=fscanf(fid,'%g',1); eps0(2,2)=fscanf(fid,'%g',1); eps0(2,3)=fscanf(fid,'%g',1);
eps0(3,1)=fscanf(fid,'%g',1); eps0(3,2)=fscanf(fid,'%g',1); eps0(3,3)=fscanf(fid,'%g',1);
for i=1:natom
    fscanf(fid,'%g',1);
    for j=1:3
        fscanf(fid,'%g',1);
        for k=1:3
            Z(i,j,k)=fscanf(fid,'%g',1)/sqrt(Mass(i));
            Zm(j,(i-1)*3+k)=Z(i,j,k);%Z²»Ó¦×ªÖÃ
        end
    end
end