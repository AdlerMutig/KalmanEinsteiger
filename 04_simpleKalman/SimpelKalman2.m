function [Spannung Px K] = SimpelKalman( z )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
persistent A H Q R  
persistent x P
persistent bErsterDurchlauf

%Initializierung der Variablen bei ersten Durlauf

if isempty(bErsterDurchlauf)
    A = 1;  %Systemmatrix der linearen Zustansraumstellung
    H = 1;  %Ausgangmatrix der linearen Zustandraumstellung
    
    Q = 0;  % Kovarianzmatrix des Systemsrauschens
    R = 4;  % Kovarianzmatrix des Messrauschens
    
    x = 14; % in V, initiale Sch?tzung
    P = 6;  % Kovarianzmatriz des Schaetzfahlers
    
    bErsterDurchlauf = 1;
end

%Praediktionsprozess
%                   1. Vorhersage des Zustandvektors und der Kovarianz

xp = A*x;           %Praediktion der Sch?tzung
Pp = A*P*A' + Q;    %Praediktion der Fehlerkovarianz

%%Schaetzprozess
K = Pp*H'*inv(H*Pp*H'+R);   %2. Berechnung der Kalman Verst?rkung K

x = xp+ K*(z - H*xp);       %3. Korrectur der Zustandschatzung

P = Pp - K*H*Pp;            %4. Korrektur der Kovarianzschatzung

Spannung =  x;  
Px = P;

end

