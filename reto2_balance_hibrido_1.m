% RETO 2 - MODELADO DEL BALANCE HÍBRIDO
% Curso: Software para Ingeniería
% Código: 203036
% Sistema Inteligente de Gestión Energética (SIGE)

clc;
clear;
close all;

% Vector que representa las 24 horas del día
horas = 1:24;

% Generación solar en kW.
% La producción es cero durante la noche y alcanza
% un máximo de 25 kW en la hora 12.
solar = [0 0 0 0 0 5 10 15 20 23 25 23 20 15 10 5 0 0 0 0 0 0 0 0];

% Generación eólica en kW.
% Los valores representan fluctuaciones irregulares
% durante las 24 horas.
eolica = [8 10 7 12 9 11 8 13 10 12 9 14 11 8 12 10 9 7 6 8 10 7 9 8];

% Generación híbrida total.
% Se suman la generación solar y la generación eólica
% para cada hora del día.
generacion_total = solar + eolica;

% Demanda eléctrica de la comunidad en kW.
% Horas nocturnas: entre 2 y 4 kW.
% Horas diurnas: entre 6 y 10 kW.
% Horas de máxima demanda: 15 kW.
demanda = [3 3 2 4 3 6 7 8 9 8 10 9 8 7 9 10 8 15 15 15 15 4 3 2];

% Cálculo del balance energético.
% Un valor positivo representa superávit.
% Un valor negativo representa déficit.
balance = generacion_total - demanda;

% Identificación de horas con superávit energético.
horas_superavit = horas(balance > 0);

% Identificación de horas con déficit energético.
horas_deficit = horas(balance < 0);

% Mostrar la generación total.
disp('Generación total por hora (kW):');
disp(generacion_total);

% Mostrar la demanda.
disp('Demanda de la comunidad por hora (kW):');
disp(demanda);

% Mostrar el balance energético.
disp('Balance energético por hora (kW):');
disp(balance);

% Mostrar las horas con superávit.
disp('Horas con superávit energético:');
disp(horas_superavit);

% Mostrar las horas con déficit.
disp('Horas con déficit energético:');
disp(horas_deficit);

% Crear la figura para comparar generación y demanda.
figure;

% Graficar la generación híbrida total.
plot(horas, generacion_total, '-o', 'LineWidth', 1.5);

hold on;

% Graficar la demanda de la comunidad.
plot(horas, demanda, '-s', 'LineWidth', 1.5);

% Título de la gráfica.
title('Balance Híbrido de Generación y Demanda Energética');

% Etiqueta del eje X.
xlabel('Tiempo en horas');

% Etiqueta del eje Y.
ylabel('Potencia en Kilovatios (kW)');

% Leyenda de las curvas.
legend('Generación Híbrida Total', 'Demanda de la Comunidad', ...
    'Location', 'best');

% Activar cuadrícula.
grid on;

% Mostrar las 24 horas en el eje X.
xticks(1:24);

% Finalizar la superposición de las gráficas.
hold off;