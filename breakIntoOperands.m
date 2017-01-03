function [firstOperand, secondOperand, operator] = breakIntoOperands(str)
s = length(str);
flag = false;
n = 0;
p = 0;
numberOfOperands = 0;
o = 0;
for i = 1:s
    if(str(i) == '+')
        numberOfOperands = numberOfOperands + 1;
        o = i;
    end
    if(str(i) == '*')
        numberOfOperands = numberOfOperands + 1;
        o = i;
    end
    if(str(i) == '/')
        numberOfOperands = numberOfOperands + 1;
        o = i;
    end
    if(str(i) == '-')
        numberOfOperands = numberOfOperands + 1;
        o = i;
    end
    if(str(i) == '^')
        numberOfOperands = numberOfOperands + 1;
        o = i;
    end
end
if(numberOfOperands == 1)
    operator = str(o);
    for i = 1:s
        if(i ~= ' ')
            z = i;
            break;
        end
    end
    for i = z:s
        if(str(i) == str(o) || str(i) == ' ')
            r = i - 1;
            break;
        end
    end
    firstOperand = str(z:r);
    for i = o + 1:s
        if(str(i) ~= ' ')
            z = i;
            break;
        end
    end
    for i = z:s
        if(str(i) == str(o) || str(i) == ' ')
            r = i - 1;
            break;
        end
        r = i;
    end
    secondOperand = str(z:r);
return
end
flag = false;
for i = 1:s
    if(n == 0 && flag == true)
        p = i - 1;
        break
    end
    if(str(i) == '(')
        if(flag == false)
            g = i;
        end
        flag = true;
        
        n = n + 1;
    end
    if(str(i) == ')')
        n = n - 1;
    end
end

for i = p:s
    if(str(i) == '+')
        operator = '+';
        break;
    end
    if(str(i) == '*')
        operator = '*';
        break;
    end
    if(str(i) == '/')
        operator = '/';
        break;
    end
    if(str(i) == '-')
        operator = '-';
        break;
    end
    if(str(i) == '^')
        operator = '^';
        break;
    end
end
q = 0;
w = 0;
flag = false;
for i = p:s
    if(str(i) == ')')
        w = i;
    end
    if(flag == false && str(i) == '(')
        q = i;
        flag = true;
    end
end
firstOperand = str(g + 1:p - 1);
secondOperand = str(q + 1:w - 1);
end
