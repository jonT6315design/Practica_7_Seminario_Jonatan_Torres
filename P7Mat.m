Ra = 2; Kt = 0.01; b = 0.0012; 
La = 0.023; Ke = 0.01; J = 0.001;

Va = 5; 

motor_dc = @(t, x) [
    x(2);
    (Kt/J)*x(3) - (b/J)*x(2);
    (1/La)*Va - (Ra/La)*x(3) - (Ke/La)*x(2)
    ];

x0 = [0; 0; 0];
tspan = [0 5]; 

[t, x] = ode45(motor_dc, tspan, x0);

figure;
subplot(2,1,1); plot(t, x(:,2), 'LineWidth', 1.5);
title('Velocidad Angular (\omega_m)'); xlabel('Tiempo (s)'); ylabel('rad/s');
subplot(2,1,2); plot(t, x(:,3), 'r', 'LineWidth', 1.5);
title('Corriente de Armadura (i_a)'); xlabel('Tiempo (s)'); ylabel('A');