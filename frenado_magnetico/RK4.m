function RK4(mR, R, h_i, m, h)   
    %.: Gráfica de desaceleración por frenado magnético :.
    %mR = Módulo del campo magnético
    %R = Resistencia
    %h_i = Altura de caída
    %m = Masa
    %h = Número de iteraciones
    %-----------------------------------------
    %Antonio Jaime L�pez [A01424138]
    %Denisse Regina Garcia Rivera[A01424207]
    %Manuel Camacho Padilla [A01423135]
    %-----------------------------------------
   
    a = 0;
    b = 10;
    %Permitividad en el vacío
    u_0 = (4*pi)*(10^(-7));
    %Gravedad
    g = 9.81;
    
    %Ecuación diferencial de frenado magnético según la 
    % Segunda Ley de Newton (Diferenciado respecto a t)
    %funcion = @(t,h_i) ((-m*g-(9*(u_0)^2*mR^4)/(4*R)*(h_i^2)/((h_i^2)+(mR^2))^3)/m)*t;
    funcion = @(t,h_i) ((-m*g-(9*(u_0)^2*mR^4)/(4*R)*(h_i^2)/(h_i^2+mR^2)^3)/m)*t;
    
    for t=a:h:b
        %solucion de k1
        k1=h*funcion(t,h_i);
        %solucion de k2
        k2=h*funcion(t+h/2, h_i*k1/2);
        %solucion de k3
        k3=h*funcion(t+h/2, h_i*k2/2);
        %solucion de k4
        k4=h*funcion(t+h,h_i+k3);
        
        %Grafica
        %t
        %h_i
        plot(t,h_i,'bo','LineWidth',1.3);
        %plot(as,as*h)
        hold on;
        %Actualizacion de h_i    
        h_i=h_i+(1/6)*(k1+(2*k2)+(2*k3)+k4);
        
    end
    title('Solucion de ecua dif por el metodo Runge-Kutta 4');
    xlabel('tiempo (t)');
    ylabel('altura (h)');
end
