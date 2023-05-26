use demo;

create table product(
Id int not null,
productCode varchar(50) not null,
productName varchar(50) not null,
productPrice int not null,
productAmount int not null,
productDescription varchar(50),
productStatus varchar(50)
);

insert product(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values ('1','tu lanh', 100, 10, 'new', null)
;

insert product(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values ('2','may giat', 150, 15, 'new', null),
('3','TV', 130, 20, 'new', null),
('4','dieu hoa', 120, 30, ' like new', null)
;


alter table `demo`.`product`
add primary key (`id`)
;
alter table`demo`.`product`
change column `id` `id` int not null auto_increment
;

-- alter table `demo`.`product`
-- add index idx_id(product)
-- ;

CREATE unique index idx_id
on product(id)
;

select * 
from product
where id = 1
;

create index idx_productName_productPrice
on product(productName,productPrice)
;

explain select *
from product
where id = 1
;

create or replace view pCode_pName_pPrice_pStatus as
select id, productName, productPrice, productStatus
from product
;

select *
from pCode_pName_pPrice_pStatus
;

drop view pCode_pName_pPrice_pStatus
;


delimiter //
create procedure getAll()

begin
select *
from product;
end //

delimiter ;
call getAll;

delimiter //
create procedure addProduct()

begin
insert product (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values (5, 'lo nuong', 200, 40, null, null);
end //
delimiter ;

call addProduct;

select *
from product;


drop procedure updateById;


delimiter //
create procedure updateById(
in inp_id int
)

begin
update product
set productCode = 6, productName = 'a', productPrice = '100', productAmount = '100', productDescription = 'd', productStatus = 'e'
where id = inp_id;
end //
delimiter ;

call updateById(5)
;

select * 
from product
;


delimiter //
create procedure dropByid
(in inp_id int)

begin
delete from product
where id = inp_id;
select *
from product;
end //
delimiter ;

call dropByid(5)