% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Group ID : 8XX
% Author : Magnus Munk Jensen
% Date : 2023-05-03
% Matlab version: R2023A
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; 
close all; 
clear all;

%% Adjustable parameters
SaveTestDataAs = "TestSubjectName";
noOfRuns = 5;                               % Number of DPOAE measurements.

FPLCalibration  = 0;                         % 0 for SPL calibration, 1 for FPL
outOfScope      = 0;                         % 0, 1 or 2
Refit           = 0;                         % 0, 1, or 2   

probeConversionFactor = 0.438963306116679;

baseSPL = 60;                               % Pressure f1
secondarySPL = 45;    

if outOfScope == 1
    secondarySPL = 55
end

if outOfScope == 2
    baseSPL = 50;
    secondarySPL = 45
end

%% Init
run("Init.m"); 
run("SetupAudioPlayerRec.m"); 

%% Get ear impedance
if FPLCalibration == 1
    run("earImpedance.m"); 
end

%% run DPOAE 1
SPLForwardRMS = 67
baseFrequency = 1000;                       % f1
secondaryFrequency = baseFrequency * 1.22;  % f2
f3 = 2*baseFrequency - secondaryFrequency;   % f3

run("generateSineSignals.m"); 

run("calibrateAmplitudes.m"); 

if FPLCalibration == 1
    SaveFileAs = filePathFPL + SaveTestDataAs + "_1.mat";
    if outOfScope == 1 || outOfScope == 2
        SaveFileAs = filePathOOS + SaveTestDataAs + "_1.mat"
    end
elseif FPLCalibration == 0
    SaveFileAs = filePathSPL + SaveTestDataAs + "_1.mat";
end

run("DPOAE.m");

close all;

%% run DPOAE 2 
SPLForwardRMS = 67
baseFrequency = 2000;                       % f1
secondaryFrequency = baseFrequency * 1.22;  % f2
f3 = 2*baseFrequency - secondaryFrequency;   % f3

run("generateSineSignals.m"); 

run("calibrateAmplitudes.m"); 

if FPLCalibration == 1
    SaveFileAs = filePathFPL + SaveTestDataAs + "_2.mat";
    if outOfScope == 1 || outOfScope == 2
        SaveFileAs = filePathOOS + SaveTestDataAs + "_2.mat"; 
    end
elseif FPLCalibration == 0
    SaveFileAs = filePathSPL + SaveTestDataAs + "_2.mat";
end


run("DPOAE.m");
close all;

%% run DPOAE 3
SPLForwardRMS = 67
baseFrequency = 4000;                       % f1
secondaryFrequency = baseFrequency * 1.22;  % f2
f3 = 2*baseFrequency - secondaryFrequency;   % f3

run("generateSineSignals.m"); 

run("calibrateAmplitudes.m"); 

if FPLCalibration == 1
    SaveFileAs = filePathFPL + SaveTestDataAs + "_4.mat";
    if outOfScope == 1 || outOfScope == 2
        SaveFileAs = filePathOOS + SaveTestDataAs + "_4.mat"; 
    end
elseif FPLCalibration == 0
    SaveFileAs = filePathSPL + SaveTestDataAs + "_4.mat";
end


run("DPOAE.m");
close all;

%% run DPOAE 4
SPLForwardRMS = 67
baseFrequency = 6000;                       % f1
secondaryFrequency = baseFrequency * 1.22;  % f2
f3 = 2*baseFrequency - secondaryFrequency;  % f3

run("generateSineSignals.m"); 

run("calibrateAmplitudes.m"); 

if FPLCalibration == 1
    SaveFileAs = filePathFPL + SaveTestDataAs + "_6.mat";
    if outOfScope == 1 || outOfScope == 2
        SaveFileAs = filePathOOS + SaveTestDataAs + "_6.mat"; 
    end
elseif FPLCalibration == 0
    SaveFileAs = filePathSPL + SaveTestDataAs + "_6.mat";
end

run("DPOAE.m");
