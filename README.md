# OtobusBiletiRezervasyonSistemi
## Proje Başlığı : Otobüs Bileti Rezervasyon Sistemi
## Proje Ekibindeki Kişiler :
220260603 Ammar Al Jasem  

210260601 Ammar Kenj  

230260603 Veysel Karani Kılıçerkan

## Projenin Amacı :
otobüs bileti rezervasyonu için bir veritabanı sistemi geliştirmeyi amaçlamaktadır.
Sistem, yolcuların otobüs seferleri için bilet rezervasyonu yapmalarını, ödemelerini yönetmelerini sağlarken yöneticilerin sefer, otobüs ve güzergah bilgilerini düzenleyebileceği bir yapı sunacaktır.
Bu sayede, kullanıcıların hızlı ve güvenilir bir şekilde rezervasyon yapması ve yönetici işlemlerinin merkezi olarak yönetilmesi hedeflenmektedir.

## Varlıklar ve niteliker

### Yolcular 
•	YolcuID (Birincil Anahtar)
•	Ad
•	Soyad
•	E-posta
•	Şifre
•	Telefon
•	Adres
•	Cinsiyet
________________________________________
### Otobüsler 
•	OtobüsID  (Birincil Anahtar)
•	PlakaNo
•	Kapasite
•	OtobüsTürü
•	Model 
•	Özellikler 
________________________________________
### Şehirler
•	ŞehirID (Birincil Anahtar)
•	ŞehirAdı
•	Bölge
______________________________________
### Rezervasyonlar
•	R_ID (Birincil Anahtar)
•	SeferID (Yabancı Anahtar)
•	YolcuID (Yabancı Anahtar)
•	KoltukNo
•	R_Tarihi
•	YolculukTürü 
•	Durum
________________________________________
### Otogarlar
•	OtogarID (Birincil Anahtar)
•	ŞehirID (Yabancı Anahtar)
•	OtogarAdı
•	Adres
________________________________________
### Seferler
•	SeferID (Birincil Anahtar)
•	OtobusID (Yabancı Anahtar)
•	KalkışOtogarID (Yabancı Anahtar)
•	VarışOtogarID (Yabancı Anahtar)
• k_Tarihi
•	V_Tarihi
•	Fiyat
•	Durum
________________________________________
### Ödemeler
•	ÖdemeID (Birincil Anahtar)
•	R_ID (Yabancı Anahtar)
•	Tutar
•	Ö_Tarihi
•	Ö_Yöntemi
•	Durum
________________________________________
### Bildirimler
•	BildirimID (Birincil Anahtar)
•	YolcuID (Yabancı Anahtar)
•	SeferID (Yabancı Anahtar)
•	Başlık
•	Mesajİçeriği
•	Okundu
•	BildirimTürü
 ________________________________________
### Şikayetler 
•	ŞikayetID (Birincil Anahtar)
•	YolcuID (Yabancı Anahtar)
•	SeferID (Yabancı Anahtar)
•	Konu
•	Açıklama
•	Tarih
•	Durum
________________________________________
### Şoförler 
•	ŞoförID (Birincil Anahtar)
•	Ad
•	Soyad
•	Telefon
•	EhliyetNo
•	ÇalışmaDurumu
•	DeneyimYılı
________________________________________
### Operatörler 
•	OperatörID (Birincil Anahtar)
•	OtogarID (Yabancı Anahtar)
•	Ad
•	Soyad
•	Telefon
•	ÇalışmaDurumu
________________________________________
### Geçiş Noktaları 
•	GeçişID (Birincil Anahtar)
•	SeferID (Yabancı Anahtar)
•	ŞehirID (Yabancı Anahtar)
•	GeçişSırası
•	K_Saati
•	V_Saati



### İlişkiler 
1.	Yolcular - Rezervasyonlar: 1-N (Bir yolcu birden fazla rezervasyon yapabilir.)
2.	Yolcular - Şikayetler: 1-N (Bir yolcu birden fazla şikayette bulunabilir.)
3.	Yolcular - Bildirimler: 1-N (Bir yolcuya birden fazla bildirim gönderilebilir.)
4.	Otobüsler - Seferler: 1-N (Bir otobüs birden fazla sefere çıkabilir.)
5.	Şehirler - Otogarlar: 1-N (Bir şehirde birden fazla otogar olabilir.)
6.	Seferler - Rezervasyonlar: 1-N (Bir sefere birden fazla rezervasyon yapılabilir.)
7.	Rezervasyonlar - Ödemeler: 1-1 (Her rezervasyon için bir ödeme yapılır.)
8.	Rezervasyonlar - Bildirimler: 1-N (Bir rezervasyon için birden fazla bildirim yapılabilir.)
9.	Seferler - Şikayetler: 1-N (Bir sefere birden fazla şikayet yapılabilir.)
10.	Şoförler - Seferler: 1-N (Bir şoför birden fazla sefere çıkabilir.)
11.	Geçiş Noktaları - Seferler: 1-N (Bir sefer birden fazla şehirden geçebilir.)
12.	Geçiş Noktaları - Şehirler: N-1 (Bir şehirden birden fazla sefer geçebilir.)
13.	Yolcular - Ödemeler: 1-N (Bir yolcu birden fazla ödeme gerçekleştirebilir.)
14.	Operatörler - Seferler: 1-N (Bir operatör birden fazla sefere sahip olabilir.)
