function [err]= absoluteErrorCalculator(equation)

[firstOperand, secondOperand, operator] = breakIntoOperands(equation);
[a digitalStatus] = str2num(firstOperand);
if( digitalStatus == 1 )
    err = '0';
    errFirstOperand = '0';
else
    switch firstOperand
        case 'a'
            err = 'EA';
            errFirstOperand = 'EA';
        case 'b'
            err = 'EB';
            errFirstOperand = 'EB';
        case 'c'
            err = 'EC';
            errFirstOperand = 'EC';
        case 'd'
            err = 'ED';
            errFirstOperand = 'ED';
        case 'e'
            err = 'EE';
            errFirstOperand = 'EE';
        case 'f'
            err = 'EF';
            errFirstOperand = 'EF';
        otherwise
            [errFirstOperand] = absoluteErrorCalculator(firstOperand);
    
    end
end
[a digitalStatus] = str2num(secondOperand);
if( digitalStatus == 1 )
    err = '0';
    errSecondOperand = '0';
else
    switch secondOperand
        case 'a'
            err = 'EA';
            errSecondOperand = 'EA';
        case 'b'
            err = 'EB';
            errSecondOperand = 'EB';
        case 'c'
            err = 'EC';
            errSecondOperand = 'EC';
        case 'd'
            err = 'ED';
            errSecondOperand = 'ED';
        case 'e'
            err = 'EE';
            errSecondOperand = 'EE';
        case 'f'
            err = 'EF';
            errSecondOperand = 'EF';
        otherwise
            [errSecondOperand] = absoluteErrorCalculator(secondOperand);
    
    end
end

%disp(errSecondOperand)
%disp(errFirstOperand)
disp([firstOperand ' = ' errFirstOperand])
disp([secondOperand ' = ' errSecondOperand])
if(operator == '+')
    err = strcat('(', errFirstOperand,' + ',errSecondOperand, ')') ;
elseif(operator == '-')
    err = strcat('(', errFirstOperand,' + ',errSecondOperand, ')') ;
elseif(operator == '/')
    err = strcat('( abs(', firstOperand, ') * ', errSecondOperand, ' + abs(', secondOperand, ') * ',  errFirstOperand, ') / (', secondOperand, ' ^ 2 )');
elseif(operator == '^')
    err = strcat('(', firstOperand, ' ^ ', secondOperand, ') * (', errSecondOperand, ' * ln(', firstOperand, ') + (', errFirstOperand, ' * ', secondOperand, ' / ', firstOperand, '))' );
elseif(operator == '*')
    err = strcat('( abs(',firstOperand, ') * ' , errSecondOperand, ' + abs(',secondOperand, ') * ', errFirstOperand, ')');
end
err = vpa(err);
err = char(err);
err = strcat('(', err, ')');
end