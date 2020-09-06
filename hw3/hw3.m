clear all;    colors='mrgbk';    T=2*pi;

x0=0;
for t=1:300
    sqr_x(t)=x0/100;
    if sin(2*pi*sqr_x(t)) >= 0
        sqr_y(t)=1;
    else
        sqr_y(t)=-1;
    end
    x0=x0+1;
end
figure(1)
plot(sqr_x, sqr_y)
title('方波')
xlabel('seconds')
axis([0,3,-1.5,1.5])

sqr_a0=sum(sqr_y)/300;
for i=1:5
   sqr_a(i)=sum(cos(i*T*sqr_x).*sqr_y)/150;
   sqr_b(i)=sum(sin(i*T*sqr_x).*sqr_y)/150;
end
s=sqr_a0;
for i=1:5
    s=s + sqr_a(i).*cos(i*T*sqr_x) + sqr_b(i).*sin(i*T*sqr_x);
    figure(2)
    plot(sqr_x, s, colors(i))
    hold on
    title('傅立葉展開1~5階(方波)')
    xlabel('seconds')
    axis([0,3,-1.5,1.5])
end

x0=0;    y0=1;   dy=0.04;
 for t=1:300
     tri_x(t)=x0/100;
     tri_y(t)=y0;
     if sin(2*pi*tri_x(t)) >= 0
         y0=y0-dy;
     else
         y0=y0+dy;
     end
     x0=x0+1;
 end
figure(3)
plot(tri_x,tri_y)
title('三角波')
xlabel('seconds')
axis([0,3,-1,1])

tri_a0=sum(tri_y)/300;
for i=1:5
   tri_a(i)=sum(cos(i*T*tri_x).*tri_y)/150;
   tri_b(i)=sum(sin(i*T*tri_x).*tri_y)/150;
end
s=tri_a0;
for i=1:5
    s=s + tri_a(i).*cos(i*T*tri_x) + tri_b(i).*sin(i*T*tri_x);
    figure(4)
    plot(tri_x, s, colors(i))
    hold on
    title('傅立葉展開1~5階(三角波)')
    xlabel('seconds')
    axis([0,3,-1,1])
end

x0=0;   y0=-1;
for i=1:300
    x(i)=x0/100;
    if rem(x0,100) <= 50
        y0=-1;    y(i)=y0;
    else
        y0=y0+0.04;    y(i)=y0;
    end
    x0=x0+1;
end
a0=sum(y)/300;
for i=1:5
   a(i)=sum(cos(i*T*x).*y)/150;
   b(i)=sum(sin(i*T*x).*y)/150;
end
s=a0;
for i=1:5
    s = s + a(i).*cos(i*T*x) + b(i).*sin(i*T*x);
    figure(5)
    plot(x, s, colors(i))
    hold on
    title('傅立葉展開1~5階')
    xlabel('seconds')
    axis([0,3,-1.5,1])
end