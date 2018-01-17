% this function take the following arguments to calculate sig_e, yield
% queterian:
% a load side_length in y axis a (expanding in both + y and negative y axis)
% x_size(depth) of the canvas
% y_size(width) of the canvas
% bool sig_z to turn sig_z off (plane stress)or on(plane strain) 
% P = load per m^2
% v = possion ratio
function [sig_e, X, Y, sig_max, x_peak, y_peak] = myFunction(a, x_max, y_max,bool_sig_z, P, v)
    h_lower=-a;
    h_upper= a; 
    sigma_x= @(x,y,h) -2*P/pi*(atan((h - y)/x)/2 + (x*(h - y))/(2*(x^2 + (h - y)^2)));
    sigma_y= @(x,y,h) -2*P/pi*((atan((h - y)/x)/2 - (x*(h - y))/(2*(x^2 + (h - y)^2))));
    tau_xy= @(x,y,h) -2*P./pi*(x^2/(2*(x^2 + (h - y)^2)));
    sigma_e= @(sig_x,sig_y,sig_z,t_xy)(0.5*(sig_x-sig_y).^2+0.5*(sig_y-sig_z).^2+0.5*(sig_z-sig_x).^2+3*(t_xy).^2).^(0.5);


    x_peak=0;
    y_peak=0;
    sig_e= [0; 0];
    X=[];
    Y=[];
    sig_max= 0;
    % 

    steps=100;
    for i= 1:steps

        for j= 1:steps 
            x=x_max/steps*(i-1);
            y=-y_max+2*y_max/steps*(j-1);
            X(i)=x;
            Y(j)=y;
            sig_x =sigma_x(x,y,h_upper)-sigma_x(x,y,h_lower);
            sig_y =sigma_y(x,y,h_upper)-sigma_y(x,y,h_lower);
            sig_z=bool_sig_z*v*(sig_x+sig_y);
            t_xy =tau_xy(x,y,h_upper)-tau_xy(x,y,h_lower);
            sig_e(i,j)=sigma_e(sig_x,sig_y,sig_z,t_xy);
            if abs(sig_e(i,j)) > sig_max
                sig_max = sig_e(i,j);
                x_peak=x;
                y_peak=y;
            end

        end
    end 

end
