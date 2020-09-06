clear all;

%�`��
k = 1.3806e-23; %�i���ұ`��
N = 6.0221e23;  %�Ȧ�[�ֱ`��
R = N*k;        %�z�Q����`��
e = 2.7183;     %�שԼ�

%�ܼ�
V_MAX = 3500;   %�̰��t�v(m/s)
dV = 30;        %�����e��(m/s)
NUM = 10000;    %���l�ƶq
T = 400;        %�ū�(K)
M = 0.004;      %���l���ս�q(kg)

%Maxwell-Boltzmann distrbution function
m = M/N;        %��Ӥ��l��q(kg)
v = linspace(0, V_MAX, V_MAX);
y = 4*pi*(m/(2*pi*k*T)).^(3/2) .* e.^(((-1)*m.*v.^2)/(2*k*T)) .* v.^2; 

%plotø��
figure(1)
plot(y, 'r')

%�t�v����(�z�׭�)
prb = (2*R*T/M).^(1/2);         %�̥i��t�v
avg = ((8*R*T)/(M*pi)).^(1/2);  %�����t�v
rms = (3*R*T/M).^(1/2);         %�觡�ڳt�v

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

%�]�w�U�������ߦ�m
xc=dV/2:dV:dV*floor(V_MAX/dV)-dV/2; 

%histø��
figure(2)
hist(data, xc)

%hist�^�Ǫ����ϼƾ�
[n, v] = hist(data, xc);

%�p��t�v(�����)
prb1 = v(find(n==max(n)));
avg1 = sum(data)/NUM;
rms1 = (sum(data.^2)./NUM).^(1/2);