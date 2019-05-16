function h = LeseUltraschall()
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
persistent sonarAlt       % SonartAlt.mat
persistent k bErsterDurchlauf

if isempty(bErsterDurchlauf)
    load ('SonarAlt.mat')
    k = 1;
    
    bErsterDurchlauf = 1;
end

h = sonarAlt(k);
k = k+1;


end

