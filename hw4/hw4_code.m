clear all;

%常數
k = 1.3806488e-23; %波茲曼常數
N = 6.0221413e23;  %亞佛加厥常數
R = 8.3144621;        %理想氣體常數
e = 2.7182818;     %尤拉數

%變數
V_MAX = 3500;   %最高速率(m/s)
dV = 30;        %長條寬度(m/s)
NUM = 10000;    %分子數量
T = 400;        %溫度(K)
M = 0.004;      %分子莫耳質量(kg)

%設定各長條中心位置
xc=dV/2:dV:dV*ceil(V_MAX/dV)-dV/2; 

%Maxwell-Boltzmann distrbution function
m = M/N;        %單個分子質量(kg)
V = xc;
MBD = 4*pi*(m/(2*pi*k*T)).^(3/2) .* e.^(((-1)*m.*V.^2)/(2*k*T)) .* V.^2; 

%於各個長條產生對應的速度數量(隨機)
num = ceil(MBD/sum(MBD)*NUM);
NUM = sum(num);
a=1;
for i=1:ceil(V_MAX/dV)
    for j=1:num(i)
        data(a) = xc(i)-dV/2+dV*rand();
        a = a+1;
    end
end

%hist回傳長條圖數據
[n, v] = hist(data, xc);

%hist繪圖
hist(data, xc)
hold on

%plot繪圖
plot(V, MBD*(max(n)/max(MBD)), 'r')
xlabel('velocity(m/s)')
axis([0,V_MAX,0,inf])

%速率公式(理論值)
prb = sqrt(2*R*T/M);         
avg = sqrt((8*R*T)/(M*pi));  
rms = sqrt(3*R*T/M);         

%計算速率(實驗值)
prb1 = mean(v(find(n==max(n))));
avg1 = mean(data);
rms1 = sqrt(sum(data.^2)/NUM);