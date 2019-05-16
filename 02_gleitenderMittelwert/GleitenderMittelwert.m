function GM = GleitenderMittelwert( x )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

persistent n aSchieberegister
persistent bErsterDurchlauf

if isempty (bErsterDurchlauf)
    n = 10;
    aSchieberegister = x * ones(n,1);
    bErsterDurchlauf = 1;
end

for m=1:n-1
    aSchieberegister(m) = aSchieberegister(m+1)
end
aSchieberegister(n)=x;
GM = sum(aSchieberegister)/n;
    
end

