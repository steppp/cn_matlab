function [p]=lagrange(x,y,alfa)

%x,y coordinate punti interpolazione
%alfa: punto (scalare) in cui si valuta il polinomio di Lagrange
 
p=0;
N=length(x);
    for j=1:N
        q=1;
        for i=1:N
            if i~=j
                q=q*(alfa-x(i))/(x(j)-x(i));
            end
        end
     p=p+q*y(j);
    end
   