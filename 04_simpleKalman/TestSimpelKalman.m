clear all; close all; clc   %Matlab vorbereiten

dt = 0.2;               %Abtastezeit in s
t = 0:dt:10;            %Zeitachse als Array
nSamples = length(t);   %Anzahl der Messwerte

Xsaved = zeros(nSamples,1);     %Speicherplatz reservieren
Zsaved = zeros(nSamples,1);

for k=1:nSamples
    z = LeseSpannung();         %Messwerte speichern
    Spannung = SimpelKalman(z); %Kalman Filter
    z
    Xsaved(k) = Spannung;   %Werte speichern
    Zsaved(k) = z;          
    
end

figure
hold on
plot(t, Xsaved, 'o-')
plot(t, Zsaved, 'r-')
legend('Messwert', 'Kalman filter schaetzung')
    
    