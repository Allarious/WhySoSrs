function out=NewtonBackwardForwardCentralInterpoltion(X, Y,xInitial)
h = X(2) - X(1);
n = length(X);
divDifTable = zeros(n);

for i=1:n
	divDifTable(i,1) = Y(i);
end

for i=2:n
	for j=2:(i-1)
		divDifTable(i,j) = divDifTable(i,(j-1)) - divDifTable( (i-1) , (j-1) )   ;
	end
end

end