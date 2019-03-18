fill(-1):-!.
fill(X):-asserta(d(X)), X1 is X-1, fill(X1).

female(agnes).
female(agnes).
female(idit).
female(margo).
female(lussi).
female(sally).
female(holly).
female(gulia).
female(dori).
female(dayni).
female(matulda).
female(hortenzia).
female(depla).

married(mcqueen, sally).
married(gry, lussi).
married(mater, holly).
married(ramone, flo).
married(mayk, selia).

parents(margo, gry).
parents(idit,gry).
parents(agnes,lussi).
parents(gry,gulia).
parents(dru, gulia).
parents(gulia, ghost).
parents(nafario, ghost).
parents(lussi, baltazar).
parents(rom, baltazar).
parents(kevin,rom ).
parents(idit,rom ).
parents(sally, ramon ).
parents(ramon, doluvay).
parents(luidgy, doluvay).
parents(gvido,luidgy).
parents(mcqueen, doc).
parents(sally, flo).
parents(carera, flo).
parents(holly,carera).
parents(dori, sally).
parents(mac, sally).
parents(donald, dak).
parents(dayni, dak).
parents(matulda, dayni).
parents(donald, hortenzia).
parents(depla,hortenzia).
parents(huey, matulda).
parents(dewey, matulda).
parents(louie, matulda).
parents(mayk, wazowski).
parents(selia, vantuz).
parents(wazowski, chak).
parents(duck, chak).

male(X):- (parents(X,D); married(X,H); parents(M,X)), \+ female(X).
father(X):- parents(Y,X), \+ female(X).
daughter(X):- parents(X,Y), female(X).
sister(X) :- parents(Z,F), parents(X,F), not(male(X)), X \= Z.
granny(X) :- parents(_,F), parents(F,X), not(male(X)).
uncle(X) :- parents(_,Y), parents(Y,Z), parents(X,Z), X\=Y, not(female(X)).
brotherInLaw(X):- parents(Y,Z), parents(U,Z),U\=Y,married(X,Y).
motherInLaw(X,Y):- married(Y,I), parents(I,X), female(X).
match(X,Y) :- married(O,I), parents(O,X), parents(I,Y), male(X). 
nephew(X) :- parents(Y,Z), parents(U,Z), Y\=U, parents(X,Y).


task21(TWO, THREE):- d(T), T\=0, d(W), W\=T, d(O), O\=W, O\=T, d(H), H\=T, H\=O, H\=W, d(R), R\=T, R\=W, R\=O, R\=H, d(E), E\=T, E\=W, E\=O, E\=H, E\=R,
TWO is 100*T + 10*W + O,
THREE is 10000*T + 1000*H + 100*R + 10*E + E,
THREE is TWO * TWO.

task22(SEVEN, SIX, TWENTY):- d(S), d(E), E\=S, d(V), V\=S, V\=E, d(N), N\=S, N\=E, N\=V, d(I), I\=S, I\=E, I\=V, I\=N, d(X), X\=S, X\=E, X\=V, X\=N, X\=I, d(T), T\=S, T\=E, T\=V, T\=N, T\=I, T\=X, d(W), W\=S, W\=E, W\=V, W\=N, W\=I, W\=X, W\=T, d(Y), Y\=S, Y\=E, Y\=V, Y\=N, Y\=I, Y\=X, Y\=T, Y\=W,
SEVEN is 10000*S + 1000*E + 100*V + 10*E + N,
SIX is 100*S + 10*I + X,
TWENTY is 100000*T + 10000*W + 1000*E + 100*N + 10*T +Y,
TWENTY is SEVEN + SEVEN + SIX.



student(vasya, group(group1, group_name(informatics, fi, NaUkma))).
student(vas, group(group2, group_name(informatics, fi, NaUkm))).
student(va, group(group3, group_name(informatics, fi, NaUka))).
student(vasa, group(group4, group_name(informatics, fi, NUkma))).
student(vsya, group(group5, group_name(informatics, fi, Nakma))).

teacher(valya, work(lecturer, math, fi), lesson(ml, group1, 20)).
teacher(val, work(lecturer, math, fi), lesson(ml, group2, 40)).
teacher(valy, work(lecturer, math, fi), lesson(ml, group3, 70)).
teacher(va, work(lecturer, math, fi), lesson(ml, group5, 90)).
teacher(vak, work(lecturer, math, fi), lesson(ml, group4, 50)).

lecturer(Y,X):- teacher(X, _, lesson(_, K, _)), student(Y, group(K, _)).

workplace(Y,X):- teacher(Y, work(_, _, H), lesson(_, K, _)), student(_, group(K, group_name(_, H, X))).

hours(Y,X):- student(Y, group(K, _)), teacher(_, _, lesson(_, K, X)).

dec1(X,Y):-s(0,T1),dd(X,0,T1,Y).
dd(X,Y,Z,Y):-X=Z,!.
dd(X,Y,Z,V):-s(Y,Y1),s(Z,Z1),dd(X,Y1,Z1,V).

s(X,Y):-Y is X+1.

summa(X,0,X):-!.
summa(X,Y,Z):-s(X,X1),dec1(Y,Y1),summa(X1,Y1,Z).

minus(X,Y,0):-X=<Y,!.
minus(X,Y,Z):-mn(X,Y,0,Z).
mn(X,Y,Z,Z):-summa(Y,Z,X1),X1=X,!.
mn(X,Y,Z,V):-s(Z,Z1),mn(X,Y,Z1,V).

pow(X,Y,Y1):- Y1 is Y-X.
step(X,Y,Y1):- Y1 is Y**X.


task11(X):-count(tickets(_),X).

count(P,Count) :- findall(_,P,L),
                  length(L,Count).   

tickets(X) :- d(A),d(B),d(C),d(D),d(E),d(F),
             X is A*100000 + B*10000 + C*1000 + D*100 + E*10 + F, 
                 ABC is (A + B + C),
                 DEF is (D + E + F), 
                 ABC is 10,
                 DEF is 10.

task12(X):- count(coins(_),X).     

coins(X) :- d(A), d(B), d(C),  A<21,  B<11,  C<5,
               X is A*5 + B*10 + C*25, 
               X is 100.

