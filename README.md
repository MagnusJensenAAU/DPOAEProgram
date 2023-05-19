% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
% Group ID : 827				  %
% Author : Magnus Munk Jensen  	  %
% Date : 2023-05-09			  %
% Matlab version: R2023A		  %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

The program is inteded to be used, to measure DPOAE on a test subject. 
It can both be used to do SPL calibration, aswell as FPL calibration. 

For the program to be able to do FPL calibration, you will need the impedance of the OAE probe. It must be named "ProbeImpedance.mat" and contain two arrays, one with the impedance, and one with the source pressure. 

The following parameters are changeable, and should be considered before you run the program.

SaveTestDataAs		: The data will be saved accordinly to what is written here
noOfRuns			: How many OAE measurements will be done
FPLCalibration		: 0 for SPL calibration, 1 for FPL calibration
outOfScope			: 0 for regular FPL calibration, 1 for calibration with secondary level being 55 db, and 2 for calibration with primary being 50 db.
Refit				: 0 for initial test, 1 for refit, 2 for 2nd refit.
probeConversionFactor	: A conversion factor, calculating a value in Pa from the digital value.
baseSPL 			: The primary target level for FPL calibration.
secondarySPL		: The secondary target level for FPL calibration


Inside SetupAudioPlayerRec the following parameters are changeable, and should be considered before you run the program.

aPRDevice			: Which device will you play and record through. 
aPR.BufferSize		: The sound card buffer size.
For documentation about the audioplayerrecorder see: https://se.mathworks.com/help/audio/ref/audioplayerrecorder-system-object.html

Inside Init.m the following paths has to be changed, to point towards: 

filePath			: The folder, which in data has to be saved.
filePathFPL			: A folder called "FPL" inside the filePath
filePathSPL			: A folder called "SPL" inside the filePath
filePathOutOfScope	: A folder called "OutOfScope" inside the filePath
