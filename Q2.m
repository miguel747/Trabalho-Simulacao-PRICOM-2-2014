%Parte 2
%Filipe Miguel
%Lucas Siqueira
%
clear all;
%constantes
fmax = 32000; % frequ�ncia m�xima observ�vel na DFT
ncorr = 512; %numero de amostras da autocorrelacao
fs = 1000;
Ts = 1/fs; %pixels/s
%lendo a imagem
A = imread('sample','bmp');
%transformando a matriz em um vetor
X = reshape(A,1,[]);
%Q2.1
%plotando o sinal
figure(1);
plot((0:length(X)-1)*Ts, X);
grid;
%Q2.2
figure(2)
%Autocorrelacao
Aut = xcorr(X,ncorr);
plot((0:length(Aut)-1)*Ts,Aut);






