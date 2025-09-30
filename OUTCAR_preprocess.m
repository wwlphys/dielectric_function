fid=fopen('OUTCAR.txt','r');
s=fscanf(fid,'%c');
fclose(fid);
n=length(s);
asciis=abs(s);
for i=1:n-1
    if ~(asciis(i)=='.' || asciis(i)=='-' || ( asciis(i)>='0' && asciis(i)<='9'))
        s(i)=' ';
    end
end
m=n;i=1;
while i<m
    if (s(i)==' ' && s(i+1)==' ') || (s(i)=='-' && (s(i+1)=='-'|| s(i+1)==' '))
        s(i)=[];
        m=m-1;
        i=i-1;
    end
    i=i+1;
end
fid=fopen('clean_OUTCAR.txt','w');
fprintf(fid,'%c',s);
fclose(fid);