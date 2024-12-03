/*
Te dejaré de querer cuando un pintor sordo pinte el sonido
de una hoja cayendo al suelo de un castillo de cristal que no existe

minuscula: literales
Mayuscula: variables
*/


construido_de(castillo, cristal).
pintar(pintor, sonido(hoja, cayendo)).
puedeOir(pintor, nO).
caer(hoja, suelo(castillo)).
existir(castillo, nO).

dejar_de_querer(javier, alicia) :- 
    pintar(pintor, sonido(hoja, cayendo)), 
    puedeOir(pintor, nO),
    caer(hoja, suelo(castillo)), 
    existir(castillo, nO).
