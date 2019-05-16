%%Initializierung
clear all; close all; clc; %Matlab vorbereiten

dt = 0.2;       %Abtastezeit in s
t = 0:dt:10     %Zeitachse als Array
nSamples = length(t);

%Speicherplatz reservieren
aMittelwert = zeros(nSamples, 1);
aXm = zeros(nSamples, 1);

%Hauptschleife ?ber alle Messwerte

for k=1:nSamples
    xm = LeseSpannung();    %Messung laden
    Mittelwert = RekursiverMittelwert(xm);  %Filter
    
    %Messwerte speichern
    aMittelwert(k) = Mittelwert;
    aXm(k) = xm;
end

figure
hold on
plot(t, aXm, 'r:.')
plot(t, aMittelwert, 'o-')