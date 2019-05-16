clear all; close all; clc;

nSamples = 500;     %Anzahl der Messwerte max 1501

%Speicherplatz reservieren
aXsaved = zeros(nSamples, 1);
aXmsaved = zeros(nSamples, 1);

%Schleife ueber alle Messwerte
for k=1:nSamples
    xm = LeseUltraschall();
 
    x = RekGleitenderMittelwert(xm);    %rekursives Filter
    
    %wert speichern
    
    aXsaved (k) = x;
    aXmsaved(k) = xm;
end

dt = 0.02;                  %Abtastzeit in s
t = 0:dt:nSamples*dt-dt;    %Zeitachse als Array
dt
figure 
hold on
plot(t, aXmsaved,'r.')
plot(t, aXsaved, 'b-')