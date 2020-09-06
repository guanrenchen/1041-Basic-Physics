% �����W���@�u�ʱ`�Ƭ�1N/m�A�����10m���u®�s����q0.1kg������A���m12m�C
% a.�ХH�n�����ƭȤ�k(�p����)�����u®�B�ʪ��y��A�H�첾�q��ɶ��@�ϡA�õe�X��m��t�ץH�μu�O��઺�ܤơC
%   �H���`��q(�ʯ�Φ���`�M)���m���ܤơC
% ����:��t��0�A���O�@�ΤU�g�L�ɶ�dt�A�ھڤO�ǭp��o�@�������t�פΦ�m�����ܡA�åB�H�o�@�ӷs�����G�@���U�@���p�⪺��l����C
%      �p��L�{���첾�q���_���b�ܤơA�]���u�O�]���_�����ܡC
% b.�Y���鲾�ʮɨ��T�w���O0.1N�H��0.5N��V��ۤϩ�t�פ�V�A���G�S����?
% ����:�i�H���յۥΤ��P�����O�ոլݷ|�����򤣦P�����G�C
t(1) = 0;
dt = 0.01;
m = 0.1;
x0 = 10;
k = 1;
res = 0; %���O(N)

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
xlabel('�ɶ�(s)')
ylabel('�첾�q(m)')

figure 
plot(v, x, 'k:.')
grid on
xlabel('�t��(m/s)')
ylabel('��m(m)')

figure 
plot(eu, x, 'k:.')
grid on
xlabel('�u�O���(J)')
ylabel('��m(m)')

figure 
plot(x, e, 'k:.')
grid on
xlabel('��m(m)')
ylabel('�`��q(J)')
axis equal