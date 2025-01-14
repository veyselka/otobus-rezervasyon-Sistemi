CREATE TABLE Yolcular (
    YolcuID INT IDENTITY(1,1) PRIMARY KEY ,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Eposta NVARCHAR(100) UNIQUE NOT NULL,
    Sifre NVARCHAR(255) NOT NULL,
    Telefon NVARCHAR(10),
    Adres NVARCHAR(255),
    Cinsiyet NVARCHAR(10)
);

CREATE TABLE Otobusler (
    OtobusID INT PRIMARY KEY IDENTITY(1,1),
    PlakaNo NVARCHAR(9) UNIQUE NOT NULL,
    Kapasite INT NOT NULL,
    OtobusTuru NVARCHAR(10),
    Model smallint,
    Ozellikler NVARCHAR(100)
);


CREATE TABLE Sehirler (
    SehirID INT PRIMARY KEY IDENTITY(1,1),
    SehirAdi NVARCHAR(15) NOT NULL
    
);


CREATE TABLE Otogarlar (
    OtogarID INT PRIMARY KEY IDENTITY(1,1),
    SehirID INT NOT NULL,
    OtogarAdi NVARCHAR(60) NOT NULL,
    FOREIGN KEY (SehirID) REFERENCES Sehirler(SehirID)
);



CREATE TABLE Seferler (
    SeferID INT PRIMARY KEY IDENTITY(1,1),
    OtobusID INT NOT NULL,
    KalkisOtogarID INT NOT NULL,
    VarisOtogarID INT NOT NULL,
    Kalkis_Tarihi DATETIME NOT NULL,
    Varis_Tarihi DATETIME NOT NULL,
    Fiyat DECIMAL(7, 2) NOT NULL,
    Durum NVARCHAR(20),
    FOREIGN KEY (OtobusID) REFERENCES Otobusler(OtobusID),
    FOREIGN KEY (KalkisOtogarID) REFERENCES Otogarlar(OtogarID),
    FOREIGN KEY (VarisOtogarID) REFERENCES Otogarlar(OtogarID)
);

CREATE TABLE Rezervasyonlar (
    Rez_ID INT PRIMARY KEY IDENTITY(1,1),
    SeferID INT NOT NULL,
    YolcuID INT NOT NULL,
    KoltukNo INT NOT NULL,
    Rez_Tarihi DATETIME NOT NULL,
    YolculukTuru NVARCHAR(20),
    Durum NVARCHAR(20),
    FOREIGN KEY (SeferID) REFERENCES Seferler(SeferID),
    FOREIGN KEY (YolcuID) REFERENCES Yolcular(YolcuID)
);

CREATE TABLE Odemeler (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),
    Rez_ID INT NOT NULL UNIQUE,
    Od_Tarihi DATETIME NOT NULL,
    Od_Yontemi NVARCHAR(20),
    Durum NVARCHAR(20),
    FOREIGN KEY (Rez_ID) REFERENCES Rezervasyonlar(Rez_ID)
);


CREATE TABLE Bildirimler (
    BildirimID INT PRIMARY KEY IDENTITY(1,1),
    YolcuID INT NOT NULL,
    SeferID INT NOT NULL,
    Baslik NVARCHAR(50) NOT NULL,
    MesajIcerigi NVARCHAR(MAX),
    Okundu BIT NOT NULL DEFAULT 0,
    BildirimTuru NVARCHAR(30),
    FOREIGN KEY (YolcuID) REFERENCES Yolcular(YolcuID),
    FOREIGN KEY (SeferID) REFERENCES Seferler(SeferID)
);


CREATE TABLE Sikayetler (
    SikayetID INT PRIMARY KEY IDENTITY(1,1),
    YolcuID INT NOT NULL,
    SeferID INT NOT NULL,
    Konu NVARCHAR(100) NOT NULL,
    Aciklama NVARCHAR(MAX),
    Tarih DATETIME NOT NULL,
    Durum NVARCHAR(20),
    FOREIGN KEY (YolcuID) REFERENCES Yolcular(YolcuID),
    FOREIGN KEY (SeferID) REFERENCES Seferler(SeferID)
);

CREATE TABLE Soforler (
    SoforID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(30) NOT NULL,
    Soyad NVARCHAR(30) NOT NULL,
    Telefon NVARCHAR(10),
    EhliyetNo NVARCHAR(15) UNIQUE NOT NULL,
    CalismaDurumu NVARCHAR(20),
    DeneyimYili smallint
);


CREATE TABLE Operatorler (
    OperatorID INT PRIMARY KEY IDENTITY(1,1),
    OtogarID INT NOT NULL,
    Ad NVARCHAR(30) NOT NULL,
    Soyad NVARCHAR(30) NOT NULL,
    Telefon NVARCHAR(10),
    CalismaDurumu NVARCHAR(20),
    FOREIGN KEY (OtogarID) REFERENCES Otogarlar(OtogarID)
);

CREATE TABLE GecisNoktalari (
    GecisID INT PRIMARY KEY IDENTITY(1,1),
    SeferID INT NOT NULL,
    SehirID INT NOT NULL,
    GecisSirasi INT NOT NULL,
    Kalkis_Saati DATETIME,
    Varis_Saati DATETIME,
    FOREIGN KEY (SeferID) REFERENCES Seferler(SeferID),
    FOREIGN KEY (SehirID) REFERENCES Sehirler(SehirID)
);


insert into Yolcular(Ad,Soyad,Eposta,Sifre,Telefon,Adres,Cinsiyet) values
('Muhammed','Karaca','muhammed12@gmail.com','Muhammed12a','5314285466','Istanbul','Erkek'),
('Ahmet','Yilmaz','ahmetyilmaz@gmail.com','Ahmet1234','5321122334','Ankara','Erkek'),
('Ayse','Demir','aysedemir@gmail.com','Ayse1234','5342233445','Izmir','Kadin'),
('Mehmet','Celik','mehmetcelik@gmail.com','Mehmet1234','5313344556','Antalya','Erkek'),
('Fatma','Kaya','fatmakaya@gmail.com','Fatma1234','5374455667','Adana','Kadin'),
('Ali','Sahin','alisahin@gmail.com','Ali1234','5305566778','Bursa','Erkek'),
('Zeynep','Yildirim','zeynepyildirim@gmail.com','Zeynep1234','5326677889','Samsun','Kadin'),
('Hasan','Kilic','hasankilic@gmail.com','Hasan1234','5347788990','Trabzon','Erkek'),
('Elif','Aydin','elifaydin@gmail.com','Elif1234','5318899001','Diyarbakir','Kadin'),
('Osman','Aslan','osmanaslan@gmail.com','Osman1234','5379900112','Gaziantep','Erkek'),
('Merve','Bozkurt','mervebozkurt@gmail.com','Merve1234','5300111223','Kocaeli','Kadin'),
('Huseyin','Dogan','huseyindogan@gmail.com','Huseyin1234','5321222334','Eskisehir','Erkek'),
('Rabia','Cetin','rabiacetin@gmail.com','Rabia1234','5342333445','Denizli','Kadin'),
('Mustafa','Eren','mustafaeren@gmail.com','Mustafa1234','5313444556','Konya','Erkek'),
('Emine','Polat','eminepolat@gmail.com','Emine1234','5374555667','Malatya','Kadin'),
('Kerem','Yuksel','keremyuksel@gmail.com','Kerem1234','5305666778','Erzurum','Erkek'),
('Beyza','Gunes','beyzagunes@gmail.com','Beyza1234','5326777889','Hatay','Kadin'),
('Murat','Tekin','murattekin@gmail.com','Murat1234','5347888990','Mersin','Erkek'),
('Havva','Simsek','havasimsek@gmail.com','Havva1234','5318999001','Aydin','Kadin'),
('Cem','Aksoy','cemaksoy@gmail.com','Cem1234','5379900112','Balikesir','Erkek'),
('Sena','Yalcin','senayalcin@gmail.com','Sena1234','5300111223','Tekirdag','Kadin'),
('Ferhat','Basar','ferhatbasar@gmail.com','Ferhat1234','5321222334','Ordu','Erkek'),
('Hulya','Ersoy','hulyaersoy@gmail.com','Hulya1234','5342333445','Mugla','Kadin'),
('Yusuf','Tas','yusuftas@gmail.com','Yusuf1234','5313444556','Adiyaman','Erkek'),
('Sibel','Koc','sibelkoc@gmail.com','Sibel1234','5374555667','Van','Kadin'),
('Burak','Sezer','buraksezer@gmail.com','Burak1234','5305666778','Kutahya','Erkek'),
('Melike','Cakir','melikecakir@gmail.com','Melike1234','5326777889','Canakkale','Kadin'),
('Halil','Altun','halilaltun@gmail.com','Halil1234','5347888990','Bolu','Erkek'),
('Gizem','Yavuz','gizemyavuz@gmail.com','Gizem1234','5318999001','Sivas','Kadin'),
('Kemal','Ozkan','kemalozkan@gmail.com','Kemal1234','5379900112','Kayseri','Erkek'),
('Cansu','Isik','cansuisik@gmail.com','Cansu1234','5300111223','Afyonkarahisar','Kadin'),
('Selim','Turkmen','selimturkmen@gmail.com','Selim1234','5321222334','Nevsehir','Erkek'),
('Nur','Ozturk','nurozturk@gmail.com','Nur1234','5342333445','Sanliurfa','Kadin'),
('Efe','Kurt','efekurt@gmail.com','Efe1234','5313444556','Aksaray','Erkek'),
('Asli','Demirtas','aslidemirtas@gmail.com','Asli1234','5374555667','Isparta','Kadin'),
('Serkan','Kara','serkankara@gmail.com','Serkan1234','5305666778','Karaman','Erkek'),
('Duygu','Ekinci','duyguekinci@gmail.com','Duygu1234','5326777889','Bilecik','Kadin'),
('Furkan','Tan','furkantan@gmail.com','Furkan1234','5347888990','Bayburt','Erkek'),
('Pelin','Korkmaz','pelinkorkmaz@gmail.com','Pelin1234','5318999001','Bartin','Kadin'),
('Ozan','Uzun','ozanuzun@gmail.com','Ozan1234','5379900112','Artvin','Erkek'),
('Gamze','Yucel','gamzeyucel@gmail.com','Gamze1234','5300111223','Giresun','Kadin'),
('Can','Gokce','cangokce@gmail.com','Can1234','5321222334','Kars','Erkek'),
('Derya','Eroglu','deryaeroglu@gmail.com','Derya1234','5342333445','Nigde','Kadin'),
('Ahmet','Erkin','ahmeterkin@gmail.com','Ahmet1234','5313444556','Yalova','Erkek'),
('Nisa','Sari','nisasari@gmail.com','Nisa1234','5374555667','Corum','Kadin'),
('Erdem','Bulut','erdembulut@gmail.com','Erdem1234','5305666778','Tunceli','Erkek'),
('Hilal','Kaplan','hilalkaplan@gmail.com','Hilal1234','5326777889','Kirklareli','Kadin'),
('Kaan','Demirci','kaandemirci@gmail.com','Kaan1234','5347888990','Zonguldak','Erkek'),
('Busra','Arslan','busraarslan@gmail.com','Busra1234','5318999001','Igdir','Kadin'),
('Fatma','Acar','fatma1@gmail.com','Fatma100a','5313285451','Ankara','Kadin');


