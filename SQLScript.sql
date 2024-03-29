-- CREACION DE LA TABLA

-- 1.	SOLICITUD DE CUENTA

create table GROUP1_ACCOUNTREQUEST
(
   RequestId Number(10) PRIMARY KEY,
        Branch varchar2(15) NOT NULL,
        AccountType varchar2(15) NOT NULL,
   Title varchar2(4) NOT NULL,
   FirstName varchar2(15) NOT NULL,
   LastName varchar2(15) NOT NULL,
        DOB  date NOT NULL,
   WorkPhone number(10) NOT NULL,
        CONSTRAINT wtel_length CHECK (LENGTH(WorkPhone)= 10),
   HomePhone number(10) NOT NULL,
        CONSTRAINT htel_length CHECK (LENGTH(HomePhone) =10),
   Address varchar2(30) NOT NULL,
   State varchar2(15) NOT NULL,
   Zip number(10) NOT NULL,
   Email varchar2(30) NOT NULL,
   Status varchar2(10) DEFAULT 'ENTERED'
);
 
-- 2.  INFORMACIÓN REGISTRADA

create table GRP1_REGISTEREDINFO
(
   RequestId Number(10),
   Account_Number Number(6) PRIMARY KEY,
   Branch varchar2(15) NOT NULL,
   Account_Type varchar2(15) NOT NULL,
   Title varchar2(4) NOT NULL,
   FirstName varchar2(15) NOT NULL,
   LastName varchar2(15) NOT NULL,
        DOB  date NOT NULL,
        WorkPhone number(10) NOT NULL,
        CONSTRAINT wtel_length1 CHECK (LENGTH(WorkPhone)= 10),
        HomePhone number(10) NOT NULL,
        CONSTRAINT htel_length1 CHECK (LENGTH(HomePhone) =10),
        Address varchar2(30) NOT NULL,
        State varchar2(15) NOT NULL,
        Zip number(10) NOT NULL,
        Email varchar2(30) NOT NULL,
   Online_registration varchar2(1) DEFAULT 'N',
   password varchar2(10),
   FOREIGN KEY (RequestId) REFERENCES GRP1_ACCOUNTREQUEST(RequestId)
);

-- 3. INFORMACIÓN DE TRANSACCIÓN

 create table GRP1_TRANSACTIONINFO
 (
    TransactionId Number(10) PRIMARY KEY,
    TransactionDate Date DEFAULT Sysdate,
    Account_Number Number(6),
    Amount Number(8) CONSTRAINT amt_value_check CHECK(Amount>0),
    ChequeNo Number(10) NOT NULL,
    Transaction_Type varchar2(2),
    FOREIGN KEY (Account_Number) REFERENCES  GRP1_REGISTEREDINFO(Account_Number)
 );

