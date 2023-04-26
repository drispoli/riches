CREATE TABLE profile (
  id BIGINT IDENTITY,
  username varchar(15) NOT NULL,
  password varchar(15) NOT NULL,
  firstname varchar(32),
  lastname varchar(32),
  email varchar(256),
  ssno varchar(11)
);

CREATE TABLE role (
  id BIGINT IDENTITY,
  username varchar(15) NOT NULL,
  rolename varchar(15) NOT NULL
);

CREATE TABLE auth (
  id BIGINT IDENTITY,
  rolename varchar(15) NOT NULL,
  roleid int
);

CREATE TABLE account (
  id BIGINT IDENTITY,
  username varchar(15) NOT NULL,
  acctno varchar(16) NOT NULL,
  balance double
);

CREATE TABLE transaction (
  id BIGINT IDENTITY,
  acctno varchar(16) NOT NULL,
  description varchar(255),
  amount double,
  date Date
);

CREATE TABLE message (
  id BIGINT IDENTITY,
  username varchar(15) NOT NULL,
  date Date,
  sender varchar(255) NOT NULL,
  severity varchar(255),
  subject varchar(255),
  body varchar(8192)
);

insert into account (username, acctno, balance) values ('eddie', '5424000011112222', 31337.00);
insert into account (username, acctno, balance) values ('eddie', '5424000011112223', 10000.00);
insert into account (username, acctno, balance) values ('gary', '5424000011112224', 10000.00);

insert into profile (username, password, firstname, lastname, email, ssno) values ('admin', 'admin', 'Andrew', 'Dmin', 'admin@example.com', '111-22-0123');
insert into profile (username, password, firstname, lastname, email, ssno) values ('jason', 'jason', 'Jason', 'Smith', 'jsmith@example.com', '123-45-6787');
insert into profile (username, password, firstname, lastname, email, ssno) values ('gary', 'gary', 'Gary', 'Skippee', 'gary@example.com', '123-45-6788');
insert into profile (username, password, firstname, lastname, email, ssno) values ('eddie', 'eddie', 'Eddie', '', 'ed@example.com', '123-45-6789');
insert into profile (username, password, firstname, lastname, email, ssno) values ('thomas', 'thomas', 'Thomas', 'Anderson', 'neo@example.com', '123-45-6786');
insert into profile (username, password, firstname, lastname, email, ssno) values ('wiley', 'wiley', 'Wiley', 'Hacker', 'wiley@example.com', '123-45-6785');
insert into profile (username, password, firstname, lastname, email, ssno) values ('dade', 'dade', 'Dade', 'Murpy', 'dade@example.com', '123-45-6784');
insert into profile (username, password, firstname, lastname, email, ssno) values ('kate', 'kate', 'Kate', 'Libby', 'kate@example.com', '123-45-6783');

insert into transaction (acctno, description, amount, date) values ('5424000011112222', 'Deposit', 111.12, '2008-01-04');
insert into transaction (acctno, description, amount, date) values ('5424000011112222', 'Deposit', 311.00, '2008-01-08' );
insert into transaction (acctno, description, amount, date) values ('5424000011112222', 'Withdrawl', -11.65, '2008-01-10' );
insert into transaction (acctno, description, amount, date) values ('5424000011112222', 'Deposit', 556.20, '2008-02-04' );
insert into transaction (acctno, description, amount, date) values ('5424000011112222', 'Withdrawl', -80.00, '2008-02-14' );
insert into transaction (acctno, description, amount, date) values ('5424000011112222', 'Deposit', 81.12, '2008-03-04' );
insert into transaction (acctno, description, amount, date) values ('5424000011112224', 'Deposit', 930.23, '2008-04-10' );
insert into transaction (acctno, description, amount, date) values ('5424000011112224', 'Deposit', 100.00, '2008-04-11' );
insert into transaction (acctno, description, amount, date) values ('5424000011112224', 'Withdrawl', -20.98, '2008-04-22' );
insert into transaction (acctno, description, amount, date) values ('5424000011112224', 'Withdrawl', -56.60, '2008-04-23' );
insert into transaction (acctno, description, amount, date) values ('5424000011112224', 'Withdrawl', -40.00, '2008-01-04' );
insert into transaction (acctno, description, amount, date) values ('5424000011112224', 'Deposit', 181.12, '2007-12-12' );

insert into message (username, date, sender, severity, subject, body) values ('eddie', '2008-01-04', 'RWi', '<font color="red">High</font>', 'Alert: Check funds', 'Please check your balance.');
insert into message (username, date, sender, severity, subject, body) values ('eddie', '2007-12-21', 'RWi', 'Low', 'Deposit', 'Your funds have been deposited.');
insert into message (username, date, sender, severity, subject, body) values ('gary', '2008-03-31', 'RWi', 'Low', 'Deposit', 'Your funds have been deposited.');

insert into role (username, rolename) values ('admin', 'admin');
insert into role (username, rolename) values ('admin', 'user');
insert into role (username, rolename) values ('gary', 'user');
insert into role (username, rolename) values ('geoff', 'user');
insert into role (username, rolename) values ('adam', 'user');
insert into role (username, rolename) values ('arthur', 'user');
insert into role (username, rolename) values ('michelle', 'user');
insert into role (username, rolename) values ('eddie', 'user');

insert into auth (rolename, roleid) values ('admin', 0);
insert into auth (rolename, roleid) values ('user', 1);
