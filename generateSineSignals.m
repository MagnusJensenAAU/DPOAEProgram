%% Generate 2 sine signals...
T = 1/fs;                       % Sampling period       
L = 1.2*StimuliTime*fs;         % Length of signal
t = (1:L)*T;                    % Time vector

t25 = tukeywin(L,0.1);
t25 = t25.'; 

S1_ = sin(2*pi*baseFrequency*t);    %S1
S1_ = t25.*S1_;

S = sin(2*pi*secondaryFrequency*t);   %% S2
S = t25.*S; 