insert into Otobusler(PlakaNo,Kapasite,OtobusTuru,Model,Ozellikler) values
('34XYZ123',44,'2+1','2020','Wifi,220V priz,Rahat koltuk'),
('06BJK1903',50,'2+2','2018','USB portu,TV,Eğlence sistemi'),
('35EGE456',38,'2+1','2019','Wifi,Rahat koltuk,Koltuk arkası ekran'),
('16BUR160',42,'2+1','2016','USB portu,Rahat koltuk,220V priz'),
('07ANT007',50,'2+2','2021','Koltuk arkası ekran,TV,WIFI'),
('10BAL123',38,'2+1','2017','Rahat koltuk,220V priz,İçecek servisi'),
('01ADA001',44,'2+1','2022','Wifi,USB portu,Rahat koltuk'),
('21DIY004',42,'2+2','2020','Koltuk arkası ekran,TV,USB portu'),
('27GAZ112',46,'2+1','2018','Wifi,TV,Rahat koltuk'),
('26ESK261',50,'2+2','2019','Eğlence sistemi,220V priz,Koltuk arkası ekran'),
('09AYD345',38,'2+1','2021','Wifi,220V priz,Rahat koltuk'),
('45MAN789',50,'2+2','2016','USB portu,TV,Eğlence sistemi'),
('38KYS001',44,'2+1','2019','Wifi,Rahat koltuk,Koltuk arkası ekran'),
('19COR567',42,'2+2','2020','USB portu,Rahat koltuk,220V priz'),
('06ANK318',46,'2+1','2018','Koltuk arkası ekran,TV,WIFI'),
('34IST456',38,'2+1','2021','Rahat koltuk,220V priz,İçecek servisi'),
('52ORD120',50,'2+2','2022','Wifi,USB portu,Rahat koltuk'),
('55SAM112',42,'2+1','2020','Koltuk arkası ekran,TV,USB portu'),
('61TRB013',46,'2+1','2019','Wifi,TV,Rahat koltuk'),
('63SAN163',50,'2+2','2017','Eğlence sistemi,220V priz,Koltuk arkası ekran'),
('44MLT444',38,'2+1','2018','Wifi,220V priz,Rahat koltuk'),
('58SVS009',50,'2+2','2020','USB portu,TV,Eğlence sistemi'),
('23ELZ111',44,'2+1','2021','Wifi,Rahat koltuk,Koltuk arkası ekran'),
('20DEN222',42,'2+2','2019','USB portu,Rahat koltuk,220V priz'),
('31HAT007',46,'2+1','2018','Koltuk arkası ekran,TV,WIFI'),
('35IZM355',38,'2+1','2021','Rahat koltuk,220V priz,İçecek servisi'),
('41KOC111',50,'2+2','2022','Wifi,USB portu,Rahat koltuk'),
('42KNY001',42,'2+1','2020','Koltuk arkası ekran,TV,USB portu'),
('53RZE002',46,'2+1','2019','Wifi,TV,Rahat koltuk'),
('66YOZ066',50,'2+2','2017','Eğlence sistemi,220V priz,Koltuk arkası ekran'),
('23ACE298',38,'2+1','2015','Wifi,220V priz,Rahat koltuk'),
('34ABM120',38,'2+1','2013','Wifi,220V priz,Rahat koltuk'),
('31MAN602',42,'2+1','2012','Wifi,220V priz,Rahat koltuk'),
('01PCR111',38,'2+1','2014','Wifi,220V priz,Rahat koltuk'),
('33TAL724',42,'2+1','2010','Wifi,220V priz,Rahat koltuk'),
('07ANT008',44,'2+1','2023','Wifi,USB portu,Rahat koltuk'),
('22EDR333',38,'2+1','2022','Koltuk arkası ekran,TV,WIFI'),
('32ISL444',50,'2+2','2021','Rahat koltuk,220V priz,İçecek servisi'),
('43AFY567',42,'2+1','2020','USB portu,TV,Eğlence sistemi'),
('54SAK789',46,'2+1','2019','Wifi,Rahat koltuk,220V priz'),
('65VAN999',50,'2+2','2018','Koltuk arkası ekran,TV,USB portu'),
('11BIL111',38,'2+1','2017','Eğlence sistemi,220V priz,Koltuk arkası ekran'),
('12BAT222',44,'2+2','2016','Wifi,Rahat koltuk,Koltuk arkası ekran'),
('13BIT333',42,'2+1','2015','USB portu,Rahat koltuk,220V priz'),
('14BOL444',46,'2+1','2014','Wifi,TV,Rahat koltuk'),
('15BUR555',50,'2+2','2013','Eğlence sistemi,220V priz,Koltuk arkası ekran'),
('17CAN666',38,'2+1','2012','Wifi,220V priz,Rahat koltuk'),
('18CKL777',44,'2+1','2011','Rahat koltuk,220V priz,İçecek servisi'),
('24ERZ888',50,'2+2','2010','Koltuk arkası ekran,TV,USB portu'),
('25BAY999',42,'2+1','2009','Wifi,TV,Rahat koltuk');



insert into Sehirler(SehirAdi) values
('Adana'), ('Adiyaman'), ('Afyonkarahisar'), ('Agri'), ('Aksaray'), ('Amasya'), ('Ankara'), ('Antalya'), ('Ardahan'), ('Artvin'), ('Aydin'), ('Balikesir'), ('Bartin'), ('Batman'), ('Bayburt'), ('Bilecik'), ('Bingol'), ('Bitlis'), ('Bolu'), ('Burdur'), ('Bursa'), ('Canakkale'), ('Cankiri'), ('Corum'), ('Denizli'), ('Diyarbakir'), ('Duzce'), ('Edirne'), ('Elazig'), ('Erzincan'), ('Erzurum'), ('Eskisehir'), ('Gaziantep'), ('Giresun'), ('Gumushane'), ('Hakkari'), ('Hatay'), ('Igdir'), ('Isparta'), ('Istanbul'), ('Izmir'), ('Kahramanmaras'), ('Karabuk'), ('Karaman'), ('Kars'), ('Kastamonu'), ('Kayseri'), ('Kirikkale'), ('Kirklareli'), ('Kirsehir'), ('Kilis'), ('Kocaeli'), ('Konya'), ('Kutahya'), ('Malatya'), ('Manisa'), ('Mardin'), ('Mersin'), ('Mugla'), ('Mus'), ('Nevsehir'), ('Nigde'), ('Ordu'), ('Osmaniye'), ('Rize'), ('Sakarya'), ('Samsun'), ('Sanliurfa'), ('Siirt'), ('Sinop'), ('Sivas'), ('Sirnak'), ('Tekirdag'), ('Tokat'), ('Trabzon'), ('Tunceli'), ('Usak'), ('Van'), ('Yalova'), ('Yozgat'), ('Zonguldak');


INSERT INTO Otogarlar (SehirID, OtogarAdi) VALUES
(1, 'AdanaOtogari'),
(2, 'AdiyamanOtogari'),
(3, 'AfyonkarahisarOtogari'),
(4, 'AgriOtogari'),
(5, 'AksarayOtogari'),
(6, 'AmasyaOtogari'),
(7, 'AnkaraOtogari'),
(8, 'AntalyaOtogari'),
(9, 'ArdahanOtogari'),
(10, 'ArtvinOtogari'),
(11, 'AydinOtogari'),
(12, 'BalikesirOtogari'),
(13, 'BartinOtogari'),
(14, 'BatmanOtogari'),
(15, 'BayburtOtogari'),
(16, 'BilecikOtogari'),
(17, 'BingolOtogari'),
(18, 'BitlisOtogari'),
(19, 'BoluOtogari'),
(20, 'BurdurOtogari'),
(21, 'BursaOtogari'),
(22, 'CanakkaleOtogari'),
(23, 'CankiriOtogari'),
(24, 'CorumOtogari'),
(25, 'DenizliOtogari'),
(26, 'DiyarbakirOtogari'),
(27, 'DuzceOtogari'),
(28, 'EdirneOtogari'),
(29, 'ElazigOtogari'),
(30, 'ErzincanOtogari'),
(31, 'ErzurumOtogari'),
(32, 'EskisehirOtogari'),
(33, 'GaziantepOtogari'),
(34, 'GiresunOtogari'),
(35, 'GumushaneOtogari'),
(36, 'HakkariOtogari'),
(37, 'HatayOtogari'),
(38, 'IgdirOtogari'),
(39, 'IspartaOtogari'),
(40, 'IstanbulOtogari'),
(41, 'IzmirOtogari'),
(42, 'KahramanmarasOtogari'),
(43, 'KarabukOtogari'),
(44, 'KaramanOtogari'),
(45, 'KarsOtogari'),
(46, 'KastamonuOtogari'),
(47, 'KayseriOtogari'),
(48, 'KirikkaleOtogari'),
(49, 'KirklareliOtogari'),
(50, 'KirsehirOtogari'),
(51, 'KilisOtogari'),
(52, 'KocaeliOtogari'),
(53, 'KonyaOtogari'),
(54, 'KutahyaOtogari'),
(55, 'MalatyaOtogari'),
(56, 'ManisaOtogari'),
(57, 'MardinOtogari'),
(58, 'MersinOtogari'),
(59, 'MuglaOtogari'),
(60, 'MusOtogari'),
(61, 'NevsehirOtogari'),
(62, 'NigdeOtogari'),
(63, 'OrduOtogari'),
(64, 'OsmaniyeOtogari'),
(65, 'RizeOtogari'),
(66, 'SakaryaOtogari'),
(67, 'SamsunOtogari'),
(68, 'SanliurfaOtogari'),
(69, 'SiirtOtogari'),
(70, 'SinopOtogari'),
(71, 'SivasOtogari'),
(72, 'SirnakOtogari'),
(73, 'TekirdagOtogari'),
(74, 'TokatOtogari'),
(75, 'TrabzonOtogari'),
(76, 'TunceliOtogari'),
(77, 'UsakOtogari'),
(78, 'VanOtogari'),
(79, 'YalovaOtogari'),
(80, 'YozgatOtogari'),
(81, 'ZonguldakOtogari');


