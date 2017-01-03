function out=calculateDi(Fhaa,n,initialParameters,l)
Di = zeros(n);
for i=1:n
    eval(['syms a',num2str(i)]);
end
for i=1:n
   Z(i) = eval(['a',num2str(i)]);
end
f='';
for j=1:n
    f='';
    %fj ro doros mikonim
    for i=1:size(Fhaa,2)
        f = strcat(f,Fhaa(j,i));
    end
    %hala az fj nesbat b au moshtagh migiram!
    for u=1:n
        if( u~= k )
            df = diff(f,eval(['a',num2str(u)])) ;
        else
            df = f;
        end
        disp(df);
        for k=1:
            df = vpa(subs( df,eval(['a',num2str(k)]),initialParameters(k) ));
        end
        Di(j,u) = df;
    end
    
end

for i=1:n
    for j=1:n
        disp(Di(i,j));
    end
end
%out = det(matrisEJacobian);
end