/*Exc: 1*/
homem(abrahamII). homem(clancy). homem(hebert). homem(homer). homem(bart).

mulher(mona). mulher(jacqueline). mulher(abbey). mulher(marge). mulher(selma).
mulher(patty). mulher(lisa). mulher(maggie). mulher(ling).

pai(abrahamII,hebert).  pai(clancy,marge).  pai(homer,bart).
pai(abrahamII,abbey).   pai(clancy,selma).  pai(homer,lisa).
pai(abrahamII,homer).   pai(clancy,patty).  pai(homer,maggie).

mae(mona,hebert).   mae(jacqueline,marge).  mae(marge,bart).    mae(selma,ling).
mae(mona,abbey).    mae(jacqueline,selma).  mae(marge,lisa).
mae(mona,homer).    mae(jacqueline,patty).  mae(marge,maggie).
/*

Exc: 2
?- pai(X,marge).
         
-----------------
?- pai(X,Y).
X = abrahamII,
Y = hebert ;
X = clancy,
Y = marge ;
X = homer,
Y = bart ;
X = abrahamII,
Y = abbey ;
X = clancy,
Y = selma ;
X = homer,
Y = lisa ;
X = abrahamII,
Y = homer ;
X = clancy,
Y = patty ;
X = homer,
Y = maggie.
------------------
?- mae(Y,lisa), pai(X,Y).
Y = marge,
X = clancy.
*/

/*
Exc: 3
?- mae(mona,Y), pai(Y,X).
Y = homer,
X = bart ;
Y = homer,
X = lisa ;
Y = homer,
X = maggie.
---------------------------
?- pai(X,maggie), pai(X,bart).
X = homer
*/

/* Exc: 4*/

/* regra avô e avó paterno e materno*/
avos(X,Y) :-
    pai(Z,Y),
    pai(X,Z).

avos(X,Y) :-
    pai(Z,Y),
    mae(X,Z).

avos(X,Y) :-
    mae(W,Y),
    pai(X,W).

avos(X,Y) :-
    mae(W,Y),
    mae(X,W).

/* regra filho e filha*/
filho(Y,X) :-
    pai(X,Y),
    homem(Y).
    
filho(Y,X) :-
    mae(X,Y),
    homem(Y).

filha(Y,X) :-
    pai(X,Y),
    mulher(Y).

filha(Y,X) :-
    mae(X,Y),
    mulher(Y).

/*regra irmão, irmã e irmãos*/
irmao(Y,X) :-
    pai(Z,Y),
    pai(Z,X),
    Y \= X,
    homem(Y).

irma(Y,X) :-
    pai(Z,Y),
    pai(Z,X),
    Y \= X,
    mulher(Y).

irmaos(X,Y) :-
    pai(Z,X),
    pai(Z,Y),
    X \= Y.
   
/*regra tio e tia paterno e materno*/
tio(X,Y) :-
    pai(Z,Y),
    irmao(X,Z).

tio(X,Y) :-
    mae(Z,Y),
    irmao(X,Z).

tia(X,Y) :-
    pai(Z,Y),
    irma(X,Z).

tia(X,Y) :-
    mae(Z,Y),
    irma(X,Z).
/* regra primo, prima*/
primo(X,Y) :-
    pai(Z,Y),
    pai(W,X),
    irmaos(W,Z),
    homem(X).

primo(X,Y) :-
    mae(Z,Y),
    mae(W,X),
    irmaos(W,Z),
    homem(X).

prima(X,Y) :-
    pai(Z,Y),
    pai(W,X),
    irmaos(W,Z),
    mulher(X).

prima(X,Y) :-
    mae(Z,Y),
    mae(W,X),
    irmaos(W,Z),
    mulher(X).
/*--------------------*/
:- dynamic feiticeiro/1.
elfo_domestico(dobby).
bruxo(hermione).
bruxo('McGonagall').
bruxo(rita_skeeter).
magico(X):- elfo_domestico(X).
magico(X):- feiticeiro(X).
magico(X):- bruxo(X).

/* Exc: 5
?- magico(elfo_domestico).
false.*/

/*Exc: 6
?- feiticeiro(harry).
false.*/

/*Exc: 7
?- magico(feiticeiro).
false.*/

/* Exc: 8
?- magico('McGonagall').
true.*/

/*Exc: 9
?- magico(Hermione).
Hermione = dobby ;
Hermione = hermione ;
Hermione = 'McGonagall' ;
Hermione = rita_skeeter.
***ÁRVORE DE BUSCA EM ANEXO***
*/
palavra(artigo,uma).
palavra(artigo,qualquer). 
palavra(nome,pessoa).
palavra(nome,'sopa de legumes').
palavra(verbo,come).
palavra(verbo,adora).
sentenca(Palavra1,Palavra2,Palavra3,Palavra4,Palavra5) :-
palavra(artigo,Palavra1),
palavra(nome,Palavra2),
palavra(verbo,Palavra3),
palavra(artigo,Palavra4),
palavra(nome,Palavra5).

/*Exc: 10*/
% sentenca(X,Y,Z,X1,Y1).

