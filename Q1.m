%Universidade de Brasilia
%Principios de Comunicacao
%Alunos:    Filipe Miguel
%           Lucas Siqueira
%Data 25/10/2014
%taxa de amostragem
fa = 20;
%frequencias do sinal
f1 = 1;
f2 = 1.5;
%intervalo do sinal(segundos)
T0 = 5;
%amostras
N = T0*fa;
%definindo o intervalo
t = 0:T0/N:T0;
%definindo o sinal
x = cos(2*pi*f1*t)-sin(2*pi*f2*t);
%plotando grafico no dominio do tempo

%Item 1.1
figure(1)

plot(t,x)
hold on
% amostragem com taxa à frequência de Nyquist
B = f2;
BNyq = 2*B;
Ba = BNyq;
Ta = 1/Ba; 
tsamp = 0:Ta:T0;
os = Ta*fa;
xsamp = x(1:os:end);


plot(tsamp,xsamp,'*r')
hold on

%Item 1.2
%calculando a DFT do sinal
X = fft(x);
%calculando modulo e fase do sinal X
X_mag = abs(X);
X_phase = angle(X);
%definindo um vetor k com tamanho N
k = 0:length(X)-1;
%definindo a frequencia em funcao do intervalo de duracao
f = k/T0; %ou f = k*f0 sendo f0 = 1/T0
%plotando o espectro de amplitude e fase do sinal
figure(2)
plot(f,X_mag);
legend('Amplitude');
xlabel('frequencia(Hz)');
grid;
figure(3)
plot(f,X_phase*180/pi);
xlabel('frequencia(Hz)');
legend('Fase(graus)');
grid;

%item 1.3
%Novo intervalo
T0 = 20;
%amostras
N = T0*fa;
%definindo o intervalo
t = 0:T0/N:T0;
%definindo o sinal
x = cos(2*pi*f1*t)-sin(2*pi*f2*t);
%plotando grafico no dominio do tempo
figure(4)
plot(t,x);
grid;

%calculando a DFT do sinal
X = fft(x);
%calculando modulo e fase do sinal X
X_mag = abs(X);
X_phase = angle(X);
%definindo um vetor k com tamanho N
k = 0:N-1;
%definindo a frequencia em funcao do intervalo de duracao
f = k/T0; %ou f = k*f0 sendo f0 = 1/T0
%plotando o espectro de amplitude e fase do sinal
figure(5)
subplot(211),stem(f(1:fa/2),X_mag(1:fa/2));
legend('Amplitude');
grid;
subplot(212),stem(f(1:fa/2),X_phase(1:fa/2));
legend('Fase(radianos)');
grid;







