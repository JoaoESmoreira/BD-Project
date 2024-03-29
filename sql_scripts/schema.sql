

CREATE TABLE product (
	id_prod		 BIGINT,
	version		 BIGINT,
	description		 VARCHAR(512) NOT NULL,
	stock			 BIGINT NOT NULL,
	price			 FLOAT(8) NOT NULL,
	type			 VARCHAR(512) NOT NULL,	
	weight			 INTEGER NOT NULL,
	height			 INTEGER NOT NULL,
	colour			 VARCHAR(512) NOT NULL,
	seller_customer_id_user BIGINT NOT NULL,
	PRIMARY KEY(id_prod,version)
);

CREATE TABLE seller (
	customer_id_user BIGINT,
	PRIMARY KEY(customer_id_user)
);

CREATE TABLE buyer (
	customer_id_user BIGINT,
	PRIMARY KEY(customer_id_user)
);

CREATE TABLE to_order (
	id_order		 BIGSERIAL,
	order_date		 DATE NOT NULL,
	total			 BIGINT,
	buyer_customer_id_user BIGINT NOT NULL,
	PRIMARY KEY(id_order)
);

CREATE TABLE rating (
	id_rating		 BIGSERIAL,
	rating		 INTEGER NOT NULL,
	comment		 VARCHAR(512),
	buyer_customer_id_user BIGINT NOT NULL,
	product_id_prod	 BIGINT NOT NULL,
	product_version	 BIGINT NOT NULL,
	PRIMARY KEY(id_rating)
);

CREATE TABLE customer (
	id_user	 BIGSERIAL,
	name	 VARCHAR(512) NOT NULL,
	nif	 BIGINT NOT NULL,
	adress	 VARCHAR(512) NOT NULL,
	email	 VARCHAR(512) NOT NULL,
	password VARCHAR(512) NOT NULL,
	PRIMARY KEY(id_user)
);

CREATE TABLE administrator (
	customer_id_user BIGINT,
	PRIMARY KEY(customer_id_user)
);

CREATE TABLE forum (
	id_forum	 BIGSERIAL,
	comment		 VARCHAR(512) NOT NULL,
	customer_id_user BIGINT NOT NULL,
	forum_id_forum	 BIGINT,
	product_id_prod	 BIGINT NOT NULL,
	product_version	 BIGINT NOT NULL,
	PRIMARY KEY(id_forum)
);

CREATE TABLE notifications (
	id		 BIGSERIAL,
	message		 VARCHAR(512) NOT NULL,
	DATE	  DATE NOT NULL,
	was_read	 BOOL NOT NULL,
	customer_id_user BIGINT,
	PRIMARY KEY(id,customer_id_user)
);

CREATE TABLE quantity (
	quantity		 INTEGER NOT NULL,
	to_order_id_order BIGINT,
	product_id_prod	 BIGINT,
	product_version	 BIGINT,
	PRIMARY KEY(to_order_id_order,product_id_prod,product_version)
);



ALTER TABLE product ADD CONSTRAINT product_fk1 FOREIGN KEY (seller_customer_id_user) REFERENCES seller(customer_id_user);
ALTER TABLE seller ADD CONSTRAINT seller_fk1 FOREIGN KEY (customer_id_user) REFERENCES customer(id_user);
ALTER TABLE buyer ADD CONSTRAINT buyer_fk1 FOREIGN KEY (customer_id_user) REFERENCES customer(id_user);
ALTER TABLE to_order ADD CONSTRAINT to_order_fk1 FOREIGN KEY (buyer_customer_id_user) REFERENCES buyer(customer_id_user);
ALTER TABLE rating ADD CONSTRAINT rating_fk1 FOREIGN KEY (buyer_customer_id_user) REFERENCES buyer(customer_id_user);
ALTER TABLE rating ADD CONSTRAINT rating_fk2 FOREIGN KEY (product_id_prod, product_version) REFERENCES product(id_prod, version);
ALTER TABLE administrator ADD CONSTRAINT administrator_fk1 FOREIGN KEY (customer_id_user) REFERENCES customer(id_user);
ALTER TABLE forum ADD CONSTRAINT forum_fk1 FOREIGN KEY (customer_id_user) REFERENCES customer(id_user);
ALTER TABLE forum ADD CONSTRAINT forum_fk2 FOREIGN KEY (forum_id_forum) REFERENCES forum(id_forum);
ALTER TABLE forum ADD CONSTRAINT forum_fk3 FOREIGN KEY (product_id_prod, product_version) REFERENCES product(id_prod, version);
ALTER TABLE notifications ADD CONSTRAINT notifications_fk1 FOREIGN KEY (customer_id_user) REFERENCES customer(id_user);
ALTER TABLE quantity ADD CONSTRAINT quantity_fk1 FOREIGN KEY (to_order_id_order) REFERENCES to_order(id_order);
ALTER TABLE quantity ADD CONSTRAINT quantity_fk2 FOREIGN KEY (product_id_prod, product_version) REFERENCES product(id_prod, version);
