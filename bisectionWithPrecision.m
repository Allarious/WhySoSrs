function out=bisectionWithPrecision(f, interval, precision)
format long
S = vectorize(char(f));
func = str2func(['@(x) ' S]);
beginning = min(interval);
ending = max(interval);
currentResult = (beginning + ending ) / 2;
lastResult = currentResult + 100;
while ( abs(currentResult - lastResult) > precision)
    midpoint = (beginning + ending)/2;
    lastResult = midpoint;
    if(func(midpoint) == 0 )
        currentResult = midpoint;
        break;
    elseif(func(midpoint)*func(beginning) < 0 )
        ending = midpoint;
    else
        beginning = midpoint;
    end
    currentResult =( beginning + ending ) /2 ;
end

out = currentResult;
disp(out);
end
    