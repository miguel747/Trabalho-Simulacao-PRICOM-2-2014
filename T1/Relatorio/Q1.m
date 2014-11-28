%Universidade de Brasilia
%Principios de Comunicacao
%Alunos:    Filipe Miguel
%           Lucas Siqueira
%Data 25/10/2014
clear all;
%taxa de amostragem
fa = 20;
Ta = 1/fa;
%frequencias dos sinais
f1 = 1;
f2 = 1.5;
%intervalo do sinal(segundos)
T0 = 5;
%amostras
N = T0/Ta;
%definindo o intervalo
t = 0:Ta:T0;
%definindo o sinal
x = cos(2*pi*f1*t)-sin(2*pi*f2*t);
%plotando grafico no dominio do tempo

%Item 1.1
figure(1)
plot(t,x)
legend('sinal x(t)');
xlabel('tempo(s)');
ylabel('amplitude de x(t)');

%Item 1.2
%calculando a DFT do sinal
NFFT = 2^nextpow2(N);
X = fft(x,NFFT)/length(x);
%calculando modulo e fase do sinal X
X_phase = unwrap(angle(X(1:NFFT/2+1)));
%plotando o espectro de amplitude e fase do sinal
figure(2)
%criando o intervalo entre a banda essencial do sinal X(f) até 10Hz
f = fa/2*linspace(0,1,NFFT/2+1);
%amplitude
plot(f,2*abs(X(1:NFFT/2+1)));
legend('Espectro de X(f)');
xlabel('frequencia(Hz)'); grid

figure(3)
%fase
plot(f,X_phase);
xlabel('frequencia(Hz)');
legend('Fase(radianos)');
grid;

%item 1.3
%Novo intervalo
T0 = 20;
N = T0/Ta;
%definindo o intervalo
t = 0:T0/N:T0;
%definindo o sinal
x = cos(2*pi*f1*t)-sin(2*pi*f2*t);
%plotando grafico no dominio do tempo
figure(4)
plot(t,x);
legend('sinal x(t)');
xlabel('tempo(s)');
ylabel('amplitude de x(t)');
grid;

%calculando a DFT do sinal
NFFT = 2^nextpow2(N);
X = fft(x,NFFT)/length(x);
%calculando modulo e fase do sinal X
X_phase = unwrap(angle(X(1:NFFT/2+1)));
%plotando o espectro de amplitude e fase do sinal
figure(5)
%criando o intervalo entre a banda essencial do sinal X(f) até 10Hz
f = fa/2*linspace(0,1,NFFT/2+1);
%amplitude
plot(f,2*abs(X(1:NFFT/2+1)));
legend('Espectro de X(f)');
xlabel('frequencia(Hz)'); grid
figure(6)
plot(f,X_phase);
xlabel('frequencia(Hz)');
legend('Fase(graus)');
grid;

%item 1.4 
%agora mudando fa = 5Hz e fa = 2Hz e T0 = 20s
%taxa de amostragem
fa1 = 5;
fa2 = 2;
Ta1 = 1/fa1;
Ta2 = 1/fa2;
%frequencias dos sinais
f1 = 1;
f2 = 1.5;
%intervalo do sinal(segundos)
T0 = 20;
%amostras
N1 = T0/Ta1;
N2 = T0/Ta2;
%definindo o intervalo
t1 = 0:Ta1:T0;
t2 = 0:Ta2:T0;
%definindo o sinal
x1 = cos(2*pi*f1*t1)-sin(2*pi*f2*t1);
x2 = cos(2*pi*f1*t2)-sin(2*pi*f2*t2);
%plotando grafico no dominio do tempo

figure(7)
subplot(211)
plot(t1,x1)
legend('sinal x1(t)','');grid
xlabel('tempo(s)');
subplot(212)
plot(t2,x2);
legend('sinal x2(t)');
xlabel('tempo(s)');grid

%calculando a DFT do sinal
NFFT1 = 2^nextpow2(N1);
X1 = fft(x1,NFFT1)/length(x1);

NFFT2 = 2^nextpow2(N2);
X2 = fft(x2,NFFT2)/length(x2);

%calculando modulo e fase do sinal X
X_phase1 = unwrap(angle(X1(1:NFFT1/2+1)));
X_phase2 = unwrap(angle(X2(1:NFFT2/2+1)));

figure(8)
%criando o intervalo entre a banda essencial do sinal X(f) até 10Hz
f1 = fa1/2*linspace(0,1,NFFT1/2+1);
f2 = fa2/2*linspace(0,1,NFFT2/2+1);

%amplitude
subplot(211);
plot(f1,2*abs(X1(1:NFFT1/2+1)));grid;
title('Espectro de X1(f)');
xlabel('frequencia(Hz)'); grid
subplot(212);
plot(f2,2*abs(X2(1:NFFT2/2+1)));
title('Espectro de X2(f)');
xlabel('frequencia(Hz)'); grid

figure(9)
%fase
subplot(211);
plot(f1,X_phase1);grid;

subplot(212);
plot(f1,X_phase1);grid;

xlabel('frequencia(Hz)');
title('Fase(radianos)');





