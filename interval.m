% clear all
% close all
% 
% A = [3987.511528862847,  9.046471e+2, 3987.51; 
%      85206.30568948119, 1.091938e+3, 85206.3;
%      0, 1.097987e+3, 8.39584e+08];
%  
% b = [4; 6; 10];
% 
% semilogy(b, A(:,1), '-or')
% hold on
% semilogy(b, A(:,2), '-Dk')
% hold on
% semilogy(b, A(:,3), '-Sb')
% xlabel('M')
% ylabel('upper bound for interval')
% legend('Daisy', 'FPTaylor', 'Gappa')

clear all
close all


M = 8;
theta_1 = 0.6;
theta_2 = 0.5;

for i = 1: M-1
    A(i,i) = -2 - 2 * (theta_1 * i)/ M;
end

for i = 1 : M-2
    A(i, i+1) = 1 + (theta_1 * (i+0.5))/M;
end

for i = 2: M-1
    A(i, i-1) = 1 + (theta_1 * (i-0.5))/M;
end

alpha(1) = A(1,1);
for i = 2: M-1
    beta(i) = A(i,i-1) / alpha(i-1);
    alpha(i) = A(i,i) - beta(i) * A(i-1, i);
end

f = -50 * theta_2 * theta_2;
y(1) = f;
for i = 2: M-1
    y(i) = f - beta(i) * y(i-1);
end

u(M-1) = y(M-1)/alpha(M-1);
for i = M-2 : -1 : 1
   u(i) = y(i)/alpha(i) - A(i,i+1) * (u(i+1) / alpha(i));
end

p = 0.0;
for i = 1: M-1
    p = p + u(i)/M;
end

display(p)
