% 平面上有一彈性常數為1N/m，原長為10m的彈簧連接質量0.1kg的物體，初位置12m。
% a.請以積分的數值方法(如提示)模擬彈簧運動的軌跡，以位移量對時間作圖，並畫出位置對速度以及彈力位能的變化。
%   以及總能量(動能及位能總和)對位置的變化。
% 提示:初速為0，受力作用下經過時間dt，根據力學計算這一瞬間的速度及位置的改變，並且以這一個新的結果作為下一次計算的初始條件。
%      計算過程中位移量不斷的在變化，因此彈力也不斷的改變。
% b.若物體移動時受固定阻力0.1N以及0.5N方向恆相反於速度方向，結果又為何?
% 提示:可以嘗試著用不同的阻力試試看會有什麼不同的結果。
t(1) = 0;
dt = 0.01;
m = 0.1;
x0 = 10;
k = 1;
res = 0; %阻力(N)

x(1) = 12;
v(1) = 0;
f(1) = (x0-x(1))*k;

for i = 2:1:1000
    t(i) = t(i-1)+dt;    
    f(i) = (x0-x(i-1))*k;
    v(i) = v(i-1)+f(i)/m*dt;
    if v(i)>0
        v(i) = v(i) - res/m*dt;
    end
    if v(i)<0
        v(i) = v(i) + res/m*dt;
    end
    x(i) = x(i-1)+v(i)*dt;
    
    if v(i).^2<1e-6
        break
    end
end

ek = 1/2*m*(v.^2);
eu = 1/2*k*((x-x0).^2);
e = ek+eu;

figure 
plot(t, x-x0, 'k:.')
grid on
xlabel('時間(s)')
ylabel('位移量(m)')

figure 
plot(v, x, 'k:.')
grid on
xlabel('速度(m/s)')
ylabel('位置(m)')

figure 
plot(eu, x, 'k:.')
grid on
xlabel('彈力位能(J)')
ylabel('位置(m)')

figure 
plot(x, e, 'k:.')
grid on
xlabel('位置(m)')
ylabel('總能量(J)')
axis equal