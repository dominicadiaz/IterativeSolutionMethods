clc
clear all
close all


%% print the sums so that you can make sure the integrals (sum) are approximately zero

A = load('A_matrix.txt');

phi1 = load('step11141_GS_phi_data.txt');
phi2 = load('step21097_PJ_phi_data.txt');
phi3 = load('step286_SOR_phi_data.txt');
phi4 = load('step28_MG_phi_data.txt');
phi5 = load('step109_CG_phi_data.txt');

phi1 = phi1/64/64;
phi2 = phi2/64/64;
phi3 = phi3/64/64;
phi4 = phi4/64/64;
phi5 = phi5/64/64;

sum1 = sum(phi1,'all');
sum2 = sum(phi2,'all');
sum3 = sum(phi3,'all');
sum4 = sum(phi4,'all');
sum5 = sum(phi5,'all');





%% print the errors of the methods as a function of the number of steps
error_CG = load('step109_CG_error_data.txt');
error_PJ = load('step21097_PJ_error_data.txt');
error_SOR = load('step286_SOR_error_data.txt');
error_GS = load('step11141_GS_error_data.txt');
error_MG = load('step28_MG_error_data.txt');


figure 
semilogx(error_MG);
xlabel('log(k)')
ylabel('infinity norm of error at step k')
set(gca, 'FontSize', 12)
legend({'Multigrid method'}, 'Location', 'southwest')


figure 
semilogx(error_CG)
xlabel('log(k)')
ylabel('infinity norm of error at step k')
set(gca, 'FontSize', 12)
legend({'Conjugate gradient method'}, 'Location', 'southwest')

figure 
semilogx(error_PJ);
hold on
semilogx(error_GS);
semilogx(error_SOR);
xlabel('log(k)')
ylabel('infinity norm of error at step k')
set(gca, 'FontSize', 12)
legend({'Point Jacobi method', 'Gauss-Seidel', 'Successive over-relaxation (\omega = 1.94)'}, 'Location', 'northeast')
hold off





%% plot the solution (they're all about the same but with small constant offset)

phi1 = load('step109_CG_phi_data.txt');
phi2 = load('step11141_GS_phi_data.txt');
phi3 = load('step21097_PJ_phi_data.txt');
phi4 = load('step286_SOR_phi_data.txt');
phi5 = load('step28_MG_phi_data.txt');



[X,Y] = meshgrid(0:1/63:1);

figure
surf(X,Y,phi1)
hold on 
surf(X,Y,phi4)
set(gca, 'FontSize', 11)
xticks([0 0.2 0.4 0.6 0.8 1])
yticks([0 0.2 0.4 0.6 0.8 1])
colormap jet
colorbar
hold off
