fid=fopen('clean_phonopy_yaml.txt','r');
for i=1:3
    dim(i)=fscanf(fid,'%d',1);
end
for i=1:3
    for j=1:3
        lattV(i,j)=fscanf(fid,'%g',1)*1.0e-10; % standard unit
    end
end
Vol=(-lattV(1,3)*lattV(2,2)+lattV(1,2)*lattV(2,3))*lattV(3,1)+(lattV(1,3)*lattV(2,1)-lattV(1,1)*lattV(2,3))*lattV(3,2)+(-lattV(1,2)*lattV(2,1)+lattV(1,1)*lattV(2,2))*lattV(3,3);
for i=1:natom
    fscanf(fid,'%g',1);
    for j=1:3
        atomcoord(i,j)=fscanf(fid,'%g',1);
    end
    atomxyz(i,:)=transpose(lattV)*transpose(atomcoord(i,:));
    Mass(i)=fscanf(fid,'%g',1)*1.66053886e-27; % standard unit
end
for i=1:19+6*natom
    fscanf(fid,'%g',1);
end
for i=1:3
    for j=1:3
        suplattV(i,j)=fscanf(fid,'%g',1)*1.0e-10; % standard unit
    end
end
for i=1:natom*dim(1)*dim(2)*dim(3)
    fscanf(fid,'%g',1);
    for j=1:3
        supcoord(i,j)=fscanf(fid,'%g',1);
    end
    supMass(i)=fscanf(fid,'%g',1)*1.66053886e-27; % standard unit
    fscanf(fid,'%g',1);
end
fclose(fid);