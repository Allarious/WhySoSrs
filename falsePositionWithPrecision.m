function out= falsePositionWithPrecision(f, interval, precision)
format long
S = vectorize(char(f));
func = str2func(['@(x) ' S]);
beginning = min(interval);
ending = max(interval);
currentResult = (beginning + ending ) / 2;
lastResult = currentResult + 100;
while ( abs(currentResult - lastResult) > precision)
    nextpoint = ending - (func(ending)*( ending - beginning)/(func(ending) - func(beginning)));
    lastResult = nextpoint;
    if(func(nextpoint) == 0 )
        currentResult = nextpoint;
        break;
    elseif(func(nextpoint)*func(beginning) < 0 )
        ending = nextpoint;
    else
        beginning = nextpoint;
    end
    currentResult = ending - (func(ending)*( ending - beginning)/(func(ending) - func(beginning)));
end

out = currentResult;
disp(out);
end