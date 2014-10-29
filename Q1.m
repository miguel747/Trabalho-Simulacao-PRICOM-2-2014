%Universidade de Brasilia
%Principios de Comunicacao
%Alunos:    Filipe Miguel
%           Lucas Siqueira
%Data 25/10/2014
%taxa de amostragem
fs = 20;
Ts = 1/fs;
%frequencias do sinal
f1 = 1;
f2 = 1.5;
%intervalo do sinal
T0 = 5;
%amostras
N = T0*fs;
%definindo o intervalo
t = 0:Ts:Ts*(N-1);
%definindo o sinal
x = cos(2*pi*f1*t)-sin(2*pi*f2*t);
%plotando grafico no dominio do tempo
plot(t,x);
grid;

%calculando a DFT do sinal
X = fft(x);

%calculando modulo e fase do sinal X
X_mag = abs(X);
X_phase = angle(X);

k = 0:N-1;
f = k/T0;

%plotando o espectro de amplitude e fase do sinal
stem(f(1:fs/2),X_mag(1:fs/2));
legend('Amplitude');
grid;
stem(f(1:fs/2),X_phase(1:fs/2));
legend('Fase(radianos)');
grid;





