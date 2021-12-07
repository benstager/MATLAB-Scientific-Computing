function y = initial_condition_release(perc_inf,y0)
% 01/22/2017 Zhuolin Qu
% 04/11/2017 Zhuolin Qu
% set up the initial condition for the simulations
% [input]:
% perc_inf = [perc_aqa, perc_fw, perc_fpw, perc_mw]
% perc_aqa: fraction of infected aquatic-stage mosquitoes released (relative to DFE)
% perc_fw: fraction of infected single female mosquitoes released
% perc_fpw: fraction of infected pregnant female mosquitoes released
% perc_mw: fraction of infected male mosquitoes released

% [output]:
% the difference between the analytical endemic equilibrium value
% and the calculated steady-state value


A_u0=y0(1);
A_w0=y0(2);
F_u0=y0(3);
F_w0=y0(4);
F_pu0=y0(5);
F_pw0=y0(6);
M_u0=y0(7);
M_w0=y0(8);

perc_aqa = perc_inf(1);
perc_fw = perc_inf(2);
perc_fpw = perc_inf(3);
perc_mw = perc_inf(4);


[A_uDFE,A_wDFE,F_uDFE,F_wDFE,F_puDFE,F_pwDFE,M_uDFE,M_wDFE] = equilibrium_pt_preg(0,'DFE');


A_w = A_w0 + perc_aqa*A_uDFE; % usually do not release aquatic stage mosquitoes -- keep same
F_w = F_w0 + perc_fw*F_uDFE;
F_pw = F_pw0 + perc_fpw*F_puDFE;
M_w = M_w0 + perc_mw*M_uDFE;

A_u = A_u0; % do not release aquatic stage mosquitoes -- keep same
F_u = F_u0;
F_pu = F_pu0;
M_u = M_u0;

display(['release aquatic-stage ',num2str(perc_aqa)])
display(['release single females ',num2str(perc_fw)])
display(['release pregnant females ',num2str(perc_fpw)])
display(['release males ',num2str(perc_mw)])

y = [A_u,A_w,F_u,F_w,F_pu,F_pw,M_u,M_w]';

end