insert into Seferler(OtobusID,KalkisOtogarID,VarisOtogarID,Kalkis_Tarihi,Varis_Tarihi,Fiyat,Durum) values
(1, 10, 20, '2025-01-06 08:00:00', '2025-01-06 12:30:00', 150.00, 'Planlandi'),
(2, 15, 25, '2025-01-06 09:00:00', '2025-01-06 14:00:00', 180.00, 'Gerceklesti'),
(3, 12, 30, '2025-01-06 10:00:00', '2025-01-06 15:15:00', 200.00, 'Iptal Edildi'),
(4, 5, 18, '2025-01-06 11:00:00', '2025-01-06 16:00:00', 170.00, 'Gerceklesti'),
(5, 8, 22, '2025-01-06 12:00:00', '2025-01-06 16:30:00', 160.00, 'Planlandi'),
(6, 20, 35, '2025-01-06 13:00:00', '2025-01-06 17:45:00', 210.00, 'Iptal Edildi'),
(7, 25, 40, '2025-01-06 14:00:00', '2025-01-06 19:30:00', 250.00, 'Planlandi'),
(8, 30, 45, '2025-01-06 15:00:00', '2025-01-06 20:15:00', 230.00, 'Gerceklesti'),
(9, 18, 22, '2025-01-06 16:00:00', '2025-01-06 21:00:00', 190.00, 'Planlandi'),
(10, 10, 28, '2025-01-06 17:00:00', '2025-01-06 22:30:00', 240.00, 'Planlandi'),
(11, 15, 32, '2025-01-06 18:00:00', '2025-01-07 00:00:00', 300.00, 'Iptal Edildi'),
(12, 12, 36, '2025-01-07 08:00:00', '2025-01-07 12:45:00', 220.00, 'Gerceklesti'),
(13, 5, 25, '2025-01-07 09:00:00', '2025-01-07 14:30:00', 200.00, 'Planlandi'),
(14, 8, 42, '2025-01-07 10:00:00', '2025-01-07 15:15:00', 280.00, 'Planlandi'),
(15, 20, 50, '2025-01-07 11:00:00', '2025-01-07 16:00:00', 300.00, 'Gerceklesti'),
(16, 25, 48, '2025-01-07 12:00:00', '2025-01-07 16:30:00', 260.00, 'Iptal Edildi'),
(17, 30, 18, '2025-01-07 13:00:00', '2025-01-07 17:45:00', 150.00, 'Planlandi'),
(18, 18, 28, '2025-01-07 14:00:00', '2025-01-07 19:30:00', 170.00, 'Gerceklesti'),
(19, 10, 22, '2025-01-07 15:00:00', '2025-01-07 20:15:00', 160.00, 'Planlandi'),
(20, 15, 45, '2025-01-07 16:00:00', '2025-01-07 21:00:00', 250.00, 'Iptal Edildi'),
(21, 12, 35, '2025-01-07 17:00:00', '2025-01-07 22:30:00', 190.00, 'Gerceklesti'),
(22, 5, 40, '2025-01-07 18:00:00', '2025-01-08 00:00:00', 300.00, 'Planlandi'),
(23, 8, 50, '2025-01-08 08:00:00', '2025-01-08 12:45:00', 220.00, 'Planlandi'),
(24, 20, 45, '2025-01-08 09:00:00', '2025-01-08 14:30:00', 250.00, 'Gerceklesti'),
(25, 25, 35, '2025-01-08 10:00:00', '2025-01-08 15:15:00', 210.00, 'Iptal Edildi'),
(26, 30, 22, '2025-01-08 11:00:00', '2025-01-08 16:00:00', 150.00, 'Planlandi'),
(27, 18, 28, '2025-01-08 12:00:00', '2025-01-08 16:30:00', 180.00, 'Gerceklesti'),
(28, 10, 50, '2025-01-08 13:00:00', '2025-01-08 17:45:00', 300.00, 'Planlandi'),
(29, 15, 45, '2025-01-08 14:00:00', '2025-01-08 19:30:00', 260.00, 'Planlandi'),
(30, 12, 35, '2025-01-08 15:00:00', '2025-01-08 20:15:00', 220.00, 'Iptal Edildi'),
(31, 5, 40, '2025-01-08 16:00:00', '2025-01-08 21:00:00', 280.00, 'Gerceklesti'),
(32, 8, 22, '2025-01-08 17:00:00', '2025-01-08 22:30:00', 170.00, 'Planlandi'),
(33, 20, 50, '2025-01-08 18:00:00', '2025-01-09 00:00:00', 250.00, 'Iptal Edildi'),
(34, 25, 18, '2025-01-09 08:00:00', '2025-01-09 12:45:00', 150.00, 'Planlandi'),
(35, 30, 28, '2025-01-09 09:00:00', '2025-01-09 14:30:00', 200.00, 'Gerceklesti'),
(36, 18, 45, '2025-01-09 10:00:00', '2025-01-09 15:15:00', 240.00, 'Iptal Edildi'),
(37, 10, 35, '2025-01-09 11:00:00', '2025-01-09 16:00:00', 190.00, 'Planlandi'),
(38, 15, 22, '2025-01-09 12:00:00', '2025-01-09 16:30:00', 160.00, 'Gerceklesti'),
(39, 12, 28, '2025-01-09 13:00:00', '2025-01-09 17:45:00', 170.00, 'Planlandi'),
(40, 5, 40, '2025-01-09 14:00:00', '2025-01-09 19:30:00', 300.00, 'Iptal Edildi'),
(41, 8, 22, '2025-01-09 15:00:00', '2025-01-09 20:15:00', 150.00, 'Planlandi'),
(42, 20, 45, '2025-01-09 16:00:00', '2025-01-09 21:00:00', 230.00, 'Gerceklesti'),
(43, 25, 50, '2025-01-09 17:00:00', '2025-01-09 22:30:00', 220.00, 'Planlandi'),
(44, 30, 35, '2025-01-09 18:00:00', '2025-01-10 00:00:00', 250.00, 'Iptal Edildi'),
(45, 18, 22, '2025-01-10 08:00:00', '2025-01-10 12:45:00', 200.00, 'Planlandi'),
(46, 10, 28, '2025-01-10 09:00:00', '2025-01-10 14:30:00', 180.00, 'Gerceklesti'),
(47, 15, 50, '2025-01-10 10:00:00', '2025-01-10 15:15:00', 300.00, 'Planlandi'),
(48, 12, 45, '2025-01-10 11:00:00', '2025-01-10 16:00:00', 250.00, 'Iptal Edildi'),
(49, 5, 35, '2025-01-10 12:00:00', '2025-01-10 16:30:00', 220.00, 'Planlandi'),
(50, 8, 22, '2025-01-10 13:00:00', '2025-01-10 17:45:00', 200.00, 'Gerceklesti');


insert into Rezervasyonlar(SeferID,YolcuID,KoltukNo,Rez_Tarihi,YolculukTuru,Durum) values
(1, 10, 15, '2025-01-01 12:30:00', 'Tek Yön', 'Onaylandi'),
(2, 12, 8, '2025-01-02 14:00:00', 'Gidis-Donus', 'Onaylandi'),
(3, 15, 23, '2025-01-03 16:15:00', 'Tek Yön', 'Iptal Edildi'),
(4, 16, 10, '2025-01-04 10:00:00', 'Tek Yön', 'Onaylandi'),
(5, 18, 25, '2025-01-05 09:30:00', 'Gidis-Donus', 'Onaylandi'),
(6, 19, 30, '2025-01-06 11:45:00', 'Tek Yön', 'Onaylandi'),
(7, 21, 5, '2025-01-07 14:15:00', 'Gidis-Donus', 'Onaylandi'),
(8, 23, 11, '2025-01-08 15:00:00', 'Tek Yön', 'Iptal Edildi'),
(9, 25, 19, '2025-01-09 12:00:00', 'Tek Yön', 'Onaylandi'),
(10, 27, 20, '2025-01-10 13:45:00', 'Gidis-Donus', 'Onaylandi'),
(11, 28, 1, '2025-01-11 16:30:00', 'Tek Yön', 'Onaylandi'),
(12, 30, 7, '2025-01-12 10:15:00', 'Gidis-Donus', 'Onaylandi'),
(13, 32, 9, '2025-01-13 14:00:00', 'Tek Yön', 'Iptal Edildi'),
(14, 34, 14, '2025-01-14 17:00:00', 'Tek Yön', 'Onaylandi'),
(15, 35, 18, '2025-01-15 18:30:00', 'Gidis-Donus', 'Onaylandi'),
(16, 37, 21, '2025-01-16 20:00:00', 'Tek Yön', 'Onaylandi'),
(17, 38, 22, '2025-01-17 09:00:00', 'Gidis-Donus', 'Iptal Edildi'),
(18, 39, 6, '2025-01-18 07:30:00', 'Tek Yön', 'Onaylandi'),
(19, 41, 15, '2025-01-19 11:45:00', 'Gidis-Donus', 'Onaylandi'),
(20, 42, 24, '2025-01-20 14:30:00', 'Tek Yön', 'Onaylandi'),
(21, 43, 12, '2025-01-21 16:15:00', 'Gidis-Donus', 'Onaylandi'),
(22, 44, 2, '2025-01-22 18:00:00', 'Tek Yön', 'Onaylandi'),
(23, 45, 26, '2025-01-23 19:30:00', 'Gidis-Donus', 'Iptal Edildi'),
(24, 46, 29, '2025-01-24 20:15:00', 'Tek Yön', 'Onaylandi'),
(25, 47, 13, '2025-01-25 09:45:00', 'Gidis-Donus', 'Onaylandi'),
(26, 48, 8, '2025-01-26 11:30:00', 'Tek Yön', 'Onaylandi'),
(27, 49, 17, '2025-01-27 14:00:00', 'Gidis-Donus', 'Onaylandi'),
(28, 50, 3, '2025-01-28 16:00:00', 'Tek Yön', 'Iptal Edildi'),
(29, 1, 22, '2025-01-29 17:45:00', 'Tek Yön', 'Onaylandi'),
(30, 3, 4, '2025-01-30 20:30:00', 'Tek Yön', 'Onaylandi'),
(31, 5, 27, '2025-01-31 21:15:00', 'Tek Yön', 'Onaylandi'),
(32, 6, 10, '2025-02-01 08:00:00', 'Gidis-Donus', 'Onaylandi'),
(33, 7, 18, '2025-02-02 10:15:00', 'Tek Yön', 'Onaylandi'),
(34, 9, 9, '2025-02-03 13:30:00', 'Gidis-Donus', 'Onaylandi'),
(35, 11, 5, '2025-02-04 15:00:00', 'Tek Yön', 'Onaylandi'),
(36, 14, 20, '2025-02-05 17:45:00', 'Gidis-Donus', 'Onaylandi'),
(37, 16, 6, '2025-02-06 19:30:00', 'Tek Yön', 'Iptal Edildi'),
(38, 18, 7, '2025-02-07 20:15:00', 'Tek Yön', 'Onaylandi'),
(39, 20, 23, '2025-02-08 07:00:00', 'Tek Yön', 'Onaylandi'),
(40, 22, 1, '2025-02-09 08:30:00', 'Gidis-Donus', 'Onaylandi'),
(41, 24, 2, '2025-02-10 09:45:00', 'Tek Yön', 'Onaylandi'),
(42, 26, 12, '2025-02-11 12:30:00', 'Tek Yön', 'Onaylandi'),
(43, 28, 11, '2025-02-12 14:15:00', 'Tek Yön', 'Onaylandi'),
(44, 29, 16, '2025-02-13 17:00:00', 'Tek Yön', 'Onaylandi'),
(45, 31, 30, '2025-02-14 20:00:00', 'Tek Yön', 'Iptal Edildi'),
(46, 33, 14, '2025-02-15 21:30:00', 'Gidis-Donus', 'Onaylandi'),
(47, 35, 21, '2025-02-16 08:15:00', 'Tek Yön', 'Onaylandi'),
(48, 37, 22, '2025-02-17 10:00:00', 'Tek Yön', 'Onaylandi'),
(49, 39, 25, '2025-02-18 13:45:00', 'Tek Yön', 'Onaylandi'),
(50, 40, 19, '2025-02-19 15:00:00', 'Tek Yön', 'Onaylandi');


insert into Odemeler(Rez_ID, Od_Tarihi, Od_Yontemi, Durum) values
(1, '2025-01-01 10:30:00', 'Kredi Kartı', 'Onaylandi'),
(2, '2025-01-02 12:00:00', 'Banka Havalesi', 'Beklemede'),
(3, '2025-01-03 14:15:00', 'Nakit', 'Iptal Edildi'),
(4, '2025-01-04 16:30:00', 'Kredi Kartı', 'Onaylandi'),
(5, '2025-01-05 18:00:00', 'Banka Havalesi', 'Onaylandi'),
(6, '2025-01-06 20:45:00', 'Kredi Kartı', 'Iptal Edildi'),
(7, '2025-01-07 22:15:00', 'Nakit', 'Onaylandi'),
(8, '2025-01-08 07:30:00', 'Kredi Kartı', 'Beklemede'),
(9, '2025-01-09 09:00:00', 'Banka Havalesi', 'Onaylandi'),
(10, '2025-01-10 10:30:00', 'Nakit', 'Beklemede'),
(11, '2025-01-11 12:00:00', 'Kredi Kartı', 'Onaylandi'),
(12, '2025-01-12 13:45:00', 'Banka Havalesi', 'Iptal Edildi'),
(13, '2025-01-13 15:30:00', 'Kredi Kartı', 'Onaylandi'),
(14, '2025-01-14 17:00:00', 'Nakit', 'Beklemede'),
(15, '2025-01-15 18:45:00', 'Banka Havalesi', 'Onaylandi'),
(16, '2025-01-16 20:30:00', 'Kredi Kartı', 'Iptal Edildi'),
(17, '2025-01-17 22:00:00', 'Nakit', 'Onaylandi'),
(18, '2025-01-18 07:15:00', 'Banka Havalesi', 'Beklemede'),
(19, '2025-01-19 08:45:00', 'Kredi Kartı', 'Onaylandi'),
(20, '2025-01-20 10:00:00', 'Nakit', 'Iptal Edildi'),
(21, '2025-01-21 11:30:00', 'Kredi Kartı', 'Beklemede'),
(22, '2025-01-22 13:15:00', 'Banka Havalesi', 'Onaylandi'),
(23, '2025-01-23 14:45:00', 'Kredi Kartı', 'Iptal Edildi'),
(24, '2025-01-24 16:30:00', 'Nakit', 'Onaylandi'),
(25, '2025-01-25 18:00:00', 'Banka Havalesi', 'Beklemede'),
(26, '2025-01-26 19:15:00', 'Kredi Kartı', 'Onaylandi'),
(27, '2025-01-27 21:00:00', 'Nakit', 'Iptal Edildi'),
(28, '2025-01-28 22:30:00', 'Banka Havalesi', 'Onaylandi'),
(29, '2025-01-29 07:45:00', 'Kredi Kartı', 'Beklemede'),
(30, '2025-01-30 09:30:00', 'Nakit', 'Onaylandi'),
(31, '2025-02-01 11:00:00', 'Banka Havalesi', 'Onaylandi'),
(32, '2025-02-02 12:30:00', 'Kredi Kartı', 'Iptal Edildi'),
(33, '2025-02-03 14:00:00', 'Nakit', 'Beklemede'),
(34, '2025-02-04 15:15:00', 'Banka Havalesi', 'Onaylandi'),
(35, '2025-02-05 17:00:00', 'Kredi Kartı', 'Onaylandi'),
(36, '2025-02-06 18:30:00', 'Nakit', 'Iptal Edildi'),
(37, '2025-02-07 20:00:00', 'Banka Havalesi', 'Beklemede'),
(38, '2025-02-08 21:30:00', 'Kredi Kartı', 'Onaylandi'),
(39, '2025-02-09 23:00:00', 'Nakit', 'Beklemede'),
(40, '2025-02-10 07:30:00', 'Banka Havalesi', 'Iptal Edildi'),
(41, '2025-02-11 09:00:00', 'Kredi Kartı', 'Onaylandi'),
(42, '2025-02-12 10:45:00', 'Nakit', 'Beklemede'),
(43, '2025-02-13 12:15:00', 'Banka Havalesi', 'Onaylandi'),
(44, '2025-02-14 13:45:00', 'Kredi Kartı', 'Iptal Edildi'),
(45, '2025-02-15 15:00:00', 'Nakit', 'Onaylandi'),
(46, '2025-02-16 16:30:00', 'Banka Havalesi', 'Beklemede'),
(47, '2025-02-17 18:00:00', 'Kredi Kartı', 'Onaylandi'),
(48, '2025-02-18 19:30:00', 'Nakit', 'Iptal Edildi'),
(49, '2025-02-19 21:00:00', 'Banka Havalesi', 'Onaylandi'),
(50, '2025-02-20 22:30:00', 'Kredi Kartı', 'Beklemede');


