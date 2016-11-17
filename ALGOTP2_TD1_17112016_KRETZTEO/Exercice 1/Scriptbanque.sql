create table CLIENT ( NUMCLIENT char (12) not null,

                      NOM char (32) not null,

                      PRENOM char (32) not null,

                      ADRESSE char (60) not null,

             primary key (NUMCLIENT) )

             in SP_BENEFICIAIRE;

create table COMPTE ( NUMCOMPTE char (12) not null,

                      SOLDE decimal (21) not null,

             primary key (NUMCOMPTE) )

             in SP_COMPTE;

create table BENEFICIARE (NUMCLIENT char (12) not null,

                          NUMCOMPTE char (12) not null,

             primary key (NUMCLIENT,NUMCOMPTE),

             foreign key (NUMCLIENT) references CLIENT

                on delete cascade on update cascade,

             foreign key (NUMCOMPTE) references COMPTE

                on delete cascade on update cascade)

             in SP_BENEFICIAIRE;

create table OPERATION (NUMOPERATION char (12) not null,

						NOMOPERATION char (16) not null,

						DATEOPERATION date not null,

						NUMCOMPTE char (12) not null,

						NUMCLIENT (12) not null,

						MONTANT decimal (21) not null,

             primary key (NUMOPERATION),

             foreign key (NUMCLIENT) references CLIENT

                on delete cascade on update cascade,

             foreign key (NUMCOMPTE) references COMPTE

                on delete cascade on update cascade)

             in SP_COMPTE;








create unique index XCLI_NUMCLI on CLIENT(NUMCLIENT);

create unique index XCLI_NUMCLI on COMPTE(NUMCOMPTE);

create unique index XCLI_NUMCLI on BENEFICIARE(NUMCLIENT);
create unique index XCLI_NUMCLI on BENEFICIARE(NUMCOMPTE);

create unique index XCLI_NUMCLI on OPERATION(NUMOPERATION);
create unique index XCLI_NUMCLI on OPERATION(NUMCLIENT);
create unique index XCLI_NUMCLI on OPERATION(NUMCOMPTE);