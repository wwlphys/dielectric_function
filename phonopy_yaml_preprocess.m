fid=fopen('phonopy.yaml','r');
s=fscanf(fid,'%c');
fclose(fid);
n=length(s);
i=1;
while ~(s(i)=='d' && s(i+1)=='i' && s(i+2)=='m')
    s(i)=' ';
    i=i+1;
end
i=i+15;
while ~(s(i)=='l' && s(i+1)=='a' && s(i+2)=='t')
    s(i)=' ';
    i=i+1;
end
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
m=n;i=1;
while i<m
    if s(i)==' ' && s(i+1)==' '
        s(i)=[];
        m=m-1;
        i=i-1;
    end
    i=i+1;
end
fid=fopen('clean_phonopy_yaml.txt','w');
fprintf(fid,'%c',s);
fclose(fid);