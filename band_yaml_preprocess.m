fid=fopen('band.yaml','r');
s=fscanf(fid,'%c');
fclose(fid);
n=length(s);
for i=1:n-1
    if s(i)=='-' && (s(i+1)=='p' || s(i+1)==' ')
        s(i)=' ';
    end
end
asciis=abs(s);
for i=1:n-1
    if ~(asciis(i)=='.' || asciis(i)=='-' || ( asciis(i)>='0' && asciis(i)<='9'))
        s(i)=' ';
    end
end
s2(n)=' ';
for i=1:n
    s2(i)=' ';
end
j=1;
for i=1:n
    if ~(s(i)==' ' && s(i+1)==' ')
        s2(j)=s(i);
        j=j+1;
    end
end
fid=fopen('clean_band_yaml.txt','w');
fprintf(fid,'%c',s2);
fclose(fid);