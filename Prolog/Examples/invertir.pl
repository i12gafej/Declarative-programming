concatenar([],L,L).

concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

incluir_al_final(X,L,R):- concatenar(L,[X],R).

es_lista([]).

es_lista([_|Cola]):- es_lista(Cola).

invertir([],[]).

invertir([Cabeza|Cola],R):-
            es_lista(Cabeza),   
            invertir(Cabeza, InvCabeza),
			invertir(Cola,Cola1),
			incluir_al_final(InvCabeza,Cola1,R).

/*
    Primero, Es una lista?
    Segundo, invertir cabeza: [b, c]
        No es lista
        Invertir cola [c]
            No es una lista
            Invertir cola []
            []
        añadir al final la cabeza [  c]
    añadir al final la cabeza [  c b]
    Tercero, invertir cola:       
*/

invertir([Cabeza|Cola],R):-
            not(es_lista(Cabeza)),
			invertir(Cola,Cola1),
			incluir_al_final(Cabeza,Cola1,R).

pertenece(X,[X|_]).

pertenece(X,[Cabeza|_]):- 
    es_lista(Cabeza),
    pertenece(X,Cabeza).

pertenece(X,[_|Cola]):- pertenece(X,Cola).




/*
    [a, [b, c], d]
    buscamos b
    Primero, pertenece(b, a | _ ) Not true
    Entonces
        Pertenece(b, _ | [[b, c], d]) sigue por aqui
        Pertenece(b, [b, c] | _ )
            Es lista X: si  
                Pertenece X con X

*/

contar([], 0).
contar([Cabeza|Cola], R):-
    es_lista(Cabeza),
    contar(Cabeza, R1),
    contar(Cola, R2),
    R is R1 + R2 + 1.

contar([Cabeza|Cola], R):-
    not(es_lista(Cabeza)),
    contar(Cola, R1),
    R is R1 + 1.

/*
    [a,b,c]
    Tomo [_| [b , c]]
        R1 es R + 1
            contar([b,c],R1)
                R1 es R + 1
                contar([c], R1)
                    R1 es R + 1
                    contar([], 0)
                    R1 es 0 + 1
                

*/


/*
    Borrar elemento a
    Lista [b,a, c, d]
    Primero, Cabeza = a,no
        Cola: 
        Cabeza = a si
        Devolver Cola
    concatenar Cabeza y Cola devuelta
    
*/

% Caso base
borrar(_,[],[]).

borrar(X,[X],[]).

% El elemento es la cabeza
borrar(E, [E|Cuerpo], Cuerpo1) :-
    borrar(E, Cuerpo, Cuerpo1).

/*
% El elemento no es la cabeza
borrar(E, [Cabeza|Cuerpo], [Cabeza|Cuerpo1]):-
    not(E) == Cabeza,
    borrar(E, Cuerpo, L1),
    concatenar([Cabeza],L1, L).
*/

aplicarRaiz([X|[]],[R]):-
    R is sqrt(X).
    
aplicarRaiz([Cabeza|Cola],R):-
    aplicarRaiz(Cola,R1),
    Rc is sqrt(Cabeza),
    concatenar([Rc],R1,R).

/*
aplicarRaiz([X|[]],[R]):-
    R is sqrt(X).

aplicarRaiz([Cabeza|Cola],[Rc|Cola1]):-
    
    Rc is sqrt(Cabeza),
    aplicarRaiz(Cola, Cola1).
*/




/*
    Primer elemento es un atomo
        elementos de la cola
        concatenar cabeza con elementos de la cola
    Cabeza es lista:
        elementos de la cabeza
        elementos de la cola
        concatenar ambos
    Elementos de lista vacia es lista vaica
    Elemenrtos de lista de un solo atomo es lista de un solo atomo


*/

elementos([],[]).
elementos([X],[X]).
elementos([Cabeza|Cola],L):-
    not(es_lista(Cabeza)),
    elementos(Cola,L1),
    concatenar([Cabeza],L1, L).
elementos([Cabeza|Cola],L):-
    es_lista(Cabeza),
    elementos(Cabeza, L1),
    elementos(Cola, L2), 
    concatenar(L1,L2,L).