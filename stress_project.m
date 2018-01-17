%define constants

Ey=200e9; %young's modulus
v=0.25; %possion's ratio
sig_yield=200e6; %yield strength
P=1; % load per mr^2. choosing 1 hee since we are trying to get sig_e/P at
% the end. Using P=1 simplify the step of deviding every element of sig_e by
% P

x_max=8; %canvas size 8 meters deep
y_max=4; %canvas size 4 meters in both +y and -y directions

%%
a = 1;
plane_strain = 0;
figure();

[sig_e, X, Y, sig_max, x_peak, y_peak]=shao_func_sig_e(a,x_max,y_max, plane_strain, P, v);
contour(Y,X,sig_e);
set(gca, 'YDir','reverse');
colormap spring;
hold on;
x_steps = length(X);
y_steps = length(Y);
for  i= 1:x_steps
     for j= 1:y_steps 
         if sig_e(i,j)== sig_max
             x=x_max/x_steps*(i-1);
             y=-y_max+2*y_max/y_steps*(j-1);
             plot(y,x,'r*');
         end
     end
end

hold off;

figure();
h_surface=surf(sig_e);
y_peak
x_peak
sig_max_over_P0 = sig_max/P
max_load_per_sq_m = sig_yield/sig_max_over_P0
p_over_sig_yield = max_load_per_sq_m/sig_yield
max_load_per_m = 2*a*max_load_per_sq_m



%%
a = 2;
plane_strain = 0;
figure();

[sig_e, X, Y, sig_max, x_peak, y_peak]=shao_func_sig_e(a,x_max,y_max, plane_strain, P, v);
contour(Y,X,sig_e);
set(gca, 'YDir','reverse');
colormap spring;
hold on;
x_steps = length(X);
y_steps = length(Y);
for  i= 1:x_steps
     for j= 1:y_steps 
         if sig_e(i,j)== sig_max
             x=x_max/x_steps*(i-1);
             y=-y_max+2*y_max/y_steps*(j-1);
             plot(y,x,'r*');
         end
     end
end

hold off;

figure();
surf(sig_e);
y_peak
x_peak
sig_max_over_P0 = sig_max/P
max_load_per_sq_m = sig_yield/sig_max_over_P0
p_over_sig_yield = max_load_per_sq_m/sig_yield
max_load_per_m = 2*a*max_load_per_sq_m


%%
a = 1;
plane_strain = 1;
figure(3);

[sig_e, X, Y, sig_max, x_peak, y_peak]=shao_func_sig_e(a,x_max,y_max, plane_strain, P, v);
contour(Y,X,sig_e);
set(gca, 'YDir','reverse');
colormap spring;
hold on;
x_steps = length(X);
y_steps = length(Y);
for  i= 1:x_steps
     for j= 1:y_steps 
         if sig_e(i,j)== sig_max
             x=x_max/x_steps*(i-1);
             y=-y_max+2*y_max/y_steps*(j-1);
             plot(y,x,'r*');
         end
     end
end

hold off;

figure();
surf(sig_e);
y_peak
x_peak
sig_max_over_P0 = sig_max/P
max_load_per_sq_m = sig_yield/sig_max_over_P0
p_over_sig_yield = max_load_per_sq_m/sig_yield
max_load_per_m = 2*a*max_load_per_sq_m



