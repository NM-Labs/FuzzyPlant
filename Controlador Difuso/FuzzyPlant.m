s = serial('COM3');
time=50;
i=1;
P = readfis('RealFuzzyPlantSom');

while(i<time)

fopen(s)
% fprintf(s, 'Datos del serial:')

out = fscanf(s)

Temp(i)=str2num(out(1:2));
 subplot(411);
 plot(Temp,'g');
 axis([0,time,20,50]);
title('Parametro: DHT11 Temperatura');
xlabel('---> tiempo en segundos');
ylabel('---> Temperatura');
grid

Humi(i)=str2num(out(3:4));
 subplot(412);
 plot(Humi,'m');
axis([0,time,25,100]);
title('Parametro: DHT11 Humedad');
xlabel('---> tiempo en segundos');
ylabel('---> % of Humedad ');
grid

Suelo(i)=str2num(out(5:8));
 subplot(413);
 plot(Suelo,'b');
axis([0,time,0,1300]);
title('Parametro: Suelo Humedad');
xlabel('---> tiempo en segundos');
ylabel('---> Muy Humedo ----- Muy Seco ');
grid

E = evalfis(P,[Humi(i),Temp(i),Suelo(i)])
Eplot(i)=E;
subplot(414);
 plot(Eplot,'r');
axis([0,time,0,255]);
title('Parametero: Activacion Bomba');
xlabel('---> tiempo en segundos');
ylabel('---> Flujo ');
grid



fwrite(s, round(E), 'int'); 
% pause(10); 


incbyte = fscanf(s)

ii(i)= str2num(incbyte);
 pause(1); 

fclose(s)
i=i+1;
drawnow;
end
delete(s)
clear s