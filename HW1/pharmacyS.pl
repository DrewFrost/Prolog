% availables(pharmacys(Номер аптеки, адреса,номер телефону), medicines(Назва препарату,фармакологічна група),кількість,ціна,рік придатності).
availables(pharmacys(1,'Konstantinivska 21','0676314534'),medicines('Spazmalgon','Analgetics'),170,30,2023).
availables(pharmacys(1,'Konstantinivska 21','0676314534'),medicines('Diclofenak','Analgetics'),150,50,2024).
availables(pharmacys(1,'Konstantinivska 21','0676314534'),medicines('Sorbi Norm','Sorbent'),180,15,2023).

availables(pharmacys(2,'Dmitrivska 13','0445693596'),medicines('Sorbi Norm','Sorbent'),250,16,2024).
availables(pharmacys(2,'Dmitrivska 13','0445693596'),medicines('Amiksin IC','Immunostimulants'),120,50,2023).

availables(pharmacys(3,'Bagovutivska 8/10','88005553535'),medicines('Duovit','Polyvitamins'),100,140,2021).
availables(pharmacys(3,'Bagovutivska 8/10','88005553535'),medicines('Spazmalgon','Analgetics'),160,29,2022).
availables(pharmacys(3,'Bagovutivska 8/10','88005553535'),medicines('Sorbi Norm','Sorbent'),230,17,2023).

% Номер телефону аптеки з потрібними ліками
pharmacy_numberS(NUMBER, MEDICINE_NAME) :- availables(pharmacys(_,_,NUMBER),medicines(MEDICINE_NAME,_),_,_,_).
% Адреса аптеки з потрібним за групою препаратом
pharmacy_adresseS(PHARMACY_ADRESS, MEDICINE_TYPE) :- availables(pharmacys(_,PHARMACY_ADRESS,_), medicines(_,MEDICINE_TYPE),_,_,_).
% Ціна за певний препарат у певній аптеці
price_medicineS(MEDICINE_NAME,PRICE,PHARMACY_ID) :- availables(pharmacys(PHARMACY_ID,_,_),medicines(MEDICINE_NAME,_),_,PRICE,_).
% Рік придатності первного препарату й вивід номеру аптеки й адреси
year_medicineS(MEDICINE_NAME,YEAR,PHARMACY_ID,PHARMACY_ADRESS) :- availables(pharmacys(PHARMACY_ID,PHARMACY_ADRESS,_),
                                                                  medicines(MEDICINE_NAME,_),_,_,YEAR).
% Кількість певного препарату у певній аптеці
quantity_availableS(MEDICINE_NAME,PHARMACY_ID,QUANTITY) :- availables(pharmacys(PHARMACY_ID,_,_),
                                                            medicines(MEDICINE_NAME,_),QUANTITY,_,_).
