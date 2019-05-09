:- initialization(test).

% 1
task1(RES) :- task1Logic(100,[],RES1), RES = RES1.

task1Logic(1000,LISTRES,RES) :- RES = LISTRES, !.
task1Logic(N,LISTRES,RES) :- number_codes(N,X1), maplist(plus(48),Y1,X1), 
                                 nth0(0,Y1,First), divisible(First,2), 
                                 nth0(1,Y1,Second), divisible(Second,2), 
                                 nth0(2,Y1,Third), divisible(Third,2),
                                 number_chars(N,X2),format('~s',[X2]), 
                                 nth0(0,X2,FirstChar), nth0(2,X2,ThirdChar), 
                                 atom_concat(FirstChar, ThirdChar, FinalAtom), 
                                 atom_number(FinalAtom, FinalAtomNum), 
                                 divisible(N,FinalAtomNum),
                                 append(LISTRES, [N], Z), N1 is N+1, 
                                 task1Logic(N1, Z, RES).
task1Logic(N,LISTRES,RES) :- N1 is N+1, task1Logic(N1, LISTRES, RES).

% 2

task2(RES) :- task2Logic(1000,RES1), RES is RES1.

task2Logic(10000,RES) :- RES is -1, !.
task2Logic(N,RES) :- number_codes(N,X1), 
                        maplist(plus(48),Y1,X1),
                        nth0(0,Y1,First), 
                        nth0(1,Y1,Second), 
                        First =:= Second, 
                        nth0(2,Y1,Third), 
                        nth0(3,Y1,Fourth), 
                        Third =:= Fourth,
                        Z is round(sqrt(N)), 
                        Z*Z =:= N, RES is N.
task2Logic(N,RES) :- N1 is N+1, task2Logic(N1,RES).


divisible(Y,X) :-
    Y mod X =:= 0.
prime(2) :- true,!.
prime(X) :- X < 2,!,false.
prime(X) :- not(divisible(X, 2)).

task3(RES) :- task3Logic(1998,0,RES1), RES is RES1.
task3Logic(0,TOTAL,RES) :- RES is TOTAL, !.
task3Logic(N,TOTAL,RES) :- not(divisible(N, 6)), 
                            not(divisible(N, 10)), 
                            not(divisible(N, 15)), 
                            N1 is N-1, 
                            TOTAL1 is TOTAL+1, 
                            task3Logic(N1,TOTAL1,RES).
task3Logic(N,TOTAL,RES) :- N1 is N-1, 
                            task3Logic(N1,TOTAL,RES).

% 4

task4(RES) :- task4Logic(1,RES1), RES is RES1.

task4Logic(N,RES):- pow(N,2,R), pow((N+1),2,R1), pow((N+2),2,R2), pow((N+3),2,R3), pow((N+4),2,R4), pow((N+5),2,R5), pow((N+6),2,R6), pow((N+7),2,R7), pow((N+8),2,R8), pow((N+9),2,R9), pow((N+10),2,R10), X is R + R1 + R2 + R3 + R4 + R5 + R6 + R7 + R8 + R9 + R10, Z is round(sqrt(X)), Z*Z =:= X, RES is X.
task4Logic(N,RES):-N1 is N+1, task4Logic(N1,RES).

%5

task5(RES):- task5Logic(1,9,9,8,0,RES1), RES is RES1.

last(X,[X]).
last(X, [_|L]) :- last(X, L).

task5Logic(1,9,9,8,P,RES1):- P > 0, RES1 is P, !.
task5Logic(N1,N2,N3,N4,P,RES1):- P1 is P+1, N is (N1 + N2 + N3 + N4), 
                                    number_codes(N,X1), 
                                    maplist(plus(48),Y1,X1), 
                                    last(NNEW,Y1), 
                                    task5Logic(N2,N3,N4,NNEW,P1,RES1).
% print(Y1),


% Test function (main).
test :- task1(RESNUMS), write('\n\nTask1: ' ), write(RESNUMS), nl,
		task2(RESNUM), write('Task2: ' ), tab(1), write(RESNUM), nl,
		task3(RESDIVS), write('Task3: ' ), tab(1), write(RESDIVS), nl,
		task4(RESM), write('Task4: ' ), tab(1), write(RESM), nl,
		task5(RESPERIOD), write('Task5: ' ), tab(1), write(RESPERIOD), nl.