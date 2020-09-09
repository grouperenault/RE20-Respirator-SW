% caras poumons
Rpoumon=15;
Cpoumon=0.1;
% Réglage normal passif: R=5 & C=0.07
% Réglage obstructif :  R=15 & C=0.1
% Réglage restrictif passif : R=10 & C=0.03

% cara cycle respi
tperiod=3;
tinsp=1;
texp=tperiod-tinsp;

% Kv vanne makair
load('X_makair.mat')
load('Y_makair.mat')

% cara rampes ouvertures vanne
tramp_insp=0.15;
t_reponse_action=0.15;
%Profil inspi
tgtmax_insp=0;
tgtmax_exp=0;
X_insp=[0 t_reponse_action t_reponse_action+tramp_insp  tinsp-t_reponse_action-tramp_insp tinsp-t_reponse_action tinsp tperiod];
Y_insp=[45 45 tgtmax_insp tgtmax_insp 45 45 45];
X_exp=[0 tinsp tinsp+t_reponse_action tinsp+t_reponse_action+tramp_insp tperiod-t_reponse_action-tramp_insp tperiod-t_reponse_action tperiod];
Y_exp=[45 45 45 tgtmax_exp tgtmax_exp 45  45];
% Flag PID (1pid actif 0 inactif)
Flag_pid_exp=1;
Flag_pid_insp=0;
%Consignes pression (cmH2O)
Pblower_tgt=55;
Patm=0;
Peep=8;
Ppeak=18;

% datas_géométriques_excentrique
e=4.5;
Rex=12.5;
Dinttuy=6;
hlibtuy=0.05;

% NEW
BTClockRemoval=1;
tramp_insp2=0.001;
X_insp2=[0 t_reponse_action t_reponse_action+tramp_insp2  tinsp-t_reponse_action-tramp_insp tinsp-t_reponse_action tinsp tperiod];
X_exp2=[0 tinsp tinsp+t_reponse_action tinsp+t_reponse_action+tramp_insp2 tperiod-t_reponse_action-tramp_insp tperiod-t_reponse_action tperiod];

