function mR = campoM(dist, int)
    %Obtiene el módulo del campo magnético
    %dist = Distancia entre polos (m)
    %int = Intensidad de la corriente (Amperes)
    
    %Distancia e Intensidad del campo
    
    x_i = [0,-dist];
    y_i = [0,0];
    N = 40;
    
    %Creamos un campo vectorial limpio
    x_grid = linspace(-dist-N, N, N);
    y_grid = linspace(N, N, N);
    [X,Y] = meshgrid(x_grid, y_grid);
    
    mRS = sqrt((X-x_i(1)).^2 + (Y-y_i(1).^2));
    mRN = sqrt((X-x_i(2)).^2 + (Y-y_i(2).^2));
    
    %M��dulo R
    mR = mean(sqrt(mRS.^2 + mRN.^2),"all");
    
end