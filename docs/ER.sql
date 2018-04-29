/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/4/29 2:30:38                            */
/*==============================================================*/


drop table if exists Comment评论;

drop table if exists Customer顾客;

drop table if exists Desk餐桌;

drop table if exists Disk菜品;

drop table if exists Order订单;

drop table if exists Restaurant;

drop table if exists Sale销售记录;

/*==============================================================*/
/* Table: Comment评论                                             */
/*==============================================================*/
create table Comment评论
(
   CommentId            integer not null,
   CustomerId           varchar(256),
   DiskId               integer,
   Description          varchar(256),
   Level                varchar(8),
   primary key (CommentId)
);

/*==============================================================*/
/* Table: Customer顾客                                            */
/*==============================================================*/
create table Customer顾客
(
   CustomerId           varchar(256) not null,
   NickName             varchar(64),
   primary key (CustomerId)
);

/*==============================================================*/
/* Table: Desk餐桌                                                */
/*==============================================================*/
create table Desk餐桌
(
   "DeskId
   RestaurantId   INTEGER    <fk>" integer not null,
   RestaurantId         integer,
   DeskLink             varchar(256),
   primary key ("DeskId
   RestaurantId   INTEGER    <fk>")
);

/*==============================================================*/
/* Table: Disk菜品                                                */
/*==============================================================*/
create table Disk菜品
(
   DiskId               integer not null,
   RestaurantId         integer,
   CreationDate         integer,
   DiskName             varchar(64),
   Price                float,
   ImageId              integer,
   Flavor               varchar(32),
   Category             varchar(32),
   FavorableRate        float,
   CommentNum           integer,
   Description          varchar(256),
   primary key (DiskId)
);

/*==============================================================*/
/* Table: Order订单                                               */
/*==============================================================*/
create table Order订单
(
   OrderId              integer not null,
   "DeskId
   RestaurantId   INTEGER    <fk>" integer,
   CustomerId           varchar(256),
   RestaurantId         integer,
   DeskId               integer,
   OrderDate            datetime,
   TotalPrices          float,
   DiskNum              integer,
   Tableware            varchar(4),
   State                varchar(2),
   primary key (OrderId)
);

/*==============================================================*/
/* Table: Restaurant                                            */
/*==============================================================*/
create table Restaurant
(
   RestaurantId         integer not null,
   ManagerNumber        varchar(16),
   ManagerPassword      char(32),
   RestaurantName       varchar(64),
   Description          varchar(256),
   ImageId              varchar(256),
   RestaurantNumber     varchar(16),
   primary key (RestaurantId)
);

/*==============================================================*/
/* Table: Sale销售记录                                              */
/*==============================================================*/
create table Sale销售记录
(
   SalesId              integer not null,
   RestaurantId         integer,
   OrderId              integer,
   DiskId               integer,
   primary key (SalesId)
);

alter table Comment评论 add constraint FK_Reference_8 foreign key (DiskId)
      references Disk菜品 (DiskId) on delete restrict on update restrict;

alter table Comment评论 add constraint FK_Reference_9 foreign key (CustomerId)
      references Customer顾客 (CustomerId) on delete restrict on update restrict;

alter table Desk餐桌 add constraint FK_Reference_1 foreign key (RestaurantId)
      references Restaurant (RestaurantId) on delete restrict on update restrict;

alter table Order订单 add constraint FK_Reference_2 foreign key ("DeskId
RestaurantId   INTEGER    <fk>")
      references Desk餐桌 ("DeskId
  RestaurantId   INTEGER    <fk>") on delete restrict on update restrict;

alter table Order订单 add constraint FK_Reference_3 foreign key (RestaurantId)
      references Restaurant (RestaurantId) on delete restrict on update restrict;

alter table Order订单 add constraint FK_Reference_4 foreign key (CustomerId)
      references Customer顾客 (CustomerId) on delete restrict on update restrict;

alter table Sale销售记录 add constraint FK_Reference_5 foreign key (RestaurantId)
      references Restaurant (RestaurantId) on delete restrict on update restrict;

alter table Sale销售记录 add constraint FK_Reference_6 foreign key (OrderId)
      references Order订单 (OrderId) on delete restrict on update restrict;

alter table Sale销售记录 add constraint FK_Reference_7 foreign key (DiskId)
      references Disk菜品 (DiskId) on delete restrict on update restrict;