insert into Bildirimler(YolcuID, SeferID, Baslik, MesajIcerigi, Okundu, BildirimTuru) values
(1, 1, 'Sefer Bilgisi Güncellendi', 'Sefer saatinde değişiklik olmuştur. Lütfen kontrol ediniz.', 0, 'Saat Değişikliği'),
(2, 2, 'Ödeme Onayı', 'Ödemeniz başarıyla onaylanmıştır. İyi yolculuklar!', 1, 'Ödeme Onayı'),
(3, 3, 'Sefer İptali', 'Sefer iptal edilmiştir. Lütfen alternatif bir sefer seçiniz.', 0, 'İptal'),
(4, 4, 'Sefer Bilgisi Güncellendi', 'Seferinizin varış saati değişmiştir.', 0, 'Saat Değişikliği'),
(5, 5, 'Ödeme Başarısız', 'Ödemeniz alınamadı. Lütfen bilgilerinizi kontrol edip tekrar deneyiniz.', 0, 'Ödeme Hatası'),
(6, 6, 'Yolculuk Hatırlatması', 'Yolculuğunuz yaklaşıyor. Lütfen hazırlığınızı tamamlayınız.', 0, 'Hatırlatma'),
(7, 7, 'Sefer Onayı', 'Seferiniz onaylanmıştır. Keyifli yolculuklar!', 1, 'Sefer Onayı'),
(8, 8, 'Sefer İptali', 'Sefer iptal edilmiştir. Alternatif seferleri inceleyebilirsiniz.', 0, 'İptal'),
(9, 9, 'Yeni Sefer Planı', 'Yeni sefer planınız eklenmiştir. Lütfen tarih ve saatleri kontrol ediniz.', 0, 'Yeni Sefer'),
(10, 10, 'Ödeme Onayı', 'Ödemeniz başarıyla onaylanmıştır.', 1, 'Ödeme Onayı'),
(11, 11, 'Yolculuk Hatırlatması', 'Yolculuğunuz 2 saat içinde başlayacaktır.', 0, 'Hatırlatma'),
(12, 12, 'Sefer Bilgisi Güncellendi', 'Seferinizin kalkış saati 30 dakika erken alındı.', 0, 'Saat Değişikliği'),
(13, 13, 'Ödeme Başarısız', 'Ödemeniz alınamadı. Lütfen kart bilgilerinizi kontrol ediniz.', 0, 'Ödeme Hatası'),
(14, 14, 'Sefer Onayı', 'Seferiniz onaylanmıştır. İyi yolculuklar!', 1, 'Sefer Onayı'),
(15, 15, 'Yeni Sefer Planı', 'Yeni sefer planınız oluşturulmuştur. Lütfen tarih ve saatleri kontrol ediniz.', 0, 'Yeni Sefer'),
(16, 16, 'Sefer İptali', 'Sefer iptal edilmiştir. Başka bir tarih seçmeniz gerekmektedir.', 0, 'İptal'),
(17, 17, 'Yolculuk Hatırlatması', 'Yolculuğunuz 1 saat içinde başlayacaktır. Lütfen hazırlığınızı tamamlayın.', 0, 'Hatırlatma'),
(18, 18, 'Sefer Bilgisi Güncellendi', 'Varış saatinizde değişiklik olmuştur.', 0, 'Saat Değişikliği'),
(19, 19, 'Ödeme Onayı', 'Ödemeniz başarıyla onaylanmıştır. Lütfen biletinizi kontrol ediniz.', 1, 'Ödeme Onayı'),
(20, 20, 'Sefer İptali', 'Seferiniz iptal edilmiştir. Yeni tarih seçimi yapmanız gerekmektedir.', 0, 'İptal'),
(21, 21, 'Sefer Onayı', 'Seferiniz onaylanmıştır. İyi yolculuklar!', 1, 'Sefer Onayı'),
(22, 22, 'Yeni Sefer Planı', 'Yeni bir sefer planınız oluşturulmuştur. Detaylar için lütfen kontrol ediniz.', 0, 'Yeni Sefer'),
(23, 23, 'Sefer Bilgisi Güncellendi', 'Seferinizin kalkış saati değişmiştir. Lütfen kontrol ediniz.', 0, 'Saat Değişikliği'),
(24, 24, 'Ödeme Başarısız', 'Ödemeniz alınamadı. Lütfen ödeme yöntemini kontrol edin.', 0, 'Ödeme Hatası'),
(25, 25, 'Sefer İptali', 'Sefer iptal edilmiştir. Lütfen yeni tarih seçiniz.', 0, 'İptal'),
(26, 26, 'Yolculuk Hatırlatması', 'Yolculuğunuz yaklaşıyor, lütfen otogara erken geliniz.', 0, 'Hatırlatma'),
(27, 27, 'Sefer Onayı', 'Seferiniz onaylanmıştır. Yolculuğunuz keyifli geçsin!', 1, 'Sefer Onayı'),
(28, 28, 'Ödeme Onayı', 'Ödemeniz başarıyla alınmıştır. Biletiniz onaylanmıştır.', 1, 'Ödeme Onayı'),
(29, 29, 'Sefer Bilgisi Güncellendi', 'Seferinizin varış saati 30 dakika ileri alındı.', 0, 'Saat Değişikliği'),
(30, 30, 'Yeni Sefer Planı', 'Yeni bir sefer eklenmiştir. Detaylar için biletinizi kontrol ediniz.', 0, 'Yeni Sefer'),
(31, 31, 'Yolculuk Hatırlatması', 'Yolculuğunuz 3 saat içinde başlayacaktır. Lütfen hazırlığınızı tamamlayınız.', 0, 'Hatırlatma'),
(32, 32, 'Sefer Onayı', 'Seferiniz onaylanmıştır. İyi yolculuklar!', 1, 'Sefer Onayı'),
(33, 33, 'Ödeme Başarısız', 'Ödemeniz alınamadı. Lütfen kart bilgilerinizi kontrol ediniz.', 0, 'Ödeme Hatası'),
(34, 34, 'Sefer Bilgisi Güncellendi', 'Sefer saatiniz 45 dakika ileri alınmıştır.', 0, 'Saat Değişikliği'),
(35, 35, 'Sefer İptali', 'Sefer iptal edilmiştir. Lütfen yeni bir sefer seçiniz.', 0, 'İptal'),
(36, 36, 'Yeni Sefer Planı', 'Yeni bir sefer eklenmiştir. Lütfen kontrol ediniz.', 0, 'Yeni Sefer'),
(37, 37, 'Yolculuk Hatırlatması', 'Yolculuğunuz 2 saat içinde başlayacaktır. Hazırlığınızı tamamlayınız.', 0, 'Hatırlatma'),
(38, 38, 'Sefer Onayı', 'Seferiniz onaylanmıştır. Güvenli yolculuklar!', 1, 'Sefer Onayı'),
(39, 39, 'Ödeme Onayı', 'Ödemeniz alınmıştır. Biletiniz başarıyla onaylanmıştır.', 1, 'Ödeme Onayı'),
(40, 40, 'Sefer İptali', 'Sefer iptal edilmiştir. Lütfen bir başka tarih seçiniz.', 0, 'İptal'),
(41, 41, 'Yeni Sefer Planı', 'Yeni bir sefer planı oluşturulmuştur. Detaylar için lütfen kontrol ediniz.', 0, 'Yeni Sefer'),
(42, 42, 'Sefer Bilgisi Güncellendi', 'Sefer saatiniz değişmiştir. Lütfen yeni saati kontrol ediniz.', 0, 'Saat Değişikliği'),
(43, 43, 'Ödeme Başarısız', 'Ödemeniz alınamadı. Lütfen kart bilgilerinizi gözden geçirin.', 0, 'Ödeme Hatası'),
(44, 44, 'Sefer Onayı', 'Seferiniz onaylanmıştır. Keyifli yolculuklar!', 1, 'Sefer Onayı'),
(45, 45, 'Yolculuk Hatırlatması', 'Yolculuğunuz 1 saat içinde başlayacaktır. Hazırlığınızı tamamlayın.', 0, 'Hatırlatma'),
(46, 46, 'Sefer Bilgisi Güncellendi', 'Varış saatinizde değişiklik olmuştur. Lütfen kontrol ediniz.', 0, 'Saat Değişikliği'),
(47, 47, 'Ödeme Onayı', 'Ödemeniz başarıyla onaylanmıştır. Biletinizi alabilirsiniz.', 1, 'Ödeme Onayı'),
(48, 48, 'Sefer İptali', 'Sefer iptal edilmiştir. Lütfen alternatif bir tarih seçiniz.', 0, 'İptal'),
(49, 49, 'Yeni Sefer Planı', 'Yeni bir sefer planı oluşturulmuştur. Detaylar için kontrol ediniz.', 0, 'Yeni Sefer'),
(50, 50, 'Yolculuk Hatırlatması', 'Yolculuğunuz yaklaşıyor. Lütfen otogara erken geliniz.', 0, 'Hatırlatma');


