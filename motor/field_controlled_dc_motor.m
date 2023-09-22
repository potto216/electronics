clear;
close('all');
motor_constant_N_m_Per_A = 50e-3; % motor constant Km
rotor_inertia_N_m_s2_Per_rad = 1e-3; %rotor intertia J
friction=0.01; % the friction of the rotor, b


field_time_constant_s = 1/1000;  %rho_f
rotor_time_constant_s = 100/1000; %rho

field_winding_resistance_ohm = 10;
field_winding_inductance_H=field_time_constant_s * field_winding_resistance_ohm;

% what are typical field winding resistances for dc motors?
% The field winding resistance of a DC motor is the resistance of the wire used to wind the field coil of the motor. The field winding resistance determines the amount of current that flows through the field coil and, in turn, the strength of the magnetic field produced by the coil.
% 
% The field winding resistance of a DC motor can vary widely depending on the size and type of the motor, as well as the material and gauge of the wire used for the winding. In general, field winding resistances for DC motors are typically in the range of a few ohms to a few hundred ohms.
% 
% For example, a small DC motor might have a field winding resistance of around 10 ohms, while a larger DC motor might have a field winding resistance of 100 ohms or more. It is important to note that the field winding resistance is typically not a fixed value, as it can change slightly due to factors such as temperature, humidity, and age.
% 
% To determine the field winding resistance of a specific DC motor, you can measure the resistance of the field coil using a multimeter or other suitable test instrument. It is generally recommended to measure the resistance when the motor is cold, as the resistance can increase when the motor is hot due to the temperature-dependent resistance of the wire.


num1 = motor_constant_N_m_Per_A/(friction*field_winding_resistance_ohm);
% den1 = [(2*field_time_constant_s*rotor_time_constant_s) (field_time_constant_s + rotor_time_constant_s) (1) (0)];
den1 = [(2*field_time_constant_s*rotor_time_constant_s) (field_time_constant_s + rotor_time_constant_s) (1)];
sys1=tf(num1,den1)
p=pole(sys1)
z=zero(sys1)

%%
figure;
pzmap(sys1)

%%
figure;
bode(sys1)

%%
figure; 
step(sys1);