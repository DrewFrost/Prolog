:- initialization(consult('hw2.pl'), now).
:- initialization(hw2_test, main).


hw2_test :- write('All tests'), nl, remainder_tests, exponential_tests, exponential_log_tests, fib_tests,
    fib_itr_tests, prime_factor_tests, sequence_tests, fail.

remainder_tests :- remainder_test(17,2),
                    remainder_test(8,3),
                    remainder_test(10,4),
                    remainder_test(13,5).

remainder_test(FirstNumber, SecondNumber) :- d(FirstNumber,SecondNumber,Result, Remainder),
                                            write('The result of division of '),
                                            write(FirstNumber),
                                            write(' and '),
                                            write(SecondNumber),
                                            write(' is '),
                                            write(Result),
                                            write(' the remainder is '),
                                            write(Remainder),
                                            nl.
exponential_tests:- exponential_test(2,4),
                    exponential_test(3,5),
                    exponential_test(6,2),
                    exponential_test(3,3).

exponential_test(Number, Grade):- e(Number, Grade, Result),
                                 write(Number),
                                 write(' in grade '),
                                 write(Grade),
                                 write(' equals '),
                                 write(Result),
                                 nl.
                                 

exponential_log_tests:- exponential_log_test(8,2),
                        exponential_log_test(5,3),
                        exponential_log_test(3,4),
                        exponential_log_test(5,2).
                

exponential_log_test(Number, Grade):- el(Number,Grade,Result),
                                        write(Number),
                                        write(' in grade '),
                                        write(Grade),
                                        write(' equals '),
                                        write(Result),
                                        write(' (logarithmic)'),
                                        nl.

fib_tests:- fib_test(20),
            fib_test(2),
            fib_test(4),
            fib_test(6).

fib_test(Sequence):- fib(Sequence,N1,N2),
                     write('For sequence '),
                     write(Sequence),
                     write(' Fibonacii number is '),
                     write(N1),
                     write(' previous element is '),
                     write(N2),
                     nl.

fib_itr_tests:- fib_itr_test(10),
                fib_itr_test(20),
                fib_itr_test(4),
                fib_itr_test(5).


fib_itr_test(Sequence):-  fib_itr(Sequence,Result),
                            write('For sequence '),
                            write(Sequence),
                            write(' Fibonacii number is '),
                            write(Result),
                            write(' (iteration) '),
                            nl.

prime_factor_tests:- prime_factor_test(12),
                     prime_factor_test(20),
                     prime_factor_test(24),
                     prime_factor_test(16).

prime_factor_test(Number):- prime_factor(Number, Operands),
                            write('For number '),
                            write(Number),
                            write(' operands are'),
                            write(Operands),
                            nl.


sequence_tests:- sequence_test(5), 
                 sequence_test(6), 
                 sequence_test(3),
                 sequence_test(10).

sequence_test(Sequence):- sequence(Sequence, Result),
                            write('For sequence '),
                            write(Sequence),
                            write(' Result of 1/1 ... 1/n! sum is '),
                            write(Result),
                            nl.