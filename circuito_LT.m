% Arquivo.m: ML0203

% Consideramos fios de conexão entre uma fonte
% e uma carga e desejamos demonstrar quando estes fios
% tem que ser modelados por elementos concentrados, e também
% quando a representação por elementos concentrados deve ser substituída
% por LT (elementos distribuídos).
% O programa considera um circuito completo, com o comprimento da LT
% sem perdas dado em comprimentos de onda.
% A magnitude e a fase da tensão na carga são traçadas em função do
% comprimento da linha em comprimentos de onda.

% Wentworth, 15/3/06

% Resiltados elemento concentrado:
% vLLe tensão na carga 
% VLLE magnitude da tensão na carga 
% phLLE fase da tensão na carga
% Z1 combinação paralela de RL e capacitor concentrado
% Z2 combinação série de RS e indutor concentrado
% XXstr dadi vetor de texto

% Inicialização
clc
clear all
close all

Zo = 50;
Zo_calc = 60.268;
RS = 200;
RL = 200;
Vs = 2;
d = 0.01:0.001:10;

% ------------- Zo ORIGINAL
% Cálculos LT

GL = (RL-Zo)/(RL+Zo);
num = RL + 1i*Zo.*tan(2*pi.*d);
den = Zo+1i*RL.*tan(2*pi.*d);
Zin = Zo.*num./den;
Vin = Vs.*Zin./(Zin+RS);
Vop = Vin./(exp(1i*2*pi.*d)+GL.*exp(-1i*2*pi.*d));
vLTL = Vop.*(1+GL);
VLTL = abs(vLTL);
phLTL = 180.*angle(vLTL)./pi;

% Cálculos elementos concentrados

A = -1i.*Zo./(2*pi.*d);
Z1 = (RL.*A)./(RL+A);
Z2 = RS+1i*2*pi*Zo.*d;
vLLE = Vs.*Z1./(Z1+Z2);
VLLE = abs(vLLE);
phLLE = 180.*angle(vLLE)./pi;

% ------------- Zo CALCULADO
% Cálculos LT
GL = (RL-Zo_calc)/(RL+Zo_calc);
num = RL + 1i*Zo_calc.*tan(2*pi.*d);
den = Zo_calc+1i*RL.*tan(2*pi.*d);
Zin = Zo_calc.*num./den;
Vin = Vs.*Zin./(Zin+RS);
Vop = Vin./(exp(1i*2*pi.*d)+GL.*exp(-1i*2*pi.*d));
vLTL = Vop.*(1+GL);
VLTL_calc = abs(vLTL);
phLTL_calc = 180.*angle(vLTL)./pi;

% Cálculos elementos concentrados
A = -1i.*Zo_calc./(2*pi.*d);
Z1 = (RL.*A)./(RL+A);
Z2 = RS+1i*2*pi*Zo_calc.*d;
vLLE = Vs.*Z1./(Z1+Z2);
VLLE_calc = abs(vLLE);
phLLE_calc = 180.*angle(vLLE)./pi;


% Geração do primeiro gráfico
subplot(211)
semilogx(d, VLTL, d, VLLE, '--k'); hold on;
semilogx(d, VLTL_calc, d, VLLE_calc, '--k')
ylabel('Magnitude VL');
grid on
h = legend('modelo LT', 'modelo LT calculado', 'modelo por elemento concentrado');
legend (h, "location", "southwest");

% Definição das informações do título
RSstr = strcat('Rs=', num2str(RS),'ohms');
RLstr = strcat(', RL=', num2str(RL),'ohms');
Zostr = strcat(', Zo=', num2str(Zo),'ohms');
Zostr_calc = strcat(', Zo=', num2str(Zo_calc),'ohms');
Tstr = cstrcat(RSstr,RLstr,Zostr, Zostr_calc);
title(Tstr)


% Geração do segundo gráfico
subplot(212)
semilogx(d, phLTL, d, phLLE, '--k'); hold on;
semilogx(d, phLTL_calc, d, phLLE_calc, '--k')
axis([0.01 10 -180 180])
set(gca, 'YTick', [-180:60:180])

% Notar que o comando gca reconhece o eixo atual
% sendo seguido pelos valores inicial:passo:final
% para identificar as marcas "YTICK"

ylabel('fase VL')
h = legend('modelo LT', 'modelo LT calculado', 'modelo por elemento concentrado');
legend (h, "location", "northwest");
xlabel('d (comprimento de onda)')
grid on