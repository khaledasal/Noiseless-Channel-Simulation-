 clc;
close all;
clear all;
syms t s;
g1=tf([25],[1 2.5 25]);
h=tf([1],[1]);
sys1=feedback(g1,h);
t=0:0.1:10;
impulse(g1,t);
title('impulse open loop')
figure();
impulse(sys1,t);
title('impulse closed loop')
figure ();
step(g1,t);
title('step open loop')
figure ();
step(sys1,t);
title('step closed loop')
ramp=t;
figure();
lsim(sys1,ramp,t)
title('ramp closed loop')
figure();
lsim(g1,ramp,t)
title('ramp open loop')
figure();
parabolaa=(0.5*(t.^2));
lsim(sys1,parabolaa,t);
title('parabolic closed loop')
steplp=1/s;
ramplp=1/s^2;
paraboliclp=1/s^3;
g_lp=25/(s^2+2.5*s+25);
h_lp=1;
ess1=limit((s*steplp)/(1+(g_lp*h_lp)),0)
ess2=limit((s*ramplp)/(1+(g_lp*h_lp)),0)
ess3=limit((s*paraboliclp)/(1+(g_lp*h_lp)),0)
figure();
rlocus(g1);
figure();
bode(g1);
margin(g1);
g_c=tf([0.80244 5.158 32.244],[1 0]);
g_pid=g1*g_c
sys2=feedback(g_pid,h);
figure ();
step(sys2);
title('step pid');
sys2_ramp=tf([20.06 129 806.1],[21.06 131.5 831.1 0]);
figure();
step(sys2_ramp);
title('ramp pid');
sys2_parabolic=tf([20.06 129 806.1],[21.06 131.5 831.1 0 0]);
figure();
step(sys2_parabolic,t)
title('parabolic pid')
sys3_pid=((20.06*s^2)+(129^s)+806.1)/(s^2+2.5*s+25);
ess1=limit((s*steplp)/(1+(sys3_pid*h_lp)),0)
ess2=limit((s*ramplp)/(1+(sys3_pid*h_lp)),0)
ess3=limit((s*paraboliclp)/(1+(sys3_pid*h_lp)),0)
figure();
rlocus(g_pid);
figure();
bode(g_pid)
margin(g_pid);
g_lead_lag=tf([64.3 220.95 38.92],[1 18.905 69.3 413.3 20.5]);
sys4=feedback(g_lead_lag,h)
figure();
step(sys4);
title('lead-lag step');
sys4_ramp=tf([64.3 220.95 38.92],[1 18.905 133.6 634.2 59.42 0]);
figure();
step(sys4_ramp,t);
title('lead-lag ramp');
sys4_parabolic=tf([64.3 220.95 38.92],[1 18.905 133.6 634.2 59.42 0 0]);
figure();
step(sys4_parabolic,t);
title('lead-lag parabolic');
sys5=(64.3*s^2 + 220.95*s + 38.92)/(s^4 + 18.91*s^3 + 69.3*s^2 + 413.3*s + 20.5);
ess1=limit((s*steplp)/(1+(sys5*h_lp)),0)
ess2=limit((s*ramplp)/(1+(sys5*h_lp)),0)
ess3=limit((s*paraboliclp)/(1+(sys5*h_lp)),0)
figure();
rlocus(g_lead_lag);
figure();
bode(g_lead_lag);
margin(g_lead_lag);