insert into Sikayetler(YolcuID, SeferID, Konu, Aciklama, Tarih, Durum) values
(1, 1, 'Otobus Gecikmesi', 'Otobus kalkis saatinden 1 saat sonra hareket etti.', '2025-01-01 08:30:00', 'Cozulmedi'),
(2, 2, 'Koltuk Rahatsizligi', 'Koltuk minderleri cok sertti, rahat edemedim.', '2025-01-02 10:00:00', 'Cozulmedi'),
(3, 3, 'Asiri Sicaklik', 'Otobuste klima calismiyordu, cok sicakti.', '2025-01-03 12:15:00', 'Cozulmedi'),
(4, 4, 'Hijyen Sorunlari', 'Otobusun ici cok kirliydi, koltuklar lekelerle doluydu.', '2025-01-04 14:00:00', 'Cozulmedi'),
(5, 5, 'Yolculuk Sureci', 'Yolculuk sureci tahminimden cok daha uzun surdu.', '2025-01-05 16:45:00', 'Cozulmedi'),
(6, 6, 'Surus Guvenligi', 'Sofor cok hizli gidiyordu ve trafik kurallarina uymuyordu.', '2025-01-06 18:30:00', 'Cozulmedi'),
(7, 7, 'Yolcu Davranisi', 'Yanimdaki yolcu cok gurtlu yapiliyordu, rahatsiz oldum.', '2025-01-07 20:00:00', 'Cozulmedi'),
(8, 8, 'Otobus Donanimi', 'Wi-Fi calismiyordu, otobus eski modeldi.', '2025-01-08 22:15:00', 'Cozulmedi'),
(9, 9, 'Koltuk Secimi', 'Koltuk numaram bana verilmedi, baska birine verildi.', '2025-01-09 09:45:00', 'Cozulmedi'),
(10, 10, 'Otobus Kokusu', 'Otobus cok kotu kokuyordu, rahatsiz oldum.', '2025-01-10 11:30:00', 'Cozulmedi'),
(11, 11, 'Bilet Fiyati', 'Bilet fiyati cok yuksekti, bu kadar pahali olmamaliydi.', '2025-01-11 13:00:00', 'Cozulmedi'),
(12, 12, 'Kalkis Gecikmesi', 'Otobus saatinde kalkmadi, yaklasik 30 dakika gecikme oldu.', '2025-01-12 15:30:00', 'Cozulmedi'),
(13, 13, 'Asiri Gurtlu', 'Otobus icinde cok fazla gurtlu vardi, sessiz olmaliydi.', '2025-01-13 17:00:00', 'Cozulmedi'),
(14, 14, 'Koltuk Temizligi', 'Koltukta kir vardi, duzgun temizlenmemisti.', '2025-01-14 19:15:00', 'Cozulmedi'),
(15, 15, 'Yolculuk Konforu', 'Yolculuk konforu yetersizdi, otobus cok sallaniyordu.', '2025-01-15 21:30:00', 'Cozulmedi'),
(16, 16, 'Kalkis Gecikmesi', 'Otobus yaklasik 1 saat gecikmeli kalkti.', '2025-01-16 10:30:00', 'Cozulmedi'),
(17, 17, 'Yolcu Davranisi', 'Yanimdaki yolcu sigara icsiyordu, rahatsiz oldum.', '2025-01-17 12:00:00', 'Cozulmedi'),
(18, 18, 'Bilet Bilgisi', 'Bilet bilgileri yanlis verilmis, sorun yasadim.', '2025-01-18 14:15:00', 'Cozulmedi'),
(19, 19, 'Asiri Sicaklik', 'Otobus asiri sicakti, klima cok zayif calisiyordu.', '2025-01-19 16:30:00', 'Cozulmedi'),
(20, 20, 'Koltuk Rahatsizligi', 'Koltuk sırt yaslama kisimi bozulmustu, rahat edemedim.', '2025-01-20 18:00:00', 'Cozulmedi'),
(21, 21, 'Otobus Gecikmesi', 'Otobus tam zamaninda kalkmadi, gecikme oldu.', '2025-01-21 20:30:00', 'Cozulmedi'),
(22, 22, 'Yolculuk Sureci', 'Yolculuk sureci cok uzundu, mola sayisi fazla olmaliydi.', '2025-01-22 22:45:00', 'Cozulmedi'),
(23, 23, 'Sofor Davranisi', 'Sofor cok agresifti, yolculuk boyunca stres yasadim.', '2025-01-23 08:15:00', 'Cozulmedi'),
(24, 24, 'Otobus Temizligi', 'Otobus oldukca kirliydi, hijyenik degildi.', '2025-01-24 10:30:00', 'Cozulmedi'),
(25, 25, 'Yolcu Davranisi', 'Yanimdaki yolcu surekli telefonla konusuyordu, rahatsiz oldum.', '2025-01-25 12:00:00', 'Cozulmedi'),
(26, 26, 'Koltuk Secimi', 'Biletimi alirken koltuk numaramı secmedim ama farkli birine verildi.', '2025-01-26 14:15:00', 'Cozulmedi'),
(27, 27, 'Otobus Kokusu', 'Otobus icinde kotu bir koku vardi, rahatsiz oldum.', '2025-01-27 16:30:00', 'Cozulmedi'),
(28, 28, 'Yolculuk Konforu', 'Yolculuk sirasi surekli rahatsiz oldum, otobus konforsuzdu.', '2025-01-28 18:45:00', 'Cozulmedi'),
(29, 29, 'Bilet Fiyati', 'Bilet fiyatlari cok pahaliydi, uygun olmaliydi.', '2025-01-29 20:00:00', 'Cozulmedi'),
(30, 30, 'Kalkis Gecikmesi', 'Otobus kalkmadan once cok uzun sure beklemek zorunda kaldim.', '2025-01-30 22:15:00', 'Cozulmedi'),
(31, 31, 'Asiri Sicaklik', 'Klima arizaliydi, asiri sicakti.', '2025-02-01 09:00:00', 'Cozulmedi'),
(32, 32, 'Yolcu Davranisi', 'Yanimdaki yolcular cok gurtlu yapiliyordu, rahatsiz oldum.', '2025-02-02 11:15:00', 'Cozulmedi'),
(33, 33, 'Otobus Temizligi', 'Otobus cok kirliydi, koltuklar cok eskidi.', '2025-02-03 13:30:00', 'Cozulmedi'),
(34, 34, 'Koltuk Rahatsizligi', 'Koltuklar cok dar ve rahatsizdi.', '2025-02-04 15:45:00', 'Cozulmedi'),
(35, 35, 'Bilet Bilgisi', 'Biletimde yanlis bir tarih vardi, biletimi degistirmekte zorlandim.', '2025-02-05 18:00:00', 'Cozulmedi'),
(36, 36, 'Sefer Gecikmesi', 'Otobus kalkis saati 45 dakika gecikti.', '2025-02-06 20:00:00', 'Cozulmedi'),
(37, 37, 'Yolculuk Konforu', 'Yolculuk sirasi surekli rahatsiz oldum, otobus konforsuzdu.', '2025-02-07 22:30:00', 'Cozulmedi'),
(38, 38, 'Sofor Davranisi', 'Soforun surusu cok tehlikeliydi, surekli hiz yapiyordu.', '2025-02-08 09:00:00', 'Cozulmedi'),
(39, 39, 'Yolculuk Sureci', 'Yolculuk sureci cok uzun surmustu, seyahatim zor gecdi.', '2025-02-09 11:15:00', 'Cozulmedi'),
(40, 40, 'Otobus Gecikmesi', 'Otobusun kalkis saati gecikti.', '2025-02-10 13:30:00', 'Cozulmedi'),
(41, 41, 'Koltuk Secimi', 'Koltuk numaram baskasina verilmisdi.', '2025-02-11 15:45:00', 'Cozulmedi'),
(42, 42, 'Otobus Kokusu', 'Otobus icinde kotu bir koku vardi.', '2025-02-12 18:00:00', 'Cozulmedi'),
(43, 43, 'Bilet Fiyati', 'Otobus bileti cok pahaliydi.', '2025-02-13 20:00:00', 'Cozulmedi'),
(44, 44, 'Yolcu Davranisi', 'Yanimdaki yolcu surekli bagiriyordu, rahatsiz oldum.', '2025-02-14 22:30:00', 'Cozulmedi'),
(45, 45, 'Otobus Temizligi', 'Otobusun icinde temizlik yoktu.', '2025-02-15 09:00:00', 'Cozulmedi'),
(46, 46, 'Yolculuk Konforu', 'Otobus asiri sallaniyordu, cok rahatsiz oldum.', '2025-02-16 11:15:00', 'Cozulmedi'),
(47, 47, 'Bilet Bilgisi', 'Biletimde isim yanlis yazilmisti, duzeltilmesi icin yardimci olunmadi.', '2025-02-17 13:30:00', 'Cozulmedi'),
(48, 48, 'Koltuk Rahatsizligi', 'Koltuklar cok eskidi ve rahat degildi.', '2025-02-18 15:45:00', 'Cozulmedi'),
(49, 49, 'Asiri Gurtlu', 'Otobus icerisindeki gurtlu nedeniyle odaklanamadim.', '2025-02-19 18:00:00', 'Cozulmedi'),
(50, 50, 'Bavulum Kayboldu', 'Bavulum baska yolcu ile karisilmis en yakin zamanda sorunum cozulsun lutfen', '2025-02-21 10:00:00', 'Cozulmus');


INSERT INTO Soforler (Ad, Soyad, Telefon, EhliyetNo, CalismaDurumu, DeneyimYili) VALUES
('Ahmet', 'Yilmaz', '5311234567', '12345689012345', 'Aktif', 5),
('Mehmet', 'Kara', '5322345678', '22345679012345', 'Izinli', 3),
('Ali', 'Demir', '5333456789', '32345679012345', 'Aktif', 8),
('Ayse', 'Celik', '5344567890', '42346789012345', 'Aktif', 10),
('Fatma', 'Gul', '5355678901', '52346789012345', 'Izinli', 2),
('Veli', 'Ozturk', '5366789012', '63456789012345', 'Aktif', 7),
('Hasan', 'Aydin', '5377890123', '72456789012345', 'Aktif', 6),
('Murat', 'Sahin', '5388901234', '82456789012345', 'Aktif', 4),
('Zeynep', 'Kaya', '5399012345', '92356789012345', 'Izinli', 1),
('Kemal', 'Bozkurt', '5400123456', '12456789012346', 'Aktif', 12),
('Ozelm', 'Eren', '5411234567', '22346789012346', 'Aktif', 9),
('Emre', 'Turan', '5422345678', '32346789012346', 'Aktif', 5),
('Derya', 'Polat', '5433456789', '42356789012346', 'Izinli', 3),
('Huseyin', 'Yildiz', '5444567890', '53456789012346', 'Aktif', 7),
('Ismail', 'Aksu', '5455678901', '62356789012346', 'Aktif', 4),
('Seda', 'Yilmaz', '5466789012', '72346789012346', 'Izinli', 2),
('Baris', 'Beyaz', '5477890123', '82346789012346', 'Aktif', 11),
('Sinan', 'Kurt', '5488901234', '92345789012346', 'Aktif', 6),
('Sevim', 'Kara', '5499012345', '12345678012347', 'Aktif', 8),
('Cem', 'Gok', '5500123456', '22345678901347', 'Izinli', 1),
('Ebru', 'Keskin', '5511234567', '32345789012347', 'Aktif', 9),
('Sefa', 'Guzel', '5522345678', '42345689012347', 'Aktif', 6),
('Burak', 'Tosun', '5533456789', '52356789012347', 'Aktif', 7),
('Lale', 'Erdem', '5544567890', '62345689012347', 'Izinli', 3),
('Deniz', 'Simsek', '5555678901', '72345678012347', 'Aktif', 10),
('Emine', 'Yilmaz', '5566789012', '82345678912347', 'Aktif', 5),
('Zeynep', 'Ozkan', '5577890123', '92345678012347', 'Aktif', 8),
('Bulent', 'Cetin', '5588901234', '12345678012348', 'Izinli', 3),
('Nihal', 'Aslan', '5599012345', '22345678901248', 'Aktif', 4),
('Okan', 'Demirtas', '5600123456', '32345678901238', 'Izinli', 1),
('Recep', 'Koc', '5611234567', '42345678901234', 'Aktif', 7),
('Feryal', 'Kilic', '5622345678', '52345678901348', 'Aktif', 9),
('Emin', 'Toprak', '5633456789', '62345678902348', 'Aktif', 6),
('Sibel', 'Karatas', '5644567890', '72345678912348', 'Izinli', 2),
('Kenan', 'Bakirci', '5655678901', '82345678912348', 'Aktif', 11),
('Serap', 'Yazici', '5666789012', '92345678012348', 'Aktif', 5),
('Nazan', 'Yalcin', '5677890123', '12345689012349', 'Aktif', 8),
('Cengiz', 'Kurtulus', '5688901234', '22346789012349', 'Izinli', 3),
('Ahmet', 'Sozen', '5699012345', '32345689012349', 'Aktif', 4),
('Meryem', 'Keser', '5700123456', '42345789012349', 'Aktif', 6),
('Meltem', 'Demircan', '5711234567', '52456789012349', 'Izinli', 2),
('Selim', 'Aydin', '5722345678', '62345689012349', 'Aktif', 9),
('Serdar', 'Unal', '5733456789', '72345689012349', 'Aktif', 10),
('Huseyin', 'Buyuk', '5744567890', '82356789012349', 'Aktif', 7),
('Nursel', 'Tas', '5755678901', '92346789012349', 'Izinli', 1),
('Baran', 'Ozdemir', '5766789012', '134567890123410', 'Aktif', 8),
('Havva', 'Demirtas', '5777890123', '234567890123410', 'Aktif', 6),
('Ali', 'Colak', '5788901234', '323467890123410', 'Izinli', 4),
('Sinem', 'Ozbek', '5799012345', '424567890123410', 'Aktif', 12),
('Orhan', 'Bilir', '5800123456', '523567890123410', 'Aktif', 5);


