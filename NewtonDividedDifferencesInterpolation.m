function out=NewtonDividedDifferencesInterpolation(X, Y)

n = length(X);
divDifTable = zeroes(n);

%fhaa ro bezarim too sotoone yes
for i=1:n
	divDifTable(i,1) = Y(i);
end

for i=2:n
	for j=2:(i-1)
		divDifTable(i,j) =( divDifTable(i,(j-1)) - divDifTable( (i-1) , (j-1) ) ) / ( X(i) - X(i-j+1) ) ;
	end
end

P = '' ;

for i=1:n
if( divDifTable(i,i) ~= 0 )
	P = strcat(P, divDifTable(i,i) );
else
	continue;
end
	for j=1:i
		P = strcat(P, ' * ( x - ', X(j) , ' )' );
	end
if( i ~= n )
	P = strcat(P, ' + ' );
end
end

out = P ;
end