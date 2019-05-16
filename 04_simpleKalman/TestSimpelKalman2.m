clear all; close all; clc   %Matlab vorbereiten

dt = 0.2;               %Abtastezeit in s
t = 0:dt:10;            %Zeitachse als Array
nSamples = length(t);   %Anzahl der Messwerte

Xsaved = zeros(nSamples,3);     %Speicherplatz reservieren
Zsaved = zeros(nSamples,1);

for k=1:nSamples
    z = LeseSpannung();         %Messwerte speichern
    [Spannung P K] = SimpelKalman2(z); %Kalman Filter
    
    Xsaved(k,:) = [Spannung P K];   %Werte speichern
    Zsaved(k) = z;          
    
end

figure
hold on
plot(t, Zsaved, 'r-')
plot(t, Xsaved(:,1), 'o-')
legend('Messwert', 'Kalman filter schaetzung')

figure 
plot(t, Xsaved(:,2),'o-')
legend('Covariance')

figure
plot(t, Xsaved(:,3),'o-')
legend('Kalman gain')
    