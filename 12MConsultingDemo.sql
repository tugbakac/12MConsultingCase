--değişkenlerin tanımlanması
declare @malkodu int;
declare @baslangicTarih int;
declare @bitisTarih int;

--geçici tablo oluşturulması
CREATE TABLE #STINewTable
(SiraNo INT IDENTITY(1,1), IslemTur SMALLINT, EvrakNo VARCHAR(16), Tarih INT, GirisMiktar NUMERIC(25,6), CikisMiktar NUMERIC(25,6), StokMiktar NUMERIC(25,6));

--geçici tabloya verilerin eklenmesi
Insert into #STINewTable(IslemTur,EvrakNo,Tarih,GirisMiktar,CikisMiktar,StokMiktar)
select * from STI

--sql kapandığında silinecek olsa da geçici tablo silinmek istenirse aşağıdaki kod kullanılacak
DROP TABLE #STINewTable;

--islemTur alanı için if kullanılması denendi
if dbo.STI.IslemTur>=0
begin
	select "Giriş" as [IslemTur],EvrakNo, Tarih, Miktar as [Giris Miktar], Miktar as [Cikis Miktar] from STI
end

--procedür ile tablo verileri listelendi
create proc proc_Listele
as 
select IslemTur,EvrakNo, Tarih, Miktar as [Giris Miktar], Miktar as [Cikis Miktar] from STI

proc_Listele
