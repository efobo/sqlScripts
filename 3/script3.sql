--1
SELECT Н_ЛЮДИ.ФАМИЛИЯ, Н_СЕССИЯ.УЧГОД
FROM Н_ЛЮДИ
         INNER JOIN Н_СЕССИЯ ON Н_ЛЮДИ.ИД = Н_СЕССИЯ.ЧЛВК_ИД
WHERE ( Н_ЛЮДИ.ИМЯ = 'Владимир' AND Н_СЕССИЯ.ЧЛВК_ИД < 105948 AND Н_СЕССИЯ.ЧЛВК_ИД < 151200);


--1 indexes
CREATE INDEX ON "Н_ЛЮДИ" USING HASH ("ИД");
CREATE INDEX ON "Н_ЛЮДИ" USING BTREE ("ОТЧЕСТВО");
CREATE INDEX ON "Н_СЕССИЯ" USING BTREE ("УЧГОД");
CREATE INDEX ON "Н_СЕССИЯ" USING BTREE ("ЧЛВК_ИД");



--2
SELECT Н_ЛЮДИ.ИД, Н_ОБУЧЕНИЯ.НЗК, Н_УЧЕНИКИ.НАЧАЛО
FROM Н_ЛЮДИ
         INNER JOIN Н_ОБУЧЕНИЯ ON Н_ЛЮДИ.ИД = Н_ОБУЧЕНИЯ.ЧЛВК_ИД
         INNER JOIN Н_УЧЕНИКИ ON Н_ЛЮДИ.ИД = Н_УЧЕНИКИ.ЧЛВК_ИД
WHERE (Н_ЛЮДИ.ОТЧЕСТВО > 'Георгиевич' AND  Н_ОБУЧЕНИЯ.ЧЛВК_ИД = 105590);

--2 indexes
CREATE INDEX "Н_ЛЮДИ" USING HASH ("ИД");
CREATE INDEX "Н_ЛЮДИ" USING BTREE ("ОТЧЕСТВО");
CREATE INDEX "Н_ОБУЧЕНИЯ" USING BTREE ("ЧЛВК_ИД");
