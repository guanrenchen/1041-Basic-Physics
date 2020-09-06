clear all;

%�`��
k = 1.3806488e-23; %�i���ұ`��
N = 6.0221413e23;  %�Ȧ�[�ֱ`��
R = 8.3144621;        %�z�Q����`��
e = 2.7182818;     %�שԼ�

%�ܼ�
V_MAX = 3500;   %�̰��t�v(m/s)
dV = 30;        %�����e��(m/s)
NUM = 10000;    %���l�ƶq
T = 400;        %�ū�(K)
M = 0.004;      %���l���ս�q(kg)

%�]�w�U�������ߦ�m
xc=dV/2:dV:dV*ceil(V_MAX/dV)-dV/2; 

%Maxwell-Boltzmann distrbution function
m = M/N;        %��Ӥ��l��q(kg)
V = xc;
MBD = 4*pi*(m/(2*pi*k*T)).^(3/2) .* e.^(((-1)*m.*V.^2)/(2*k*T)) .* V.^2; 

%��U�Ӫ������͹������t�׼ƶq(�H��)
num = ceil(MBD/sum(MBD)*NUM);
NUM = sum(num);
a=1;
for i=1:ceil(V_MAX/dV)
    for j=1:num(i)
        data(a) = xc(i)-dV/2+dV*rand();
        a = a+1;
    end
end

%hist�^�Ǫ����ϼƾ�
[n, v] = hist(data, xc);

%histø��
hist(data, xc)
hold on

%plotø��
plot(V, MBD*(max(n)/max(MBD)), 'r')
xlabel('velocity(m/s)')
axis([0,V_MAX,0,inf])

%�t�v����(�z�׭�)
prb = sqrt(2*R*T/M);         
avg = sqrt((8*R*T)/(M*pi));  
rms = sqrt(3*R*T/M);         

%�p��t�v(�����)
prb1 = mean(v(find(n==max(n))));
avg1 = mean(data);
rms1 = sqrt(sum(data.^2)/NUM);