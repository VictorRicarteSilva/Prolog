/*Exc: 1
a)*/
sobre(base,mesa).
sobre(elefante,base).
sobre(novelo,elefante).
sobre(sorvete,novelo).
sobre(maca,sorvete).
sobre(hipopotamo1,maca).
sobre(hipopotamo2,hipopotamo1).
sobre(cupcake,hipopotamo2).
sobre(caneca,mesa).
sobre(lapis,vidro).
sobre(vidro,mesa).

% b)

acima(X,Y):-
    sobre(X,Y).
acima(X,Z):-
    sobre(X,Y),
    acima(Y,Z).

% c)

/*
?- acima(cupcake,mesa).
true .*/

% d)

/*
?- acima(lapis,mesa).
true .
*/

% e)
/*
?- acima(X,novelo).
X = sorvete ;
X = maca ;
X = hipopotamo1 ;
X = hipopotamo2 ;
X = cupcake ;
false.
*/

% f)

/*
?- acima(X,caneca).
false.
*/

% g)

abaixo(X,Y):-
    sobre(Y,X).
abaixo(X,Z):-
    sobre(Z,Y),
    abaixo(X,Y).

% h)
/*
?- abaixo(X,cupcake).
X = hipopotamo2 ;
X = hipopotamo1 ;
X = maca ;
X = sorvete ;
X = novelo ;
X = elefante ;
X = base ;
X = mesa ;
false.
*/

% i)
/*
?- abaixo(X,lapis).
X = vidro ;
X = mesa ;
*/

% Exc: 2
% a)
proximo_posto(soldado,taifeiro).
proximo_posto(taifeiro,cabo).
proximo_posto(cabo,terceiro_sargento).
proximo_posto(terceiro_sargento,segundo_sargento).
proximo_posto(segundo_sargento,primeiro_sargento).
proximo_posto(primeiro_sargento,subtenente).
proximo_posto(subtenente,aspirante).
proximo_posto(aspirante,segundo_tenente).
proximo_posto(segundo_tenente,primeiro_tenente).
proximo_posto(primeiro_tenente,capitao).
proximo_posto(capitao,major).
proximo_posto(major,tenente_coronel).
proximo_posto(tenente_coronel,coronel).
proximo_posto(coronel,general_de_brigada).
proximo_posto(general_de_brigada,general_de_divisao).
proximo_posto(general_de_divisao,general_de_exercito).
proximo_posto(general_de_exercito,marechal).

% b)

militar(zero,soldado).
militar(platao,soldado).
militar(dentinho,soldado).
militar(cosme,soldado).
militar(roque,soldado).
militar(quindim,soldado).
militar(blips,soldado).
militar(ky,cabo).
militar(cuca,terceiro_sargento).
militar(tainha,segundo_sargento).
militar(louise_lorota,primeiro_sargento).
militar(escovinha,segundo_tenente).
militar(mironga,primeiro_tenente).
militar(durindana,capitao).
militar(peroba,major).
militar(amos_dureza,general_de_exercito).

% c)

menor_patente(X,Y):-
    proximo_posto(X,Y).
menor_patente(X,Z):-
    proximo_posto(X,Y),
    menor_patente(Y,Z).

% d)

maior_patente(X,Y):-
    proximo_posto(Y,X).
maior_patente(X,Z):-
    proximo_posto(Y,X),
    menor_patente(Y,Z).

% e)

subordinado(X,Y):-
    militar(X,Z),
    militar(Y,Z1),
    menor_patente(Z,Z1).

% f)
/*
?- subordinado(zero,tainha).
true .
*/

% g)
/*
?- subordinado(mironga,X).
X = durindana ;
X = peroba ;
X = amos_dureza ;
false.
*/
% Exc: 3
conectado(1,2).
conectado(3,4).
conectado(5,6).
conectado(7,8).
conectado(9,10).
conectado(12,13).
conectado(13,14).
conectado(15,16).
conectado(17,18).
conectado(19,20).
conectado(4,1).
conectado(6,3).
conectado(4,7).
conectado(6,11).
conectado(14,9).
conectado(11,15).
conectado(16,12).
conectado(14,17).
conectado(16,19).

caminho(X,Y):-
    conectado(X,Y).
caminho(X,Z):-
    conectado(X,Y),
    caminho(Y,Z).
    
/*
?- caminho(5,10).
true .

?- caminho(1,X).
X = 2 ;
false.

?- caminho(13,X).
X = 14 ;
X = 9 ;
X = 17 ;
X = 10 ;
X = 18 ;
false.
*/

% Exc: 4

deCarro(auckland,hamilton).
deCarro(hamilton,raglan).
deCarro(valmont,saarbruecken).
deCarro(valmont,metz).

deTrem(metz,frankfurt).
deTrem(saarbruecken,frankfurt).
deTrem(metz,paris).
deTrem(saarbruecken,paris).

deAviao(frankfurt,bangkok).
deAviao(frankfurt,singapore).
deAviao(paris,losAngeles).
deAviao(bangkok,auckland).
deAviao(losAngeles,auckland).

/*viagem(X,Y):-
    deCarro(X,Y);
    deTrem(X,Y);
    deAviao(X,Y).
viagem(X,Z):-
    deCarro(X,Y),
    viagem(Y,Z).
viagem(X,Z):-
    deTrem(X,Y),
    viagem(Y,Z).
viagem(X,Z):-
    deAviao(X,Y),
    viagem(Y,Z).
    */
    
/*
ᨀ?- viagem(valmont,raglan).
true .
*/

% Exc: 5

/*viagem(X,Y,vai(X,Y)):-
    deCarro(X,Y);
    deTrem(X,Y);
    deAviao(X,Y).
viagem(X,Y,vai(X,Z,C)):-
    (deCarro(X,Z);
    deTrem(X,Z);
    deAviao(X,Z)),
    viagem(Z,Y,C).

?- viagem(valmont,paris,X).
X = vai(valmont, saarbruecken, vai(saarbruecken, paris)) ;
X = vai(valmont, metz, vai(metz, paris)) ;
false.
*/

% Exc: 6

viagem(X,Y,vai(X,deCarro,Y)):-
    deCarro(X,Y).
viagem(X,Y,vai(deTrem,Y)):-
    deTrem(X,Y).
viagem(X,Y,vai(deAviao,Y)):-
    deAviao(X,Y).
viagem(X,Y,vai(X,deCarro,Z,C)):-
    deCarro(X,Z),
    viagem(Z,Y,C).
viagem(X,Y,vai(X,deTrem,Z,C)):-
    deTrem(X,Z),
    viagem(Z,Y,C).
viagem(X,Y,vai(X,deAviao,Z,C)):-
    deAviao(X,Z),
    viagem(Z,Y,C).
    /*
?- viagem(valmont,paris,X).
X = vai(valmont, deCarro, saarbruecken, vai(deTrem, paris)) ;
X = vai(valmont, deCarro, metz, vai(deTrem, paris)) ;
false.
    */