function [isValid, X] =isValidForFixedPoint(f,initialX,n)
syms x
X = zeros(n, 1);
df = diff(f,x);
currentX = initialX;
flag = 1;
isValid = 0;
for i=1:n
    X(i) = currentX;
    currentDf = vpa(subs(df,x,currentX));
    if(abs(currentDf)<1)
        currentF = vpa(subs(f,x,currentX));
        currentX = currentF;
    else
        flag = 0;
        isValid = 0;
    end
end
if(flag == 1)
    isValid = 1;
end

end