/*Exc: 11
São 32 instânciações diferentes:
?- sentenca(X,Y,Z,X1,Y1).
X = X1, X1 = uma,
Y = Y1, Y1 = pessoa,
Z = come ;
X = X1, X1 = uma,
Y = pessoa,
Z = come,
Y1 = 'sopa de legumes' ;
X = uma,
Y = Y1, Y1 = pessoa,
Z = come,
X1 = qualquer ;
X = uma,
Y = pessoa,
Z = come,
X1 = qualquer,
Y1 = 'sopa de legumes' ;
X = X1, X1 = uma,
Y = Y1, Y1 = pessoa,
Z = adora ;
X = X1, X1 = uma,
Y = pessoa,
Z = adora,
Y1 = 'sopa de legumes' ;
X = uma,
Y = Y1, Y1 = pessoa,
Z = adora,
X1 = qualquer ;
X = uma,
Y = pessoa,
Z = adora,
X1 = qualquer,
Y1 = 'sopa de legumes' ;
X = X1, X1 = uma,
Y = 'sopa de legumes',
Z = come,
Y1 = pessoa ;
X = X1, X1 = uma,
Y = Y1, Y1 = 'sopa de legumes',
Z = come ;
X = uma,
Y = 'sopa de legumes',
Z = come,
X1 = qualquer,
Y1 = pessoa ;
X = uma,
Y = Y1, Y1 = 'sopa de legumes',
Z = come,
X1 = qualquer ;
X = X1, X1 = uma,
Y = 'sopa de legumes',
Z = adora,
Y1 = pessoa ;
X = X1, X1 = uma,
Y = Y1, Y1 = 'sopa de legumes',
Z = adora ;
X = uma,
Y = 'sopa de legumes',
Z = adora,
X1 = qualquer,
Y1 = pessoa ;
X = uma,
Y = Y1, Y1 = 'sopa de legumes',
Z = adora,
X1 = qualquer ;
X = qualquer,
Y = Y1, Y1 = pessoa,
Z = come,
X1 = uma ;
X = qualquer,
Y = pessoa,
Z = come,
X1 = uma,
Y1 = 'sopa de legumes' ;
X = X1, X1 = qualquer,
Y = Y1, Y1 = pessoa,
Z = come ;
X = X1, X1 = qualquer,
Y = pessoa,
Z = come,
Y1 = 'sopa de legumes' ;
X = qualquer,
Y = Y1, Y1 = pessoa,
Z = adora,
X1 = uma ;
X = qualquer,
Y = pessoa,
Z = adora,
X1 = uma,
Y1 = 'sopa de legumes' ;
X = X1, X1 = qualquer,
Y = Y1, Y1 = pessoa,
Z = adora ;
X = X1, X1 = qualquer,
Y = pessoa,
Z = adora,
Y1 = 'sopa de legumes' ;
X = qualquer,
Y = 'sopa de legumes',
Z = come,
X1 = uma,
Y1 = pessoa ;
X = qualquer,
Y = Y1, Y1 = 'sopa de legumes',
Z = come,
X1 = uma ;
X = X1, X1 = qualquer,
Y = 'sopa de legumes',
Z = come,
Y1 = pessoa ;
X = X1, X1 = qualquer,
Y = Y1, Y1 = 'sopa de legumes',
Z = come ;
X = qualquer,
Y = 'sopa de legumes',
Z = adora,
X1 = uma,
Y1 = pessoa ;
X = qualquer,
Y = Y1, Y1 = 'sopa de legumes',
Z = adora,
X1 = uma ;
X = X1, X1 = qualquer,
Y = 'sopa de legumes',
Z = adora,
Y1 = pessoa ;
X = X1, X1 = qualquer,
Y = Y1, Y1 = 'sopa de legumes',
Z = adora.
*/

aluno(paulo,poo).
aluno(pedro,poo).
aluno(maria,pl).
aluno(rui,pl).
aluno(manuel,pl).
aluno(pedro,pl).
aluno(rui,ed1).
estuda(paulo).
estuda(maria).
estuda(manuel).
cursapl/X:-
    aluno(X,pl), estuda(X).
/* Exc: 12
?- listing(aluno(X,Y)).
aluno(paulo, poo).
aluno(pedro, poo).
aluno(maria, pl).
aluno(rui, pl).
aluno(manuel, pl).
aluno(pedro, pl).
aluno(rui, ed1).

true.
*/
/*Exc: 13
?- aluno(paulo,pl).
false.
*/

/*exc: 14
?- aluno(rui,poo).
false.
*/
/* Exc: 15
?- aluno(paulo,ed1), aluno(maria,ed1).
false.
*/

/* Exc: 16
?- aluno(X,pl).
X = maria ;
X = rui ;
X = manuel ;
X = pedro.
*/

/*Exc: 17
?- aluno(rui,X).
X = pl ;
X = ed1.
*/

/*Exc: 18
?- aluno(maria,pl).
true.
*/
/* Exc: 19
?- aluno(X,pl), estuda(X).
X = maria ;
X = manuel ;
false.
Permite que eu veja quais são os alunos de pl e quais deles estudam.
*/
/*Exc: 20
?- cursapl/X.
X = maria ;
X = manuel ;
false.
*/
