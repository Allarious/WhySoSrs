function out=generalisedNewtonRaphson(Fhaa,initialParameters, n,numberOfIterations)


x = transpose(initialParameters);
for i = 1:numberOfIterations
    J = calculateJacobian(Fhaa, x, n);
    F = returnValueOfFunctionsInPoint(Fhaa, x, n);
    %disp(J);
    %disp(F);
    %disp(x);
    x = x - inv(J) * F;

end
out = x;
disp(x)
end