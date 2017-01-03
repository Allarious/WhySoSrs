function out= Newton_RaphsonWithNumberOfIteration(f, initialpoint, m)
format long
syms x
df = diff(f,x);
currentpoint = initialpoint;
for i=0:m
	nextpoint = currentpoint - ( vpa(subs(f,x,currentpoint)) / vpa(subs(df,x,currentpoint)) ) ;
	currentpoint = nextpoint; 
end

out = currentpoint;
disp(out);
end
