clc
clear
xl = input('Masukkan nilai batas bawah: ');
xu = input('Masukkan nilai batas atas: ');
N = input('Masukkan iterasi maksimum: ');
e = input('Masukkan toleransi error: ');

f = inline('1+x*exp(-1)');
fl = f(xl);
fu = f(xu);
kali = fl*fu;

while kali>0
    fprintf('Tidak ada akar antara %f dan %f\n', xl, xu);
    xl = input('Masukkan nilai batas bawah: ');
    xu = input('Masukkan nilai batas atas: ');
    fl = f(xl);
    fu = f(xu);
    kali = fl*fu;
end

for i=1:N
    add = xl+xu;
    xr = add/2;
    fr = f(xr);
    mutlak = abs(fr);
    cek = fl*fr;
    if mutlak<=e
        break
    else
        if cek<0
            xu = xr;
            fu = f(xu);
        else
            xl = xr;
            fl = f(xl);
        end
    end
end

fprintf('Akarnya: %f\n', xr);
fprintf('Error: %f\n', mutlak);
fprintf('Jumlah iterasi: %f\n', i);

x = -10:0.01:10;
y = x.^3-5*x+10;
panj1 = length(x);
ynol = zeros(1,panj1);
panj2 = length(y);
xnol = zeros(1,panj2);
plot(x,y,'m',x,ynol,'b',xnol,y,'b')

