function out=LagrangeInterpolation(X, Y)
L = repmat(' ',[1000,1000]);

n = length(X);
for i=1:n
	result = '';
	denominator = 1;
	for j=1:n
		if( j == 1)
			result = strcat(result,'( x - ',X(j),' )' );
		elseif(j ~= i )
			result = strcat(result,' * ( x - ', X(j),' )');
		end
		denominator = denominator * ( X(i) - X(j) );
	end
L(i) = strcat(result, ' / ', denominator);
end
P = '';
for i=1:n
	if( i == 1 )
		P = strcat(Y(i), ' * ',L(i));
	else
		P = strcat(P, ' + ',Y(i), ' * ',L(i)); 
	end
end
out = P;
end