fid=fopen('clean_band_yaml.txt','r');
fscanf(fid,'%g',1);
npath=fscanf(fid,'%g',1);
for i=1:npath
    fscanf(fid,'%g',1);
end
for i=1:19
    fscanf(fid,'%g',1);
end
for i=1:natom
    for j=1:5
        fscanf(fid,'%g',1);
    end
end
for i=1:4      %有时候这个数为4；有时候为13.
    fscanf(fid,'%g',1);
end
for i=1:nband
    fscanf(fid,'%g',1);freq_nac(i)=fscanf(fid,'%g',1);
    for j=1:natom
        fscanf(fid,'%g',1);
        for k=1:3
            re=fscanf(fid,'%g',1);im=fscanf(fid,'%g',1);
            ph_dspl(i,j*3+k-3)=re+1j*im;
        end
    end
end
fclose(fid);