function out = naturalLogarithmCurveFitting(X, Y)
X_revised = log(X);
out = polynomialCurveFitting(X_revised, Y, 1);
end