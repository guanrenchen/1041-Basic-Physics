clear all;

%常數
k = 1.3806e-23; %波茲曼常數
N = 6.0221e23;  %亞佛加厥常數
R = N*k;        %理想氣體常數
e = 2.7183;     %尤拉數

%變數
V_MAX = 3500;   %最高速率(m/s)
dV = 30;        %長條寬度(m/s)
NUM = 10000;    %分子數量
T = 400;        %溫度(K)
M = 0.004;      %分子莫耳質量(kg)

%Maxwell-Boltzmann distrbution function
m = M/N;        %單個分子質量(kg)
v = linspace(0, V_MAX, V_MAX);
y = 4*pi*(m/(2*pi*k*T)).^(3/2) .* e.^(((-1)*m.*v.^2)/(2*k*T)) .* v.^2; 

%plot繪圖
figure(1)
plot(y, 'r')

%速率公式(理論值)
prb = (2*R*T/M).^(1/2);         %最可能速率
avg = ((8*R*T)/(M*pi)).^(1/2);  %平均速率
rms = (3*R*T/M).^(1/2);         %方均根速率

%Monte Carlo method
data=zeros(1, NUM);
for i=1:NUM     
    while data(i)==0
        a = rand()*max(y);
        b = floor(rand()*(V_MAX-1))+1;
        if a <= y(b)
            data(i) = b;
        end
    end
end

%設定各長條中心位置
xc=dV/2:dV:dV*floor(V_MAX/dV)-dV/2; 

%hist繪圖
figure(2)
hist(data, xc)

%hist回傳長條圖數據
[n, v] = hist(data, xc);

%計算速率(實驗值)
prb1 = v(find(n==max(n)));
avg1 = sum(data)/NUM;
rms1 = (sum(data.^2)./NUM).^(1/2);