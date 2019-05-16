function RGM = RekGleitenderMittelwert( x )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
persistent vorherigerRGM n aSchieberegister
persistent bErsterDurchlauf

%%initializierung der Variablen bei ersten Durchlauf

if isempty(bErsterDurchlauf)
    n = 10;
    aSchieberegister = x * ones(n+1,1);
    k = 1;
    vorherigerRGM = x;
    bErsterDurchlauf = 1;
end

%alten Wert loeschen, neuen wert hinzufugen

for m=1:n
    aSchieberegister(m) = aSchieberegister(m+1);
end

aSchieberegister (n+1) = x;
RGM = vorherigerRGM + (x-aSchieberegister(1))/n;
vorherigerRGM= RGM;

end

