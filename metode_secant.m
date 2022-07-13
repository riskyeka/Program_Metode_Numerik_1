clc
clear
x(1) = input('Masukkan taksiran akar pertama: ');
x(2) = input('Masukkan taksiran akar kedua: ');
N = input('Masukkan iterasi maksimum: ');
e = input('Masukkan toleransi error: ');

f = inline('x.^2+10*cos(x)');
y(1) = f(x(1));
y(2) = f(x(2));

for i=2:N+1 
    kurang1 = x(i)-x(i-1);
    kurang2 = y(i)-y(i-1);
    kali = y(i)*(kurang1/kurang2);
    x(i+1) = x(i)-kali;
    y(i+1) = f(x(i+1));
    mutlak = abs(y(i));
    fprintf('Nilai akar x(%d) = %f\n', i-1, x(i))
    fprintf('Nilai akar y(%d) = %f\n', i-1, y(i))
    if mutlak<e
        break
    end
end

fprintf('Error = %f\n', mutlak)
fprintf('Jumlah iterasi = %f\n', i-1)
        
x = -5:0.01:5;
y = x.^2+10*cos(x);
panj1 = length(x);
ynol = zeros(1,panj1);
panj2 = length(y);
xnol = zeros(1,panj2);
plot(x,y,'m',x,ynol,'b',xnol,y,'b')
