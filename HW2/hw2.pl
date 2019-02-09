
% Ділення з остачею
d(Number, Grade, Result, Remainder) :-
        Number >= 0, Grade > 0, d(Number, Grade, 0, Result, Remainder), !.

d(Number, Grade, Result, Result, Remainder) :-
        Number < Grade, Remainder = Number, !.

d(Number, Grade, Result0, Result, Remainder) :-
    Number1 is Number - Grade, Result1 is Result0 + 1, d(Number1, Grade, Result1, Result,Remainder).


% Піднесення до степеню
e(_,Grade,Result) :- Grade=0, Result=1,!.

e(Number,Grade,Result):-  G is Grade-1,
                        e(Number, G, Result1), 
                        Result is Number*Result1.

% Логарифмічне піднесення до степеню
el(_,Grade,Result):- Grade=0, Result=1, !.

el(Number,Grade,Result):- 
    Grade mod 2 =:= 1, 
    Number1 is Number*Number,
    Grade1 is Grade>>1,
    el(Number1,Grade1,Result1),
    Result is Number*Result1,
    !.

el(Number,Grade,Result):- 
    Number1 = Number*Number,
    Grade1 is Grade>>1,
    el(Number1,Grade1,Result1),
    Result is Result1,
    !.

% Числа Фібоначі
fib(Serial,Neig1,Neig2):- Serial=1,Neig1=1,Neig2=0.

fib(Serial,Neig1,Neig2):-
    Serial > 0,
    Serial1 is Serial-1,
    fib(Serial1,Neig11,Neig21),
    Neig2 is Neig11,
    Neig1 is Neig11 + Neig21.

% Числа Фібоначі Ітеративна
fib2(Seq,Res,Seq,Res,_) :- !.

fib2(Seq,Res,X,Y,Z) :-
    X1 is X+1,
    Y1 is Y+Z,
    Z1 is Y,
    fib2(Seq,Res,X1,Y1,Z1).

fib_itr(Seq,Res) :-
    fib2(Seq,Res,1,1,0).

% Розклад числа на прості множники
prime_factor( Num, Res):-factor(Num, Res).
factor( Num, Res):-(
    Num < 2 -> Res = [],
    0 is Num rem 2 -> Res = [X|Res1], Num1 is Num div 2, 
    factor(Num1, Res1);
    prime_factor( Num, 2, Res)).
prime_factor(Num, X, Res):-( 
    Num < 2 -> Res = []; 
    X*X > Num -> Res = [Num]; 
    0 is Num rem X -> Res = [X|Res1], Num1 is Num div X, prime_factor( Num1, X, Res1);
    X1 is X+2, prime_factor( Num, X1, Res)).


% Обрахувати сумму за допомогою рекурентних співвідношень
sequence(1,1):-!.
sequence(Seq,Res):-
    factorial(Seq,Res,1,0,1),!.

factorial(Seq, Res, Seq, X, Y):-Res is X+(1/(Y*Seq)),!.
factorial(Seq, Res, Z, X, Y):-
    Z < Seq,
    Z1 is Z+1,
    Y1 is Y*Z,
    X1 is X+(1/Y1),
    factorial(Seq, Res, Z1, X1, Y1),!.


        




   

