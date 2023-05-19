%% The rest that is changeable, but we do not change each time...                    

cutoffFrequency = 250;

tubeDiameter = 0.007;   %%%% If testtube data then it should be changed to 0.011

StimuliTime = 1;

K_p = 1; 

%% Flags
flagPlot = 0; 

%% Hardcoding
rho = 1.293;                    % kg m^3
c = 343;                        % m/s
p0 = 20e-6;                     % Pa

fs = 48e3; 

A = (tubeDiameter/2)^2*pi;

Z0 = (rho*c)/A;                  %Z0

SPLrms = 0; 
SPLForwardRMS = 0; 
printSPL = 0; 
saveData = [];

%% DataPaths 
probeData = "ProbeImpedance.mat";  
probeImpedance = load(probeData);

Psrc = probeImpedance.Psrc;
Zsrc = probeImpedance.Zsrc;

filePath = "C:\Users\Magnus\OneDrive\2 - Uni\8. semester\Project\Data and test results\";
filePathFPL = "C:\Users\Magnus\OneDrive\2 - Uni\8. semester\Project\Data and test results\FPL\";
filePathSPL = "C:\Users\Magnus\OneDrive\2 - Uni\8. semester\Project\Data and test results\SPL\";
filePathOOS = "C:\Users\Magnus\OneDrive\2 - Uni\8. semester\Project\Data and test results\OutOfScope\"; 

%%
if outOfScope == 0
    if isfile(filePathSPL + SaveTestDataAs + "_1.mat") && isfile(filePathFPL + SaveTestDataAs + "_1.mat")
        if Refit == 1 
            SaveTestDataAs = SaveTestDataAs + "Refit"; 
        elseif Refit == 2
        SaveTestDataAs = SaveTestDataAs + "Refit2"; 
        else
            SaveTestDataAs = SaveTestDataAs + "doNotOverwriteData"
        end
    end
end

if outOfScope == 1
    if Refit == 1
        SaveTestDataAs = SaveTestDataAs + "Refit"; 
    end

    if Refit == 2
        SaveTestDataAs = SaveTestDataAs + "Refit2"; 
    end

    SaveTestDataAs = SaveTestDataAs + "_OOS";

    if isfile(filePathOOS + SaveTestDataAs + "_1.mat")
        SaveTestDataAs = SaveTestDataAs + "doNotOverwriteData";
    end
end

if outOfScope == 2
    if Refit == 1
        SaveTestDataAs = SaveTestDataAs + "Refit"; 
    end
    if Refit == 2
        SaveTestDataAs = SaveTestDataAs + "Refit2"; 
    end
    SaveTestDataAs = SaveTestDataAs + "_OOS2";
    if isfile(filePathOOS + SaveTestDataAs + "_1.mat")
        SaveTestDataAs = SaveTestDataAs + "doNotOverwriteData";
    end
end
