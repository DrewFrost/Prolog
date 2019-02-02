% Номер аптеки, адреса, телефонний номер
pharmacy(1,'Konstantinivska 21','0676314534').
pharmacy(2,'Dmitrivska 13','0445693596').
pharmacy(3,'Bagovutivska 8/10','88005553535').
% Номер препарату, назва, фармакологічна група
medicine(1,'Spazmalgon','Analgetics').
medicine(2,'Diclofenak','Analgetics').
medicine(3,'Sorbi Norm','Sorbent').
medicine(4,'Amiksin IC','Immunostimulants').
medicine(5,'Duovit','Polyvitamins').
% Номер аптеки, номер препарату, кількість, ціна за одиницю, рік придатності.
available(1,1,170,30,2023).
available(1,2,150,50,2024).
available(1,3,180,15,2023).
available(2,3,250,16,2024).
available(2,4,120,50,2023).
available(3,5,100,140,2021).
available(3,1,160,29,2022).
available(3,3,230,17,2023).
% Номер телефону аптеки з потрібними ліками
pharmacy_number(NUMBER, MEDICINE_NAME) :- available(PHARMACY_ID,MEDICINE_ID,_,_,_),
                                    pharmacy(PHARMACY_ID,_,NUMBER),
                                    medicine(MEDICINE_ID,MEDICINE_NAME,_).
% Адреса аптеки з потрібним за групою препаратом
pharmacy_adress(PHARMACY_ADRESS, MEDICINE_TYPE) :- available(PHARMACY_ID,MEDICINE_ID,_,_,_),
                                              pharmacy(PHARMACY_ID,PHARMACY_ADRESS,_),
                                              medicine(MEDICINE_ID,_,MEDICINE_TYPE).
% Ціна за певний препарат у певній аптеці
price_medicine(MEDICINE_NAME,PRICE,PHARMACY_ID) :- medicine(MEDICINE_ID,MEDICINE_NAME,_),
                                                 available(PHARMACY_ID,MEDICINE_ID,_,PRICE,_),
                                                 pharmacy(PHARMACY_ID,_,_).
% Рік придатності первного препарату й вивід номеру аптеки й адреси
year_medicine(MEDICINE_NAME,YEAR,PHARMACY_ID,PHARMACY_ADRESS) :- medicine(MEDICINE_ID,MEDICINE_NAME,_),
                                                              available(PHARMACY_ID, MEDICINE_ID,_,_,YEAR),
                                                              pharmacy(PHARMACY_ID,PHARMACY_ADRESS,_).
% Кількість певного препарату у певній аптеці
quantity_available(MEDICINE_NAME,PHARMACY_ID, QUANTITY) :- medicine(MEDICINE_ID, MEDICINE_NAME,_),
                                                            available(PHARMACY_ID,MEDICINE_ID,QUANTITY,_,_),
                                                            pharmacy(PHARMACY_ID,_,_).



% price_less(MEDICINE_NAME,PRICE_SET<PRICE_MED,PHARMACY_ID), PRICE_MED < PRICE_SET :-
%                                                             medicine(MEDICINE_ID,MEDICINE_NAME,_),
%                                                             available(PHARMACY_ID, MEDICINE_ID,_,PRICE_MED,_),
%                                                             pharmacy(PHARMACY_ID,_,_);
%                                                             write('There is no cheaper price for that').
