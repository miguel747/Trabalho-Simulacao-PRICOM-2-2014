%Trabalho Simulacao 2 - Pricom 2/2014
%Alunos:    Filipe Miguel
%           Lucas Siqueira

clear all
%gravando um sample de audio
rec = audiorecorder(8000,16,1);
get(rec);
disp('Gravando...')
recordblocking(rec,5);
disp('termino da gravacao');

%dando play no audio gravado
play(rec);


recordblo
