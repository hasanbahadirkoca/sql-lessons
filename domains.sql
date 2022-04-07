-- Eğer varsa tabloyu veritabanından kaldırıyoruz.
if exists(select * from domains) drop table domains

-- domains adındaki tabloyu oluşturuyoruz.
create table domains (
    DomainId int primary key,
    Domain varchar(10)
);
select * from domains;

-- Tabloya yeni bir giriş ekliyoruz.
insert into domains values (1, "thehbk.net");
select * from domains;

-- domains tablosundaki verileri ekrana listeliyoruz.
select * from domains;
select * from domains;

-- Tabloya yeni bir giriş ekliyoruz.
insert into domains values (2, "thehbk.com");
select * from domains;

-- Tablodaki DomainId değeri 1 veya 2 olan girişleri siliyoruz.
delete from domains where (DomainId = 1) or (DomainId = 2);
select * from domains;

-- Tablıya yeni bir giriş ekliyoruz.
insert into domains values (1, "thehbk.net");
select * from domains;

-- Tabloya çoklu veri girişi yapıyoruz.
insert into domains values
	(2, "thehbk.com"),
	(3, "thehbk.tech");
select * from domains;

-- thehbk.tech 10 karakteri geçtiği için sorun yaşadık.

-- Domain sütununun varchar uzunluğunu 10'dan 20'ye çıkartıyoruz.
alter table domains modify column Domain varchar(20);
-- Varchar uzunluğunu 20 karaktere çıkarmamzın ardından thehbk.tech kaydını güncelliyoruz.
update domains set Domain = "thehbk.tech" where DomainId = 3;
select * from domains;

-- Tabloya yeni sütunlar ekliyoruz.
alter table domains
	add DomainCreationDate date,
	add DomainExpiryDate date,
	add DomainUpdateDate date,
	add DomainNs1 varchar(20),
	add DomainNs2 varchar(20);
select * from domains;

-- Domain sütunun adını DomainName olarak güncelliyoruz.
-- alter table domains modify 

-- Tabloda boş kalan verileri güncelliyoruz.
update domains set
	DomainCreationDate = "2020-10-15",
	DomainExpiryDate = "2022-10-15",
	DomainUpdateDate = "2022-01-08",
	DomainNs1 = "ns1.thehbk.net",
	DomainNs2 = "ns2.thehbk.net"
	where Domain = "thehbk.net";
select * from domains;

-- DomainNs3 ve DomainNs4 sütunlarını tabloya ekliyoruz.
alter table domains
	add DomainNs3 varchar(20),
	add DomainNs4 varchar(20);
select * from domains;

-- DomainNs sütunlarının varchar uzunluklarını güncelliyoruz.
alter table domains modify column DomainNs1 varchar(40);
alter table domains modify column DomainNs2 varchar(40);
alter table domains modify column DomainNs3 varchar(40);
alter table domains modify column DomainNs4 varchar(40);

-- Tabloda boş kalan verileri güncellemeye devam ediyoruz.
update domains set
	DomainCreationDate = "2020-07-29",
	DomainExpiryDate = "2023-07-29",
	DomainUpdateDate = "2022-03-11",
	DomainNs1 = "ns-cloud-e1.googledomains.com",
	DomainNs2 = "ns-cloud-e2.googledomains.com",
	DomainNs3 = "ns-cloud-e3.googledomains.com",
	DomainNs4 = "ns-cloud-e4.googledomains.com"
	where Domain = "thehbk.com";
select * from domains;


update domains set
	DomainCreationDate = "2021-12-10T",
	DomainExpiryDate = "2022-12-10",
	DomainUpdateDate = "2022-02-21",
	DomainNs1 = "ns1.dns-parking.com",
	DomainNs2 = "ns2.dns-parking.com"
	where Domain = "thehbk.tech";
select * from domains;


-- Domain sütununa NOT NULL değeri ekleyerek boş bırakılmasını engelliyoruz.
alter table domains modify column Domain varchar(20) not null;
select * from domains;

-- Domain sütunun adını DomainName olarak güncelliyoruz.
alter table domains
rename column Domain to DomainName;
select * from domains;













