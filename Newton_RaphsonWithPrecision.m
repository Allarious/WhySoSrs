function out= Newton_RaphsonWithPrecision(f, initialpoint, precision)
format long
syms x
df = diff(f,x);
currentpoint = initialpoint;
nextpoint = initialpoint + 100;
while( abs(nextpoint - currentpoint) > precision )
    currentpoint = nextpoint; 
	nextpoint = currentpoint - ( vpa(subs(f,x,currentpoint)) / vpa(subs(df,x,currentpoint)) ) ;
end
out = nextpoint;
disp(out);
end
