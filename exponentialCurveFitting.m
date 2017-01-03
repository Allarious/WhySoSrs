function out=exponentialCurveFitting(X, Y)
Y_Revised = log(Y);
out = polynomialCurveFitting(X, Y_Revised, 1);
out(1) = exp(out(1));
end
