function out= falsePositionWithNumberOfIteration(f, interval, numberOfIteration)
format long
S = vectorize(char(f));
func = str2func(['@(x) ' S]);
beginning = min(interval);
ending = max(interval);
currentResult = (beginning + ending ) / 2;
for i=0:numberOfIteration;
    nextpoint = ending - (func(ending)*( ending - beginning)/(func(ending) - func(beginning)));
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