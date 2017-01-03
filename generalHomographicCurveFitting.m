function out = generalHomographicCurveFitting(X, Y, m)
Y_revised = 1 ./ Y;
out =  polynomialCurveFitting(X, Y_revised, m);
end