insert into Operatorler(OtogarID, Ad, Soyad, Telefon, CalismaDurumu) values
(1, 'Ahmet', 'Yilmaz', '5311234567', 'Aktif'),
(2, 'Mehmet', 'Kara', '5322345678', 'Izinli'),
(3, 'Ali', 'Demir', '5333456789', 'Aktif'),
(4, 'Ayse', 'Celik', '5344567890', 'Aktif'),
(5, 'Fatma', 'Gul', '5355678901', 'Izinli'),
(6, 'Veli', 'Ozturk', '5366789012', 'Aktif'),
(7, 'Hasan', 'Aydin', '5377890123', 'Aktif'),
(8, 'Murat', 'Sahin', '5388901234', 'Aktif'),
(9, 'Zeynep', 'Kaya', '5399012345', 'Izinli'),
(10, 'Kemal', 'Bozkurt', '5400123456', 'Aktif'),
(11, 'Ozelm', 'Eren', '5411234567', 'Aktif'),
(12, 'Emre', 'Turan', '5422345678', 'Aktif'),
(13, 'Derya', 'Polat', '5433456789', 'Izinli'),
(14, 'Huseyin', 'Yildiz', '5444567890', 'Aktif'),
(15, 'Ismail', 'Aksu', '5455678901', 'Aktif'),
(16, 'Seda', 'Yilmaz', '5466789012', 'Izinli'),
(17, 'Baris', 'Beyaz', '5477890123', 'Aktif'),
(18, 'Sinan', 'Kurt', '5488901234', 'Aktif'),
(19, 'Sevim', 'Kara', '5499012345', 'Aktif'),
(20, 'Cem', 'Gok', '5500123456', 'Izinli'),
(21, 'Ebru', 'Keskin', '5511234567', 'Aktif'),
(22, 'Sefa', 'Guzel', '5522345678', 'Aktif'),
(23, 'Burak', 'Tosun', '5533456789', 'Aktif'),
(24, 'Lale', 'Erdem', '5544567890', 'Izinli'),
(25, 'Deniz', 'Simsek', '5555678901', 'Aktif'),
(26, 'Emine', 'Yilmaz', '5566789012', 'Aktif'),
(27, 'Zeynep', 'Ozkan', '5577890123', 'Aktif'),
(28, 'Bulent', 'Cetin', '5588901234', 'Izinli'),
(29, 'Nihal', 'Aslan', '5599012345', 'Aktif'),
(30, 'Okan', 'Demirtas', '5600123456', 'Izinli'),
(31, 'Recep', 'Koc', '5611234567', 'Aktif'),
(32, 'Feryal', 'Kilic', '5622345678', 'Aktif'),
(33, 'Emin', 'Toprak', '5633456789', 'Aktif'),
(34, 'Sibel', 'Karatas', '5644567890', 'Izinli'),
(35, 'Kenan', 'Bakirci', '5655678901', 'Aktif'),
(36, 'Serap', 'Yazici', '5666789012', 'Aktif'),
(37, 'Nazan', 'Yalcin', '5677890123', 'Aktif'),
(38, 'Cengiz', 'Kurtulus', '5688901234', 'Izinli'),
(39, 'Ahmet', 'Sozen', '5699012345', 'Aktif'),
(40, 'Meryem', 'Keser', '5700123456', 'Aktif'),
(41, 'Meltem', 'Demircan', '5711234567', 'Izinli'),
(42, 'Selim', 'Aydin', '5722345678', 'Aktif'),
(43, 'Serdar', 'Unal', '5733456789', 'Aktif'),
(44, 'Huseyin', 'Buyuk', '5744567890', 'Aktif'),
(45, 'Nursel', 'Tas', '5755678901', 'Izinli'),
(46, 'Baran', 'Ozdemir', '5766789012', 'Aktif'),
(47, 'Havva', 'Demirtas', '5777890123', 'Aktif'),
(48, 'Ali', 'Colak', '5788901234', 'Izinli'),
(49, 'Sinem', 'Ozbek', '5799012345', 'Aktif'),
(50, 'Orhan', 'Bilir', '5800123456', 'Aktif');


