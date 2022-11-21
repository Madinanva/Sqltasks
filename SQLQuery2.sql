--Database Yaradin Adi Ne Olursa Olsun

--Brands Adinda Table Yaradin 2 dene colum Id ve Name

--Notebooks Adinda Table Yaradin Id,Name, Price Columlari Olsun.

--Phones Adinda Table Yaradin Id, Name, Price Columlari Olsun.

--1) Notebook ve Brand Arasinda Mentiqe Uygun Relation Qurun.

--2) Phones ve Brand Arasinda Mentiqe Uygun Relation Qurun.

--3) Notebooks Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

--4) Phones Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

--5) Brand Adinin Terkibinde s Olan Butun Notebooklari Cixardan Query.

--6) Qiymeti 2000 ve 5000 arasi ve ya 5000 den yuksek Notebooklari Cixardan Query.

--7) Qiymeti 1000 ve 1500 arasi ve ya 1500 den yuksek Phonelari Cixardan Query.

--8) Her Branda Aid Nece dene Notebook Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

--9) Her Branda Aid Nece dene Phone Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

--10) Hem Phone Hem de Notebookda Ortaq Olan Name ve BrandId Datalarni Bir Cedvelde Cixardan Query.

--11) Phone ve Notebook da Id, Name, Price, ve BrandId Olan Butun Datalari Cixardan Query.

--12) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalari Cixardan Query.

--13) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalarin Icinden Price 1000-den Boyuk Olan Datalari Cixardan Query.

--14) Phones Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) ve Hemin Branda Nece dene Telefon Varsa Sayini (ProductCount Kimi) Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple                   6750                3
--Samsung            3500                4
--Redmi                 800                1

--15) Notebooks Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) , Hemin Branda Nece dene Telefon Varsa Sayini (ProductCount Kimi) Olacaq ve Sayi 3-ve 3-den Cox Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple                    6750                3
--Samsung              3500                4

Create Database Techbar
Use Techbar
Create Table Brands
(
	Id int identity primary key,
	Name nvarchar(100) Not Null
)
Create Table Notebooks
(
	Id int identity primary key,
	Name nvarchar(100) Not Null,
	Price money Not Null,
	BrandId int references Brands(Id)
)

Create Table Phones
(
	Id int identity primary key,
	Name nvarchar(100) Not Null,
	Price money Not Null,
	BrandId int references Brands(Id)
)
Insert Into Brands values
('Apple'),
('Samsung'),
('Sony')

Insert Into Notebooks values
('Mac M1', 2500, 1),
('Pro 360', 1760, 2),
('Vaio 505', 1390, 3)

Insert Into Phones values
('A04', 300, 2),
('11 pro', 1300, 1),
('Xperia 5', 800, 3)
Select Notebooks.Name, Brands.Name 'BrandName', Notebooks.Price From Notebooks Join Brands on Notebooks.BrandId = Brands.Id
Select Phones.Name, Brands.Name 'BrandName', Phones.Price From Phones Join Brands on Phones.BrandId = Brands.Id
Select Notebooks.Name from Notebooks Join Brands on NoteBooks.BrandId=Brands.Id where Brands.Name like '%s%'
Select NoteBooks.Name, NoteBooks.Price From NoteBooks where Price Between 2000 and 5000 or Price>5000
Select Phones.Name, Phones.Price From Phones where Price Between 1000 and 1500 or Price>1500
Select Brands.Name, Count(*) 'Count' From Brands Join Notebooks on Brands.Id = NoteBooks.BrandId group by Brands.Name
Select Brands.Name, Count(*) 'Count' From Brands Join Phones on Brands.Id = Phones.BrandId group by Brands.Name
Select Name,BrandId From NoteBooks Union Select Name, BrandId From Phones 
Select * From NoteBooks Union all Select * From Phones
Select n.Id, n.Name, n.Price, b.Name 'BrandName' from NoteBooks n join Brands b on n.BrandId = b.Id Union Select p.Id, p.Name, p.Price, b.Name 'BrandName' from Phones p join Brands b on p.BrandId = b.Id
Select n.Id, n.Name, n.Price, b.Name 'BrandName' from NoteBooks n join Brands b on n.BrandId = b.Id Union Select p.Id, p.Name, p.Price, b.Name 'BrandName' from Phones p join Brands b on p.BrandId = b.Id where Price>1000
Select Brands.Name 'BrandName', Sum(p.Price) 'TotalPrice', Count(*) 'ProductCount' from Phones p join Brands on p.BrandId=Brands.Id Group By Brands.Name
Select Brands.Name 'BrandName', Sum(n.Price) 'TotalPrice', Count(*) 'ProductCount' from NoteBooks n join Brands on n.BrandId=Brands.Id Group By Brands.Name having (Select Count(*) 'ProductCount' from NoteBooks n)>=3