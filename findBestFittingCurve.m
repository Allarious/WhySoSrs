function out=findBestFittingCurve(X, Y)
display(X);
display(Y);
zarayebEExponential = exponentialCurveFitting(X, Y);
zarayebENaturalLog = naturalLogarithmCurveFitting(X,Y);
zarayebECommandoHomo = commandoHomographicCurveFitting(X, Y,1);
zarayebEGeneralHomo = generalHomographicCurveFitting(X,Y,1);
zarayebEPolyDarajeYek = polynomialCurveFitting(X, Y, 1);
zarayebEPolyDarajeDo = polynomialCurveFitting(X, Y, 2);
zarayebEPolyDarajeSe = polynomialCurveFitting(X, Y, 3);

yExponential = zarayebEExponential(1)*exp(zarayebEExponential(2)*X) ;
yNaturalLog = zarayebENaturalLog(2)*log(X) + zarayebENaturalLog(1);
yCommandoHomo = zarayebECommandoHomo(2)./X + zarayebECommandoHomo(1);
yGeneralHomo = 1./(zarayebEGeneralHomo(2)*X + zarayebEGeneralHomo(1));
yPolyYek = zarayebEPolyDarajeYek(2)*X + zarayebEPolyDarajeYek(2);
yPolyDo = zarayebEPolyDarajeDo(3)*(X.^2)  + zarayebEPolyDarajeDo(2)*X + zarayebEPolyDarajeDo(1);
yPolySe = zarayebEPolyDarajeSe(4)*(X.^3) + zarayebEPolyDarajeSe(3)*(X.^2) + zarayebEPolyDarajeSe(2)*X + zarayebEPolyDarajeSe(1);

errors = [ errorCalculator(Y, yExponential) errorCalculator(Y, yNaturalLog) errorCalculator(Y, yCommandoHomo) errorCalculator(Y, yGeneralHomo) errorCalculator(Y, yPolyYek) errorCalculator(Y, yPolyDo) errorCalculator(Y, yPolySe)];
[minErr index] = min(errors);
switch index
    case 1
        out(3) = zarayebEExponential(1);
        out(4) = zarayebEExponential(2);
    case 2
        out(3) = zarayebENaturalLog(1);
        out(4) = zarayebENaturalLog(2);
    case 3
        out(3) = zarayebECommandoHomo(1);
        out(4) = zarayebECommandoHomo(2);
    case 4
        out(3) = zarayebEGeneralHomo(1);
        out(4) = zarayebEGeneralHomo(2);
    case 5
        out(3) = zarayebEPolyDarajeYek(1);
        out(4) = zarayebEPolyDarajeYek(2);
    case 6
        out(3) = zarayebEPolyDarajeDo(1);
        out(4) = zarayebEPolyDarajeDo(2);
        out(5) = zarayebEPolyDarajeDo(3);
    case 7
        out(3) = zarayebEPolyDarajeSe(1);
        out(4) = zarayebEPolyDarajeSe(2);
        out(5) = zarayebEPolyDarajeSe(3);
        out(6) = zarayebEPolyDarajeSe(4);
end
out(1) = index
out(2) = minErr
end