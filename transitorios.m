close all;
clear all;
clc;

Rs = 25;
Ro = 75;
Rl = 125;

c = 3*(10^8); % velocidade da luz
up = 0.1*c

l = 6*(10^-2) % comprimento
Vs = 4;

Vo = (Vs * Ro)/(Ro + Rs) 
GamaL = (Rl - Ro)/(Rl + Ro)
Gamas = (Rs - Ro)/(Rs + Ro)
tl = l/up

VL = (Vs * Rl)/(Rl + Rs) % VL quando não houver mais reflexões na LT