INSERT INTO GecisNoktalari (SeferID, SehirID, GecisSirasi, Kalkis_Saati, Varis_Saati)
VALUES
(1, 34, 1, '2025-01-01 08:00:00', '2025-01-01 09:00:00'),
(1, 16, 2, '2025-01-01 09:15:00', '2025-01-01 10:15:00'),
(1, 6, 3, '2025-01-01 10:30:00', '2025-01-01 11:30:00'),
(1, 17, 4, '2025-01-01 11:45:00', '2025-01-01 12:45:00'),
(2, 35, 1, '2025-01-02 08:00:00', '2025-01-02 09:30:00'),
(2, 41, 2, '2025-01-02 09:45:00', '2025-01-02 11:15:00'),
(2, 22, 3, '2025-01-02 11:30:00', '2025-01-02 13:00:00'),
(2, 8, 4, '2025-01-02 13:15:00', '2025-01-02 14:30:00'),
(2, 12, 5, '2025-01-02 14:45:00', '2025-01-02 15:45:00'),
(3, 1, 1, '2025-01-03 07:00:00', '2025-01-03 08:15:00'),
(3, 21, 2, '2025-01-03 08:30:00', '2025-01-03 09:45:00'),
(3, 42, 3, '2025-01-03 10:00:00', '2025-01-03 11:15:00'),
(4, 26, 1, '2025-01-04 06:00:00', '2025-01-04 07:30:00'),
(4, 44, 2, '2025-01-04 07:45:00', '2025-01-04 09:15:00'),
(4, 13, 3, '2025-01-04 09:30:00', '2025-01-04 10:30:00'),
(4, 37, 4, '2025-01-04 10:45:00', '2025-01-04 12:00:00'),
(4, 19, 5, '2025-01-04 12:15:00', '2025-01-04 13:30:00'),
(4, 28, 6, '2025-01-04 13:45:00', '2025-01-04 14:45:00'),
(5, 10, 1, '2025-01-05 05:00:00', '2025-01-05 06:30:00'),
(5, 20, 2, '2025-01-05 06:45:00', '2025-01-05 08:15:00'),
(5, 31, 3, '2025-01-05 08:30:00', '2025-01-05 10:00:00'),
(5, 50, 4, '2025-01-05 10:15:00', '2025-01-05 11:45:00'),
(5, 45, 5, '2025-01-05 12:00:00', '2025-01-05 13:30:00'),
(6, 17, 1, '2025-01-06 06:30:00', '2025-01-06 08:00:00'),
(6, 32, 2, '2025-01-06 08:15:00', '2025-01-06 09:45:00'),
(6, 22, 3, '2025-01-06 10:00:00', '2025-01-06 11:30:00'),
(6, 18, 4, '2025-01-06 11:45:00', '2025-01-06 13:15:00'),
(6, 46, 5, '2025-01-06 13:30:00', '2025-01-06 14:30:00'),
(7, 34, 1, '2025-01-07 04:00:00', '2025-01-07 05:30:00'),
(7, 12, 2, '2025-01-07 05:45:00', '2025-01-07 07:00:00'),
(7, 15, 3, '2025-01-07 07:15:00', '2025-01-07 08:30:00'),
(8, 45, 1, '2025-01-08 10:00:00', '2025-01-08 11:15:00'),
(8, 25, 2, '2025-01-08 11:30:00', '2025-01-08 12:30:00'),
(8, 33, 3, '2025-01-08 12:45:00', '2025-01-08 14:15:00'),
(8, 39, 4, '2025-01-08 14:30:00', '2025-01-08 15:45:00'),
(9, 50, 1, '2025-01-09 05:00:00', '2025-01-09 06:30:00'),
(9, 33, 2, '2025-01-09 06:45:00', '2025-01-09 08:15:00'),
(9, 18, 3, '2025-01-09 08:30:00', '2025-01-09 10:00:00'),
(9, 27, 4, '2025-01-09 10:15:00', '2025-01-09 11:30:00'),
(10, 30, 1, '2025-01-10 06:00:00', '2025-01-10 07:30:00'),
(10, 15, 2, '2025-01-10 07:45:00', '2025-01-10 09:15:00'),
(10, 13, 3, '2025-01-10 09:30:00', '2025-01-10 10:30:00'),
(10, 24, 4, '2025-01-10 10:45:00', '2025-01-10 12:00:00'),
(10, 47, 5, '2025-01-10 12:15:00', '2025-01-10 13:15:00'),
(10, 26, 6, '2025-01-10 13:30:00', '2025-01-10 14:30:00'),
(11, 34, 1, '2025-01-11 06:00:00', '2025-01-11 07:30:00'),
(11, 20, 2, '2025-01-11 07:45:00', '2025-01-11 09:00:00'),
(12, 37, 1, '2025-01-12 06:00:00', '2025-01-12 07:15:00'),
(12, 18, 2, '2025-01-12 07:30:00', '2025-01-12 08:45:00'),
(12, 9, 3, '2025-01-12 09:00:00', '2025-01-12 10:15:00'),
(12, 41, 4, '2025-01-12 10:30:00', '2025-01-12 11:30:00'),
(13, 26, 1, '2025-01-13 05:00:00', '2025-01-13 06:30:00'),
(13, 44, 2, '2025-01-13 06:45:00', '2025-01-13 08:00:00'),
(14, 34, 1, '2025-01-14 07:00:00', '2025-01-14 08:15:00'),
(14, 50, 2, '2025-01-14 08:30:00', '2025-01-14 09:45:00'),
(15, 10, 1, '2025-01-15 05:30:00', '2025-01-15 07:00:00'),
(15, 13, 2, '2025-01-15 07:15:00', '2025-01-15 08:30:00'),
(15, 26, 3, '2025-01-15 08:45:00', '2025-01-15 10:00:00'),
(16, 22, 1, '2025-01-16 06:00:00', '2025-01-16 07:15:00'),
(16, 38, 2, '2025-01-16 07:30:00', '2025-01-16 08:45:00'),
(16, 47, 3, '2025-01-16 09:00:00', '2025-01-16 10:30:00'),
(16, 30, 4, '2025-01-16 10:45:00', '2025-01-16 12:00:00'),
(17, 14, 1, '2025-01-17 05:00:00', '2025-01-17 06:30:00'),
(17, 19, 2, '2025-01-17 06:45:00', '2025-01-17 08:15:00'),
(17, 45, 3, '2025-01-17 08:30:00', '2025-01-17 09:30:00'),
(17, 50, 4, '2025-01-17 09:45:00', '2025-01-17 11:00:00'),
(18, 7, 1, '2025-01-18 06:30:00', '2025-01-18 08:00:00'),
(18, 26, 2, '2025-01-18 08:15:00', '2025-01-18 09:30:00'),
(18, 40, 3, '2025-01-18 09:45:00', '2025-01-18 11:00:00'),
(18, 31, 4, '2025-01-18 11:15:00', '2025-01-18 12:15:00'),
(18, 13, 5, '2025-01-18 12:30:00', '2025-01-18 13:30:00'),
(19, 20, 1, '2025-01-19 06:00:00', '2025-01-19 07:00:00'),
(19, 15, 2, '2025-01-19 07:15:00', '2025-01-19 08:15:00'),
(19, 23, 3, '2025-01-19 08:30:00', '2025-01-19 09:30:00'),
(19, 8, 4, '2025-01-19 09:45:00', '2025-01-19 11:00:00'),
(19, 41, 5, '2025-01-19 11:15:00', '2025-01-19 12:30:00'),
(20, 12, 1, '2025-01-20 07:00:00', '2025-01-20 08:30:00'),
(20, 17, 2, '2025-01-20 08:45:00', '2025-01-20 10:15:00'),
(20, 35, 3, '2025-01-20 10:30:00', '2025-01-20 12:00:00'),
(21, 6, 1, '2025-01-21 06:00:00', '2025-01-21 07:30:00'),
(21, 31, 2, '2025-01-21 07:45:00', '2025-01-21 09:00:00'),
(21, 48, 3, '2025-01-21 09:15:00', '2025-01-21 10:30:00'),
(21, 19, 4, '2025-01-21 10:45:00', '2025-01-21 12:00:00'),
(22, 50, 1, '2025-01-22 06:00:00', '2025-01-22 07:00:00'),
(22, 28, 2, '2025-01-22 07:15:00', '2025-01-22 08:15:00'),
(22, 36, 3, '2025-01-22 08:30:00', '2025-01-22 09:30:00'),
(22, 42, 4, '2025-01-22 09:45:00', '2025-01-22 11:00:00'),
(23, 9, 1, '2025-01-23 06:30:00', '2025-01-23 08:00:00'),
(23, 27, 2, '2025-01-23 08:15:00', '2025-01-23 09:30:00'),
(23, 20, 3, '2025-01-23 09:45:00', '2025-01-23 11:00:00'),
(24, 10, 1, '2025-01-24 06:00:00', '2025-01-24 07:30:00'),
(24, 15, 2, '2025-01-24 07:45:00', '2025-01-24 09:00:00'),
(24, 41, 3, '2025-01-24 09:15:00', '2025-01-24 10:30:00'),
(24, 32, 4, '2025-01-24 10:45:00', '2025-01-24 12:00:00'),
(25, 7, 1, '2025-01-25 05:00:00', '2025-01-25 06:30:00'),
(25, 45, 2, '2025-01-25 06:45:00', '2025-01-25 08:00:00'),
(25, 30, 3, '2025-01-25 08:15:00', '2025-01-25 09:30:00'),
(26, 3, 1, '2025-01-26 07:00:00', '2025-01-26 08:15:00'),
(26, 39, 2, '2025-01-26 08:30:00', '2025-01-26 09:45:00'),
(26, 25, 3, '2025-01-26 10:00:00', '2025-01-26 11:15:00'),
(26, 50, 4, '2025-01-26 11:30:00', '2025-01-26 12:45:00'),
(27, 22, 1, '2025-01-27 07:00:00', '2025-01-27 08:30:00'),
(27, 35, 2, '2025-01-27 08:45:00', '2025-01-27 10:15:00'),
(27, 46, 3, '2025-01-27 10:30:00', '2025-01-27 12:00:00'),
(27, 50, 4, '2025-01-27 12:15:00', '2025-01-27 13:45:00'),
(28, 3, 1, '2025-01-28 05:00:00', '2025-01-28 06:15:00'),
(28, 17, 2, '2025-01-28 06:30:00', '2025-01-28 07:45:00'),
(28, 39, 3, '2025-01-28 08:00:00', '2025-01-28 09:15:00'),
(28, 43, 4, '2025-01-28 09:30:00', '2025-01-28 10:45:00'),
(28, 10, 5, '2025-01-28 11:00:00', '2025-01-28 12:30:00'),
(29, 11, 1, '2025-01-29 06:30:00', '2025-01-29 07:30:00'),
(29, 24, 2, '2025-01-29 07:45:00', '2025-01-29 09:00:00'),
(29, 38, 3, '2025-01-29 09:15:00', '2025-01-29 10:30:00'),
(29, 48, 4, '2025-01-29 10:45:00', '2025-01-29 12:00:00'),
(30, 14, 1, '2025-01-30 05:30:00', '2025-01-30 06:45:00'),
(30, 30, 2, '2025-01-30 07:00:00', '2025-01-30 08:15:00'),
(30, 45, 3, '2025-01-30 08:30:00', '2025-01-30 09:45:00'),
(30, 50, 4, '2025-01-30 10:00:00', '2025-01-30 11:15:00'),
(30, 18, 5, '2025-01-30 11:30:00', '2025-01-30 12:30:00'),
(31, 6, 1, '2025-01-31 06:00:00', '2025-01-31 07:15:00'),
(31, 25, 2, '2025-01-31 07:30:00', '2025-01-31 08:45:00'),
(31, 42, 3, '2025-01-31 09:00:00', '2025-01-31 10:15:00'),
(31, 9, 4, '2025-01-31 10:30:00', '2025-01-31 11:45:00'),
(32, 5, 1, '2025-02-01 07:00:00', '2025-02-01 08:00:00'),
(32, 16, 2, '2025-02-01 08:15:00', '2025-02-01 09:15:00'),
(32, 31, 3, '2025-02-01 09:30:00', '2025-02-01 10:30:00'),
(32, 40, 4, '2025-02-01 10:45:00', '2025-02-01 11:45:00'),
(33, 20, 1, '2025-02-02 06:30:00', '2025-02-02 07:45:00'),
(33, 36, 2, '2025-02-02 08:00:00', '2025-02-02 09:15:00'),
(33, 49, 3, '2025-02-02 09:30:00', '2025-02-02 10:45:00'),
(33, 11, 4, '2025-02-02 11:00:00', '2025-02-02 12:15:00'),
(34, 14, 1, '2025-02-03 07:00:00', '2025-02-03 08:30:00'),
(34, 23, 2, '2025-02-03 08:45:00', '2025-02-03 10:15:00'),
(34, 40, 3, '2025-02-03 10:30:00', '2025-02-03 12:00:00'),
(35, 19, 1, '2025-02-04 06:30:00', '2025-02-04 08:00:00'),
(35, 32, 2, '2025-02-04 08:15:00', '2025-02-04 09:45:00'),
(35, 41, 3, '2025-02-04 10:00:00', '2025-02-04 11:30:00'),
(36, 3, 1, '2025-02-05 05:00:00', '2025-02-05 06:15:00'),
(36, 15, 2, '2025-02-05 06:30:00', '2025-02-05 07:45:00'),
(36, 22, 3, '2025-02-05 08:00:00', '2025-02-05 09:15:00'),
(37, 7, 1, '2025-02-06 07:00:00', '2025-02-06 08:30:00'),
(37, 12, 2, '2025-02-06 08:45:00', '2025-02-06 10:15:00'),
(37, 30, 3, '2025-02-06 10:30:00', '2025-02-06 12:00:00'),
(38, 5, 1, '2025-02-07 06:00:00', '2025-02-07 07:30:00'),
(38, 29, 2, '2025-02-07 07:45:00', '2025-02-07 09:00:00'),
(38, 33, 3, '2025-02-07 09:15:00', '2025-02-07 10:30:00'),
(39, 9, 1, '2025-02-08 05:30:00', '2025-02-08 06:45:00'),
(39, 26, 2, '2025-02-08 07:00:00', '2025-02-08 08:15:00'),
(39, 46, 3, '2025-02-08 08:30:00', '2025-02-08 09:45:00'),
(40, 18, 1, '2025-02-09 06:00:00', '2025-02-09 07:30:00'),
(40, 28, 2, '2025-02-09 07:45:00', '2025-02-09 09:15:00'),
(40, 39, 3, '2025-02-09 09:30:00', '2025-02-09 10:45:00'),
(40, 47, 4, '2025-02-09 11:00:00', '2025-02-09 12:15:00'),
(41, 10, 1, '2025-02-11 06:30:00', '2025-02-11 07:30:00'),
(41, 25, 2, '2025-02-11 07:45:00', '2025-02-11 09:00:00'),
(41, 37, 3, '2025-02-11 09:15:00', '2025-02-11 10:30:00'),
(41, 48, 4, '2025-02-11 10:45:00', '2025-02-11 12:00:00'),
(42, 14, 1, '2025-02-12 05:00:00', '2025-02-12 06:15:00'),
(42, 18, 2, '2025-02-12 06:30:00', '2025-02-12 07:45:00'),
(42, 29, 3, '2025-02-12 08:00:00', '2025-02-12 09:15:00'),
(42, 46, 4, '2025-02-12 09:30:00', '2025-02-12 10:45:00'),
(42, 50, 5, '2025-02-12 11:00:00', '2025-02-12 12:30:00'),
(43, 4, 1, '2025-02-13 06:00:00', '2025-02-13 07:00:00'),
(43, 16, 2, '2025-02-13 07:15:00', '2025-02-13 08:15:00'),
(43, 21, 3, '2025-02-13 08:30:00', '2025-02-13 09:30:00'),
(43, 30, 4, '2025-02-13 09:45:00', '2025-02-13 10:45:00'),
(43, 44, 5, '2025-02-13 11:00:00', '2025-02-13 12:00:00'),
(44, 9, 1, '2025-02-14 06:30:00', '2025-02-14 07:30:00'),
(44, 23, 2, '2025-02-14 07:45:00', '2025-02-14 09:00:00'),
(44, 32, 3, '2025-02-14 09:15:00', '2025-02-14 10:30:00'),
(44, 42, 4, '2025-02-14 10:45:00', '2025-02-14 12:00:00'),
(45, 5, 1, '2025-02-15 05:30:00', '2025-02-15 06:45:00'),
(45, 15, 2, '2025-02-15 07:00:00', '2025-02-15 08:15:00'),
(45, 28, 3, '2025-02-15 08:30:00', '2025-02-15 09:45:00'),
(45, 34, 4, '2025-02-15 10:00:00', '2025-02-15 11:15:00'),
(46, 11, 1, '2025-02-16 06:00:00', '2025-02-16 07:15:00'),
(46, 20, 2, '2025-02-16 07:30:00', '2025-02-16 08:45:00'),
(46, 36, 3, '2025-02-16 09:00:00', '2025-02-16 10:15:00'),
(46, 47, 4, '2025-02-16 10:30:00', '2025-02-16 11:45:00'),
(46, 50, 5, '2025-02-16 12:00:00', '2025-02-16 13:15:00'),
(47, 8, 1, '2025-02-17 06:30:00', '2025-02-17 07:30:00'),
(47, 25, 2, '2025-02-17 07:45:00', '2025-02-17 09:00:00'),
(47, 31, 3, '2025-02-17 09:15:00', '2025-02-17 10:30:00'),
(47, 43, 4, '2025-02-17 10:45:00', '2025-02-17 12:00:00'),
(48, 3, 1, '2025-02-18 05:30:00', '2025-02-18 06:45:00'),
(48, 17, 2, '2025-02-18 07:00:00', '2025-02-18 08:15:00'),
(48, 28, 3, '2025-02-18 08:30:00', '2025-02-18 09:45:00'),
(48, 41, 4, '2025-02-18 10:00:00', '2025-02-18 11:15:00'),
(49, 6, 1, '2025-02-19 06:00:00', '2025-02-19 07:15:00'),
(49, 21, 2, '2025-02-19 07:30:00', '2025-02-19 08:45:00'),
(49, 30, 3, '2025-02-19 09:00:00', '2025-02-19 10:15:00'),
(49, 37, 4, '2025-02-19 10:30:00', '2025-02-19 11:45:00'),
(50, 13, 1, '2025-02-20 06:00:00', '2025-02-20 07:15:00'),
(50, 22, 2, '2025-02-20 07:30:00', '2025-02-20 08:45:00'),
(50, 33, 3, '2025-02-20 09:00:00', '2025-02-20 10:15:00'),
(50, 49, 4, '2025-02-20 10:30:00', '2025-02-20 11:45:00');


go
CREATE PROCEDURE sp_InsertYolcu
    @Ad NVARCHAR(50),
    @Soyad NVARCHAR(50),
    @Eposta NVARCHAR(100),
    @Sifre NVARCHAR(255),
    @Telefon NVARCHAR(10) = NULL,
    @Adres NVARCHAR(255) = NULL,
    @Cinsiyet NVARCHAR(10) = NULL
