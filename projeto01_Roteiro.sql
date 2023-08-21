CREATE DATABASE Projeto01;

CREATE TABLE laptop0 (
	brand VARCHAR(30),
	model VARCHAR(30),
	processor_brand VARCHAR(30),
	processor_name VARCHAR(30),
	processor_gnrtn VARCHAR(30),
	ram_gb VARCHAR(30),
	ram_type VARCHAR(30),
	ssd VARCHAR(30),
	hdd VARCHAR(30),
	os VARCHAR(30),
	os_bit VARCHAR(30),
	graphic_card_gb INT,
	weight VARCHAR(30),
	display_size VARCHAR(30),
	warranty INT,
	Touchscreen VARCHAR(30),
	msoffice VARCHAR(30),
	latest_price FLOAT,
	old_price FLOAT,
	discount FLOAT,
	star_rating FLOAT,
	ratings FLOAT,
	reviews FLOAT
);

bulk insert laptop0 from 'C:\SQL\SQL_Projeto01\Cleaned_Laptop_data2.csv' with (fieldterminator = ',', rowterminator = '\n', firstrow = 1, codepage = 'acp');

select * from laptop0;

select 
	brand as 'Marca',
	AVG(latest_price) as 'Media de preços'
from laptop0
Group by brand
order by 'Media de preços' desc;


select 
	ram_type as 'Tipo de memoria',
	count(ram_type) as 'Memoria'
from laptop0
where ram_type = 'DDR3' or ram_type = 'DDR4' or ram_type = 'DDR5'
Group by ram_type;

CREATE VIEW v_laptop0 AS
SELECT 
	*,
	(latest_price*0.063) as 'Preços atual em real',
	(old_price*0.063) as 'Preço antigo em real',
	(discount*0.063) as 'Desconto em real'
FROM laptop0;

select * from v_laptop0;

ALTER VIEW v_laptop0 AS
SELECT 
	*,
	(latest_price*0.063) as 'Preco_atual',
	(old_price*0.063) as 'Preco_antigo',
	(discount/100) as 'Desconto'
FROM laptop0;

select * from v_laptop0;

select  
	brand as 'Marca',
	AVG(Preco_atual) as 'Media de preços'
from v_laptop0
group by brand
order by 'Media de preços' desc;




