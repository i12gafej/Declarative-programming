
sumar_complejos(complejo(R1,I1),complejo(R2,I2), complejo(R3,I3)) :- 
R3 is R1 + R2, I3 is I1 + I2.

restar_complejos(complejo(R1,I1),complejo(R2,I2), complejo(R3,I3)) :- 
R3 is R1 - R2, I3 is I1 - I2.

multiplicar_complejos(complejo(R1,I1),complejo(R2,I2), complejo(R3,I3)) :- 
R3 is R1*R2 - I1*I2, I3 is R1*I2 + R2*I1.

dividir_complejos(complejo(R1,I1),complejo(R2,I2), complejo(R3,I3)) :-
 R3 is (R1*R2 + I1*I2)/(R2*R2+I2*I2),I3 is (I1*R2-R1*I2)/(R2*R2+I2*I2).