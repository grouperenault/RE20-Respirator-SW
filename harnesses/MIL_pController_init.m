
%Plant model
run('RespiratorPlantModel_init')

% MIL
Pblower_tgt=55;
tramp_insp2=0.001;
X_insp2=[0 t_reponse_action t_reponse_action+tramp_insp2  tinsp-t_reponse_action-tramp_insp tinsp-t_reponse_action tinsp tperiod];
X_exp2=[0 tinsp tinsp+t_reponse_action tinsp+t_reponse_action+tramp_insp2 tperiod-t_reponse_action-tramp_insp tperiod-t_reponse_action tperiod];

% Setpoint
pPatientValveInletTargetRef=100;          %mmH2O 100
pBlowerValveOutletMaxStaticTargetRef=200; %mmH2O 200
pBlowerValveOutletMaxPeakTargetRef=350;   %mmH2O 350
nCyclePerMinuteRef=25;                    %25 -/min
rInhalationPerCycleRef=1/3;