AS
BEGIN
    INSERT INTO Yolcular (Ad, Soyad, Eposta, Sifre, Telefon, Adres, Cinsiyet)
    VALUES (@Ad, @Soyad, @Eposta, @Sifre, @Telefon, @Adres, @Cinsiyet);
END;
go

go
CREATE PROCEDURE sp_InsertOtobus
    @PlakaNo NVARCHAR(9),
    @Kapasite INT,
    @OtobusTuru NVARCHAR(10) = NULL,
    @Model SMALLINT = NULL,
    @Ozellikler NVARCHAR(100) = NULL
AS
BEGIN
    INSERT INTO Otobusler (PlakaNo, Kapasite, OtobusTuru, Model, Ozellikler)
    VALUES (@PlakaNo, @Kapasite, @OtobusTuru, @Model, @Ozellikler);
END;
go


go
CREATE PROCEDURE sp_InsertSehir
    @SehirAdi NVARCHAR(15)
AS
BEGIN
    INSERT INTO Sehirler (SehirAdi)
    VALUES (@SehirAdi);
END;
go

go
CREATE PROCEDURE sp_InsertOtogar
    @SehirID INT,
    @OtogarAdi NVARCHAR(60)
AS
BEGIN
    INSERT INTO Otogarlar (SehirID, OtogarAdi)
    VALUES (@SehirID, @OtogarAdi);
END;
go

go
CREATE PROCEDURE sp_InsertSefer
    @OtobusID INT,
    @KalkisOtogarID INT,
    @VarisOtogarID INT,
    @Kalkis_Tarihi DATETIME,
    @Varis_Tarihi DATETIME,
    @Fiyat DECIMAL(7, 2),
    @Durum NVARCHAR(20) = NULL
AS
BEGIN
    INSERT INTO Seferler (OtobusID, KalkisOtogarID, VarisOtogarID, Kalkis_Tarihi, Varis_Tarihi, Fiyat, Durum)
    VALUES (@OtobusID, @KalkisOtogarID, @VarisOtogarID, @Kalkis_Tarihi, @Varis_Tarihi, @Fiyat, @Durum);
END;
go

go
CREATE PROCEDURE sp_InsertRezervasyon
    @SeferID INT,
    @YolcuID INT,
    @KoltukNo INT,
    @Rez_Tarihi DATETIME,
    @YolculukTuru NVARCHAR(20) = NULL,
    @Durum NVARCHAR(20) = NULL
AS
BEGIN
    INSERT INTO Rezervasyonlar (SeferID, YolcuID, KoltukNo, Rez_Tarihi, YolculukTuru, Durum)
    VALUES (@SeferID, @YolcuID, @KoltukNo, @Rez_Tarihi, @YolculukTuru, @Durum);
END;
go

go
CREATE PROCEDURE sp_InsertOdeme
    @Rez_ID INT,
    @Od_Tarihi DATETIME,
    @Od_Yontemi NVARCHAR(20),
    @Durum NVARCHAR(20) = NULL
AS
BEGIN
    INSERT INTO Odemeler (Rez_ID, Od_Tarihi, Od_Yontemi, Durum)
    VALUES (@Rez_ID, @Od_Tarihi, @Od_Yontemi, @Durum);
END;
go

go
CREATE PROCEDURE sp_InsertBildirim
    @YolcuID INT,
    @SeferID INT,
    @Baslik NVARCHAR(50),
    @MesajIcerigi NVARCHAR(MAX),
    @BildirimTuru NVARCHAR(30) = NULL
AS
BEGIN
    INSERT INTO Bildirimler (YolcuID, SeferID, Baslik, MesajIcerigi, BildirimTuru)
    VALUES (@YolcuID, @SeferID, @Baslik, @MesajIcerigi, @BildirimTuru);
END;
go

go
CREATE PROCEDURE sp_InsertSikayet
    @YolcuID INT,
    @SeferID INT,
    @Konu NVARCHAR(100),
    @Aciklama NVARCHAR(MAX),
    @Tarih DATETIME,
    @Durum NVARCHAR(20) = NULL
AS
BEGIN
    INSERT INTO Sikayetler (YolcuID, SeferID, Konu, Aciklama, Tarih, Durum)
    VALUES (@YolcuID, @SeferID, @Konu, @Aciklama, @Tarih, @Durum);
END;
go

go
CREATE PROCEDURE sp_InsertSofor
    @Ad NVARCHAR(30),
    @Soyad NVARCHAR(30),
    @Telefon NVARCHAR(10) = NULL,
    @EhliyetNo NVARCHAR(15),
    @CalismaDurumu NVARCHAR(20) = NULL,
    @DeneyimYili SMALLINT = NULL
AS
BEGIN
    INSERT INTO Soforler (Ad, Soyad, Telefon, EhliyetNo, CalismaDurumu, DeneyimYili)
    VALUES (@Ad, @Soyad, @Telefon, @EhliyetNo, @CalismaDurumu, @DeneyimYili);
END;
go

go
CREATE PROCEDURE sp_InsertOperator
    @OtogarID INT,
    @Ad NVARCHAR(30),
    @Soyad NVARCHAR(30),
    @Telefon NVARCHAR(10) = NULL,
    @CalismaDurumu NVARCHAR(20) = NULL
AS
BEGIN
    INSERT INTO Operatorler (OtogarID, Ad, Soyad, Telefon, CalismaDurumu)
    VALUES (@OtogarID, @Ad, @Soyad, @Telefon, @CalismaDurumu);
END;
go

go
CREATE PROCEDURE sp_InsertGecisNoktasi
    @SeferID INT,
    @SehirID INT,
    @GecisSirasi INT,
    @Kalkis_Saati DATETIME = NULL,
    @Varis_Saati DATETIME = NULL
AS
BEGIN
    INSERT INTO GecisNoktalari (SeferID, SehirID, GecisSirasi, Kalkis_Saati, Varis_Saati)
    VALUES (@SeferID, @SehirID, @GecisSirasi, @Kalkis_Saati, @Varis_Saati);
END;
go

CREATE TRIGGER trg_RezervasyonKoltukKontrol
ON Rezervasyonlar
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT SeferID, KoltukNo, COUNT(*)
        FROM Rezervasyonlar
        GROUP BY SeferID, KoltukNo
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR ('Bu koltuk zaten rezerve edilmiş!', 16, 1);
        ROLLBACK;
    END
END;


INSERT INTO Seferler (OtobusID, KalkisOtogarID, VarisOtogarID, Kalkis_Tarihi, Varis_Tarihi, Fiyat, Durum)
VALUES (1, 1, 2, '2025-01-10 10:00:00', '2025-01-10 14:00:00', 150.00, 'Aktif');

INSERT INTO Rezervasyonlar (SeferID, YolcuID, KoltukNo, Rez_Tarihi, YolculukTuru, Durum)
VALUES (1, 1, 5, GETDATE(), 'Tek Yon', 'Onaylandi');

INSERT INTO Rezervasyonlar (SeferID, YolcuID, KoltukNo, Rez_Tarihi, YolculukTuru, Durum)
VALUES (1, 2, 5, GETDATE(), 'Tek Yon', 'Onaylandi');



CREATE TABLE YolcuDegisiklikLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    YolcuID INT NOT NULL,
    EskiEposta NVARCHAR(100),
    YeniEposta NVARCHAR(100),
    EskiTelefon NVARCHAR(10),
    YeniTelefon NVARCHAR(10),
    DegisimTarihi DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (YolcuID) REFERENCES Yolcular(YolcuID)
);
go
CREATE TRIGGER trg_YolcuUpdate
ON Yolcular
AFTER UPDATE
AS
BEGIN
  IF UPDATE(Eposta) OR UPDATE(Telefon)
    BEGIN
        INSERT INTO YolcuDegisiklikLog (YolcuID, EskiEposta, YeniEposta, EskiTelefon, YeniTelefon)
        SELECT 
            d.YolcuID,
            d.Eposta AS EskiEposta,
            i.Eposta AS YeniEposta,
            d.Telefon AS EskiTelefon,
            i.Telefon AS YeniTelefon
        FROM deleted d
        INNER JOIN inserted i ON d.YolcuID = i.YolcuID;
    END
END;  
go

INSERT INTO Yolcular (Ad, Soyad, Eposta, Sifre, Telefon, Adres, Cinsiyet)
VALUES 
('Ahmet', 'Kenj', 'ahmet.yilmaz@example.com', 'sifre123', '5551234567', 'Ankara', 'Erkek');


UPDATE Yolcular
SET Eposta = 'ahmet.yeni@example.com', Telefon = '5441234567'
WHERE Ad = 'Ahmet' AND Soyad = 'Kenj';

SELECT * FROM YolcuDegisiklikLog;

go
CREATE TRIGGER trg_SeferTarihKontrol
ON Seferler
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Kalkis_Tarihi >= Varis_Tarihi
    )
    BEGIN
        RAISERROR ('Kalkış tarihi varış tarihinden önce olmalıdır!', 16, 1);
        ROLLBACK;
    END
END;
go

INSERT INTO Seferler (OtobusID, KalkisOtogarID, VarisOtogarID, Kalkis_Tarihi, Varis_Tarihi, Fiyat, Durum)
VALUES (1, 1, 2, '2025-01-10 14:00:00', '2025-01-10 12:00:00', 150.00, 'Aktif');


BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Rezervasyonlar (SeferID, YolcuID, KoltukNo, Rez_Tarihi, YolculukTuru, Durum)
    VALUES (1, 1, 10, GETDATE(), 'Tek Yon', 'Onaylandi');

    DECLARE @RezID INT = SCOPE_IDENTITY();

    COMMIT TRANSACTION;
    PRINT 'Rezervasyon ve odeme islemleri basariyla tamamlandi.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;

    PRINT 'Hata olustu: ' + ERROR_MESSAGE();
END CATCH;


go
CREATE PROCEDURE GetYolcuRezervasyonBilgileri
    @YolcuID INT
AS
BEGIN
    SELECT 
        r.Rez_ID,
        r.KoltukNo,
        r.Rez_Tarihi,
        r.YolculukTuru,
        r.Durum AS RezervasyonDurumu,
        s.Kalkis_Tarihi,
        s.Varis_Tarihi,
        s.Fiyat,
        (SELECT SehirAdi FROM Sehirler WHERE SehirID = (SELECT SehirID FROM Otogarlar WHERE OtogarID = s.KalkisOtogarID)) AS KalkisSehri,
        (SELECT SehirAdi FROM Sehirler WHERE SehirID = (SELECT SehirID FROM Otogarlar WHERE OtogarID = s.VarisOtogarID)) AS VarisSehri
    FROM Rezervasyonlar r
    INNER JOIN Seferler s ON r.SeferID = s.SeferID
    WHERE r.YolcuID = @YolcuID;
END;
go

EXEC GetYolcuRezervasyonBilgileri @YolcuID = 3;

CREATE PROCEDURE SpSoforDurumGuncelle
    @SoforID INT
AS
BEGIN
    -- Şoförün çalışma durumunu günceller
    UPDATE Soforler
    SET CalismaDurumu = 'Izinli'
    WHERE SoforID = @SoforID AND CalismaDurumu = 'Aktif';

    -- Etkilenen satır sayısını kontrol eder
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'Şoför zaten izinli veya geçersiz bir ID girdiniz.';
    END
    ELSE
    BEGIN
        PRINT 'Şoför durumu başarıyla izinli olarak güncellendi.';
    END
END;

EXEC SpSoforDurumGuncelle @SoforID =5;


select Eposta,Telefon from Yolcular

where Adres='Hatay';


select SoforID,Ad,Soyad from Soforler

where Ad like '%A';


select SeferID,Fiyat,Kalkis_Tarihi from Seferler

where Fiyat between 200 and 300

order by Fiyat,Kalkis_Tarihi;



select Kalkis_Tarihi,Fiyat,YolculukTuru from Rezervasyonlar r join Seferler s  
on r.SeferID=s.SeferID;


