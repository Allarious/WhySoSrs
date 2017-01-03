function out=calculateJacobian(Fhaa,initialParameters,n)
matrisEJacobian = zeros(n);
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
        df = diff(f,eval(['a',num2str(u)])) ;
        disp(df);
        for k=1:n
            df = vpa(subs( df,eval(['a',num2str(k)]),initialParameters(k) ));
        end
        matrisEJacobian(j,u) = df;
    end
    
end
out = det(matrisEJacobian);
end