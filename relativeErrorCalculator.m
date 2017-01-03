function [err]= relativeErrorCalculator(equation)

[firstOperand, secondOperand, operator] = breakIntoOperands(equation);
[a digitalStatus] = str2num(firstOperand);
if( digitalStatus == 1 )
    err = '0';
    errFirstOperand = '0';
else
    switch firstOperand
        case 'a'
            err = 'deltaA';
            errFirstOperand = 'deltaA';
        case 'b'
            err = 'deltaB';
            errFirstOperand = 'deltaB';
        case 'c'
            err = 'deltaC';
            errFirstOperand = 'deltaC';
        case 'd'
            err = 'deltaD';
            errFirstOperand = 'deltaD';
        case 'e'
            err = 'deltaE';
            errFirstOperand = 'deltaE';
        case 'f'
            err = 'deltaF';
            errFirstOperand = 'deltaF';
        otherwise
            [errFirstOperand] = relativeErrorCalculator(firstOperand);
    end
end
[a digitalStatus] = str2num(secondOperand);
if (digitalStatus == 1)
    err = '0';
    errSecondOperand = '0';
else
    switch secondOperand
        case 'a'
            err = 'deltaA';
            errSecondOperand = 'deltaA';
        case 'b'
            err = 'deltaB';
            errSecondOperand = 'deltaB';
        case 'c'
            err = 'deltaC';
            errSecondOperand = 'deltaC';
        case 'd'
            err = 'deltaD';
            errSecondOperand = 'deltaD';
        case 'e'
            err = 'deltaE';
            errSecondOperand = 'deltaE';
        case 'f'
            err = 'deltaF';
            errSecondOperand = 'deltaF';
        otherwise
            [errSecondOperand] = relativeErrorCalculator(secondOperand);
    end
end
%disp(errSecondOperand)
%disp(errFirstOperand)
disp([firstOperand ' = ' errFirstOperand])
disp([secondOperand ' = ' errSecondOperand])
if(operator == '+')
    
    err = strcat('(', errFirstOperand,' * abs( ',firstOperand,' ) / ( abs( ',firstOperand,' + ',secondOperand,' )) + ', errSecondOperand,' * abs( ',secondOperand,' ) / abs( ',firstOperand,' + ',secondOperand, '))') ;
    
elseif(operator == '-')
    
    err = strcat('(', errFirstOperand,' * abs( ',firstOperand,' ) / ( abs( ',firstOperand,' - ',secondOperand,' )) + ', errSecondOperand,' * abs( ',secondOperand,' ) / abs( ',firstOperand,' - ',secondOperand, '))') ;
    
elseif(operator == '/')
    
    err = strcat('(', errFirstOperand, ' + ', errSecondOperand, ' )');
    
elseif(operator == '^')
    
    err = strcat('(', errSecondOperand, ' * ln(', firstOperand, ') + (', errFirstOperand, ' * ', secondOperand, ' / ', firstOperand, '))' );
    
elseif(operator == '*')
    
    err = strcat('(', errFirstOperand, ' + ', errSecondOperand, ' )');
    
end
err = vpa(err);
err = char(err);
end