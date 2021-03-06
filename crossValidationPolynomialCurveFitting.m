function out = crossValidationPolynomialCurveFitting(X, Y, maxM, validationSetProportion)


n = size(X);
n = max(n(1), n(2));
k = round(n * validationSetProportion);
flag = 0;
count =1;

validation_indices = randi([1 n],k,1);
train_indices = zeros(n - k, 1);

train_X = zeros(n - k,1);
train_Y = zeros(n - k, 1);
validation_X = X(validation_indices);
validation_Y = Y(validation_indices);
for i=1:n
    flag =0;
    for j=1:k
        if( i == validation_indices(j) )
            flag =  1;
            break;
        end
    end
    if( flag == 0 )
        train_X(count) = X(i);
        train_Y(count) = Y(i);
        count = count + 1;
    end
end

%train_X = transpose(train_X);
%train_Y = transpose(train_Y);
%validation_X = transpose(validation_X);
%validation_Y = transpose(validation_Y);
validation_err = zeros(maxM + 1, 1);
train_err = zeros(maxM + 1, 1);
figure
hold on
plot(train_X, train_Y, 'go')
plot(validation_X, validation_Y, 'ro')
for i = 0:maxM
    [w, train_predicted_Y, xi] = polynomialCurveFitting(train_X, train_Y, i);
    [a, b, Phi] = polynomialCurveFitting(validation_X, validation_Y, i);
    predicted_validation_Y = Phi * w;
    x = validation_X;
    [x_sorted, ind] = sort(x);
    y_sorted = predicted_validation_Y(ind);
    y = predicted_validation_Y;
    %plot(x_sorted, y_sorted);
    x = min(X):0.01:max(X);
    n = size(x);
    n = max(n(1), n(2));
    PhiPhi = zeros(n, i + 1);
    p = 0:i;
    for j = 1:n
        PhiPhi(j, 1:i+1) = x(j) .^ p;
    end
    y = PhiPhi * w;
    hold on
    validation_err(i + 1) = errorCalculator(validation_Y, predicted_validation_Y);
    plot(x,y);
    train_err(i + 1) = errorCalculator(train_Y, train_predicted_Y);
    %disp(train_predicted_Y)
end
hold off
figure
%disp(validation_err)
%disp(train_err)
x = 1:maxM + 1;
hold on
plot(x, train_err)
hold on
plot(x, validation_err)
hold off
end




