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
 INSERT INTO Yolcular (Ad, Soyad, Eposta, Sifre, Telefon, Adres, 
Cinsiyet)
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
 INSERT INTO Otobusler (PlakaNo, Kapasite, OtobusTuru, Model, 
Ozellikler)
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
 INSERT INTO Seferler (OtobusID, KalkisOtogarID, VarisOtogarID, 
Kalkis_Tarihi, Varis_Tarihi, Fiyat, Durum)
 VALUES (@OtobusID, @KalkisOtogarID, @VarisOtogarID, @Kalkis_Tarihi, 
@Varis_Tarihi, @Fiyat, @Durum);
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
 INSERT INTO Rezervasyonlar (SeferID, YolcuID, KoltukNo, Rez_Tarihi, 
YolculukTuru, Durum)
 VALUES (@SeferID, @YolcuID, @KoltukNo, @Rez_Tarihi, @YolculukTuru, 
@Durum);
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
 INSERT INTO Bildirimler (YolcuID, SeferID, Baslik, MesajIcerigi, 
BildirimTuru)
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
 INSERT INTO Sikayetler (YolcuID, SeferID, Konu, Aciklama, Tarih, 
Durum)
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
 INSERT INTO Soforler (Ad, Soyad, Telefon, EhliyetNo, CalismaDurumu, 
DeneyimYili)
 VALUES (@Ad, @Soyad, @Telefon, @EhliyetNo, @CalismaDurumu, 
@DeneyimYili);
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
 INSERT INTO GecisNoktalari (SeferID, SehirID, GecisSirasi, 
Kalkis_Saati, Varis_Saati)
 VALUES (@SeferID, @SehirID, @GecisSirasi, @Kalkis_Saati, 
@Varis_Saati);
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
 RAISERROR ('Bu koltuk zaten rezerve edilmiþ!', 16, 1);
 ROLLBACK;
 END
END;
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
 INSERT INTO YolcuDegisiklikLog (YolcuID, EskiEposta, YeniEposta, 
EskiTelefon, YeniTelefon)
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
 RAISERROR ('Kalkýþ tarihi varýþ tarihinden önce olmalýdýr!', 16, 
1);
 ROLLBACK;
 END
END;
go
BEGIN TRY
 BEGIN TRANSACTION;
 INSERT INTO Rezervasyonlar (SeferID, YolcuID, KoltukNo, Rez_Tarihi, 
YolculukTuru, Durum)
 VALUES (1, 1, 10, GETDATE(), 'Tek Yön', 'Onaylandý');
 DECLARE @RezID INT = SCOPE_IDENTITY();
 COMMIT TRANSACTION;
 PRINT 'Rezervasyon ve ödeme iþlemleri baþarýyla tamamlandý.';
END TRY
BEGIN CATCH
 ROLLBACK TRANSACTION;
 PRINT 'Hata oluþtu: ' + ERROR_MESSAGE();
END CATCH;