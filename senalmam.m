% LIMPIAR ENTORNO
clear; close all; clc;

% PARÁMETROS DE LA SIMULACIÓN
fs = 1000;             % Frecuencia de muestreo (Hz)
t = 0:1/fs:1;          % Vector de tiempo de 1 segundo
fm = 5;                % Frecuencia de la señal moduladora (Hz)
fc = 50;               % Frecuencia de la portadora (Hz)
Am = 1;                % Amplitud de la señal de mensaje
Ac = 2;                % Amplitud de la portadora

% 1. SEÑAL MODULADORA (mensaje)
mensaje = Am * sin(2*pi*fm*t);

% 2. PORTADORA
portadora = Ac * cos(2*pi*fc*t);

% 3. MODULACIÓN AM
senalAM = (1 + mensaje) .* portadora;

% 4. GRÁFICA DE SEÑAL MODULADORA Y PORTADORA
figure;
subplot(2,1,1);
plot(t, mensaje);
title('Señal Moduladora (Mensaje)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
subplot(2,1,2);
plot(t, portadora);
title('Señal Portadora');
xlabel('Tiempo (s)'); ylabel('Amplitud');

% 5. SEÑAL MODULADA EN EL TIEMPO
figure;
plot(t, senalAM);
title('Señal Modulada en Amplitud (AM)');
xlabel('Tiempo (s)'); ylabel('Amplitud');

% 6. ESPECTRO DE FRECUENCIA
N = length(senalAM);
f = linspace(0, fs/2, N/2);
espectro = abs(fft(senalAM));
figure;
plot(f, espectro(1:N/2));
title('Espectro de la Señal AM');
xlabel('Frecuencia (Hz)'); ylabel('Magnitud');

% 7. INTRODUCCIÓN DE RUIDO
ruido = 0.3*randn(size(senalAM));
senalAM_ruido = senalAM + ruido;
figure;
plot(t, senalAM_ruido);
title('Señal AM con Ruido');
xlabel('Tiempo (s)'); ylabel('Amplitud');

% 8. ATENUACIÓN Y DISTORSIÓN
senalAM_atenuada = 0.5 * senalAM;
senalAM_distor = senalAM + 0.2 * senalAM.^2;
figure;
plot(t, senalAM_atenuada, 'b', t, senalAM_distor, 'r');
legend('Atenuada', 'Distorsionada');
title('Señal AM Atenuada y Distorsionada');
xlabel('Tiempo (s)'); ylabel('Amplitud');
