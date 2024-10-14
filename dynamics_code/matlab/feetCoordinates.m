function P_feet = feetCoordinates(com, l, n, spoke_ang, slope_ang, ang)
P_feet = zeros(n, 2);

for i = 1:n
    aalloo = i*spoke_ang;
    psi = pi - ((i - 1)*spoke_ang - (ang + slope_ang));

    P_feet(i, :) = com + l*[-sin(psi), cos(psi)];
end

end