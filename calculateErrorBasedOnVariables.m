function out=calculateErrorBasedOnVariables(err, x, ex)
n = length(x);
syms a b c d e f EA EB EC ED EE EF deltaA deltaB deltaC deltaD deltaE deltaF
if (x(1) ~= 1587456 )
    disp(x(1));
    disp(err);
    err = vpa(subs(err,a,x(1)));
end
if (x(2) ~= 1587456)
err = vpa(subs(err,b,x(2)));
end
if (x(3) ~= 1587456 )
err = vpa(subs(err,c,x(3)));
end
if (x(4) ~= 1587456 )
err = vpa(subs(err,d,x(4)));
end
if (x(5) ~= 1587456)
err = vpa(subs(err,e,x(5)));
end
if (x(6) ~= 1587456)
err = vpa(subs(err,f,x(6)));
end
if (ex(1) ~= 1587456 )
    err = vpa(subs(err,EA,ex(1)));
    err = vpa(subs(err, deltaA,ex(1)));
end
if (ex(2) ~= 1587456)
    err = vpa(subs(err,EB,ex(2)));
    err = vpa(subs(err, deltaB,ex(1)));
end
if (ex(3) ~= 1587456)
    err = vpa(subs(err,EC,ex(3)));
    err = vpa(subs(err, deltaC,ex(1)));
end
if (ex(4) ~= 1587456)
    err = vpa(subs(err, deltaD,ex(1)));
    err = vpa(subs(err,ED,ex(4)));
end
if (ex(5) ~= 1587456)
    err = vpa(subs(err,EE,ex(5)));
    err = vpa(subs(err, deltaE,ex(1)));
end
if (ex(6) ~= 1587456)
    err = vpa(subs(err,EF,ex(6)));
    err = vpa(subs(err, deltaF,ex(1)));
end
out = char(err);
end