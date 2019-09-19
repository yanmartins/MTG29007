close all;
clear all;
clc;

a = (6.6*10^-3)/2;    % Raio interno
b = (24.28*10^-3)/2;  % Raio externo
c = 5.8*10^7;         % Condutividade do condutor
d = 2.3;              % Permissividade do dielétrico
u = 4*pi*10^-7;       % Permeabilidade magnética do vácuo 
er = 2.26;            % Permissividade relativa 
eo = 8.854*10^-12;    % Permissividade do vácuo
f = 0.2*10^9;         % Frequencia 200M

% Resistencia
R = (1/(2*pi))*((1/a)+(1/b))*sqrt((pi*f*u)/(c))
 
% Indutancia
L = (u/(2*pi))*log(b/a)
 
% Capacitancia
C = (2*pi*(er*eo))/log(b/a)

% Condutancia
G = (2*pi*d)/log(b/a)

% Gama
gama = sqrt((R + 1j*2*pi*f*L)*(G + 1j*2*pi*f*C))

% Impedância
Zo = sqrt((R + 1j*2*pi*f*L)/(G + 1j*2*pi*f*C))

% Alfa
alfa = real(gama)

% Beta
beta = imag(gama)
 
modulo_Zo = sqrt(alfa^2 + beta^2)