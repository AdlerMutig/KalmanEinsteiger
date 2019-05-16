function Mittelwert = RekursiverMittelwert(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

persistent fVorherigerMittelwert k
persistent bErsterDurchlauf

%%Initializierung der Variablen dei ersten Durchlauf

if isempty(bErsterDurchlauf)
    k = 1;
    fVorherigerMittelwert = 0;
    bErsterDurchlauf = 1;
end

alpha = (k-1)/k;
Mittelwert = alpha*fVorherigerMittelwert + (1-alpha)*x;

fVorherigerMittelwert = Mittelwert;
k = k+1;

end

