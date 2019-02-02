:- initialization(consult('pharmacy.pl'), now).
:- initialization(consult('pharmacyS.pl'), now).
:- initialization(test, main).



test :- write('Task 1: '),nl, pharmacy1_test,write('Task2: '),nl,pharmacy2_test,fail.

pharmacy1_test :- pharmacy_number_tests, pharmacy_adress_tests, price_medicine_tests, year_medicine_tests,
quantity_available_tests.
pharmacy2_test :- pharmacy_numberS_tests, pharmacy_adresseS_tests, price_medicineS_tests, year_medicineS_tests,
quantity_availableS_tests.
% Тестування першого завдання
pharmacy_number_tests :-
                         pharmacy_number_test('Spazmalgon'),
                         pharmacy_number_test('Diclofenak'),
                         pharmacy_number_test('Sorbi Norm'),
                         pharmacy_number_test('Amiksin IC'),
                         pharmacy_number_test('Duovit').

pharmacy_number_test(MEDICINE) :- pharmacy_number(NUMBER,MEDICINE),
                                  write(MEDICINE),
                                  write(' number of pharmacy: '),
                                  write(NUMBER), nl.

pharmacy_adress_tests :-
                        pharmacy_adress_test('Analgetics'),
                        pharmacy_adress_test('Sorbent'),
                        pharmacy_adress_test('Immunostimulants'),
                        pharmacy_adress_test('Polyvitamins').

pharmacy_adress_test(TYPE) :- pharmacy_adress(PHARMACY_ADRESS,TYPE),
                        write(TYPE),
                        write(' available on '),
                        write(PHARMACY_ADRESS), nl.

price_medicine_tests :-
                        price_medicine_test('Spazmalgon',3),
                        price_medicine_test('Diclofenak',1),
                        price_medicine_test('Sorbi Norm',2),
                        price_medicine_test('Amiksin IC',2),
                        price_medicine_test('Duovit',3).


price_medicine_test(MEDICINE,PHARMACY) :- price_medicine(MEDICINE, PRICE,PHARMACY),
                              write('In farmacy number '),
                              write(PHARMACY),
                              write(' price for '),
                              write(MEDICINE),
                              write(PRICE), nl.


year_medicine_tests :-
                      year_medicine_test('Spazmalgon'),
                      year_medicine_test('Diclofenak'),
                      year_medicine_test('Sorbi Norm'),
                      year_medicine_test('Amiksin IC'),
                      year_medicine_test('Duovit').

year_medicine_test(MEDICINE) :- year_medicine(MEDICINE,YEAR,PHARMACY_ID,PHARMACY_ADRESS),
                                write('Pharmacy number '),
                                write(PHARMACY_ID),
                                write(' on adress '),
                                write(PHARMACY_ADRESS),
                                write(' has expiration year of '),
                                write(YEAR),
                                write(' for '),
                                write(MEDICINE),nl.

quantity_available_tests:-
                          quantity_available_test('Spazmalgon',3),
                          quantity_available_test('Diclofenak',1),
                          quantity_available_test('Sorbi Norm',2),
                          quantity_available_test('Amiksin IC',2),
                          quantity_available_test('Duovit',3).

quantity_available_test(MEDICINE,PHARMACY):- quantity_available(MEDICINE,PHARMACY,QUANTITY),
                                              write('In a pharmacy number '),
                                              write(PHARMACY),
                                              write(' the quantity of '),
                                              write(MEDICINE),
                                              write(' equals to '),
                                              write(QUANTITY),nl.

% Тестування другого завдання
pharmacy_numberS_tests :-
                        pharmacy_numberS_test('Spazmalgon'),
                        pharmacy_numberS_test('Diclofenak'),
                        pharmacy_numberS_test('Sorbi Norm'),
                        pharmacy_numberS_test('Amiksin IC'),
                        pharmacy_numberS_test('Duovit').

pharmacy_numberS_test(MEDICINE) :- pharmacy_numberS(NUMBER, MEDICINE),
                                    write('The '),
                                    write(MEDICINE),
                                    write(' available in pharmacy with a number '),
                                    write(NUMBER),nl.
pharmacy_adresseS_tests :-
                        pharmacy_adresseS_test('Analgetics'),
                        pharmacy_adresseS_test('Sorbent'),
                        pharmacy_adresseS_test('Immunostimulants'),
                        pharmacy_adresseS_test('Polyvitamins').

pharmacy_adresseS_test(TYPE) :- pharmacy_adresseS(PHARMACY_ADRESS, TYPE),
                                write('The '),
                                write(TYPE),
                                write(' is available on '),
                                write(PHARMACY_ADRESS),nl.

price_medicineS_tests :-
                        price_medicineS_test('Spazmalgon',3),
                        price_medicineS_test('Diclofenak',1),
                        price_medicineS_test('Sorbi Norm',2),
                        price_medicineS_test('Amiksin IC',2),
                        price_medicineS_test('Duovit',3).


price_medicineS_test(MEDICINE,PHARMACY) :- price_medicineS(MEDICINE,PRICE,PHARMACY),
                                  write('In pharmacy number '),
                                  write(PHARMACY),
                                  write(' the price for '),
                                  write(MEDICINE),
                                  write(' is '),
                                  write(PRICE),nl.

year_medicineS_tests :-
                      year_medicineS_test('Spazmalgon'),
                      year_medicineS_test('Diclofenak'),
                      year_medicineS_test('Sorbi Norm'),
                      year_medicineS_test('Amiksin IC'),
                      year_medicineS_test('Duovit').

year_medicineS_test(MEDICINE) :- year_medicineS(MEDICINE,YEAR,PHARMACY_ID,PHARMACY_ADRESS),
                                write('In pharmacy number '),
                                write(PHARMACY_ID),
                                write(' on '),
                                write(PHARMACY_ADRESS),
                                write(' expiration date for '),
                                write(MEDICINE),
                                write(' is '),
                                write(YEAR),nl.
quantity_availableS_tests :-
                              quantity_availableS_test('Spazmalgon',3),
                              quantity_availableS_test('Diclofenak',1),
                              quantity_availableS_test('Sorbi Norm',2),
                              quantity_availableS_test('Amiksin IC',2),
                              quantity_availableS_test('Duovit',3).

quantity_availableS_test(MEDICINE,PHARMACY) :- quantity_availableS(MEDICINE,PHARMACY,QUANTITY),
                                                write('In pharmacy number '),
                                                write(PHARMACY),
                                                write(' available number of '),
                                                write(MEDICINE),
                                                write(' is '),
                                                write(QUANTITY),nl.

% price_less_tests :-
%                     price_less_test('Spazmalgon',30),
%                     price_less_test('Diclofenak',51),
%                     price_less_test('Sorbi Norm',16),
%                     price_less_test('Amiksin IC',51),
%                     price_less_test('Duovit',145).
% price_less_test(MEDICINE, PRICE) :- price_less(MEDICINE, PRICE,PRICE_MED, PHARMACY_ID),
%                                     write(PHARMACY_ID),
%                                     write(' has price of '),
%                                     write(PRICE_MED),
%                                     write(' less then '),
%                                     write(PRICE).
