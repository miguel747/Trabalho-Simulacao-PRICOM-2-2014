%Trabalho Simulacao 2 - Pricom 2/2014
%Alunos:    Filipe Miguel
%           Lucas Siqueira

clear all
%parametros pedidos do audio
Fs = 8000;
Ts = 1/Fs;
Ta = 5;
N = Ta/Ts;

%Q1.1
%gravando um sample de audio
rec = audiorecorder(Fs,16,1);
get(rec);
disp('Gravando...')
recordblocking(rec,5);
disp('termino da gravacao');

%dando play no audio gravado
play(rec);

%plotando o sinal do tempo
myRecording = getaudiodata(rec);
t = (0:length(myRecording)-1)/Fs;

figure(1)
plot(t,myRecording);
xlabel('tempo(s)');
ylabel('Amplitude');

%coletando o maior valor do sinal de audio
mp = max(abs(myRecording));

%mostrando a densidade de potencia do sinal
figure(2)
pwelch(myRecording);

%numero de bits
n_bits = 16;
%niveis de quantizacao
L = 2^n_bits;
%Parametros PCM
dv = 2*mp/(L-1);
%particao
part = -mp:dv:mp-dv;
%ATENCAO: lembrando que particoes sao os numeros de niveis -1 = L-1
codebook = -mp:dv:mp;

%utilizando a funcao quatiz para gerar um indice dos niveis de quantizacao
%correspondente aos niveis de amplitude do sinal
[index1,quant16] = quantiz(myRecording,part,codebook);
%converter indice decimal em binario
index_bin = dec2bin(index1);
%plot
amostras = index_bin(1:50);

%Q1.2
%comprimindo o sinal
mu = 255;
myRecording_comp = compand(myRecording,mu,mp,'mu/compressor');

%requantizando
n_bits_new = 8;
L_new = 2^n_bits_new;
dv_new = 2*mp/(L_new-1);
%particao
part_new = -mp:dv_new:mp-dv_new;
%ATENCAO: lembrando que particoes sao os numeros de niveis -1 = L-1
codebook_new = -mp:dv_new:mp;
[index2,quant8_comp] = quantiz(myRecording_comp,part_new,codebook_new);
[index3,quant8_norm] = quantiz(myRecording,part_new,codebook_new);
%plotando os dois sinais quantizados
figure(3)
plot(t,quant8_norm,t,quant8_comp)
grid;
legend('Q. Normal','Q. Sinal Comprimido');









