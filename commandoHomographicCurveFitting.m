function out = commandoHomographicCurveFitting(X, Y, m)
X_revised = 1 ./ X;
out = polynomialCurveFitting(X_revised, Y, m);
end