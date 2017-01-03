function out=fixedPointWithNumberOfIteration(f, initialX, interval, n)
g1 = strcat(f, '+ x');
g2 = strcat('x - ' , f);
g3 = strcat('sqrt(x ^ 2 + ' , f, ')');
g4 = strcat('x * exp(' , f, ')');
g5 = strcat('x * log(' , f, ')');
g6 = strcat('x * cos(' , f, ')');
g7 = strcat('x + sin(' , f, ')');
g8 = strcat('x / (' , f, ' + 1)');
g9 = strcat('x + atan(' , f, ')');
g10 = strcat('0.636619 * x * acot(' , f, ')');
g11 = strcat('2 * x / (1 + exp(-' , f, '))');
for i=1:11
    
    [flag X] = isValidForFixedPoint(eval(['g',num2str(i)]),initialX,n);
    if(flag == 1)
        disp( eval(['g',num2str(i)]) );
        X = transpose(X);
        disp(X)
    end
end
out = X(n);
end