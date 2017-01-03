function out= secantWithNumberOfIteration(f, interval, numberOfIteration)
format long
S = vectorize(char(f));
func = str2func(['@(x) ' S]);
beginning = min(interval);
ending = max(interval);
currentResult = (beginning + ending ) / 2;
for i=1:numberOfIteration
    nextpoint = ending - (func(ending)*( ending - beginning)/(func(ending) - func(beginning)));
    if(func(nextpoint) == 0 )
        currentResult = nextpoint;
        break;
    end
    if(ending > nextpoint)
        beginning = nextpoint;
    else
        beginning = ending;
        ending = nextpoint;
    end
%     currentResult = ending - (func(ending)*( ending - beginning)/(func(ending) - func(beginning)));
end
currentResult = ending - (func(ending)*( ending - beginning)/(func(ending) - func(beginning)));
out = currentResult;
disp(out);
end