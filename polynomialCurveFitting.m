function [weight, predicted_values, Phi] = polynomialCurveFitting(X, Y, m)

n = size(X);
n = max(n(1), n(2));
Phi = zeros(n, m + 1);
p = 0:m;
for i = 1:n
    Phi(i, 1:m+1) = X(i) .^ p;
end
q = eye(size(transpose(Phi) * Phi)) * 0.001;
if(det(transpose(Phi) * Phi) < 0.001 || true)
weight = (transpose(Phi) * Phi + q) \ transpose(Phi) * Y;
else
weight = (transpose(Phi) * Phi) \ transpose(Phi) * Y;    
end


predicted_values = Phi * weight;

end

