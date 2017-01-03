function out= secantWithPrecision(f, interval, precision)
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
    end
     if(ending > nextpoint)
         beginning = nextpoint;
     else
        beginning = ending;
        ending = nextpoint;
     end
      currentResult = ending - (func(ending)*( ending - beginning)/(func(ending) - func(beginning)));
end

out = lastResult;
disp(out);
end