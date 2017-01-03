function out=errorCalculator(actualY, calculatedY)
differences = (actualY - calculatedY).^2 ;
s = size(actualY);
s = max(s(1),s(2));
err =sqrt(sum(differences)/s);
out = err;
end