create table CLIENT ( NUMCLIENT char (12) not null,

                      NOM char (32) not null,

                      PRENOM char (32) not null,

                      ADRESSE char (60) not null,

             primary key (NUMCLIENT) )

             in SP_CLIENT;

create table PRODUIT (CODEPDT char(12) not null, 

					  LIBELE char (12) not null,

					  PRIX decimal (12) not null,

				primary key (CODEPDT))

				in SP_COMMANDE;

create table COMMANDE (NUMCOMMANDE char(12) not null,

					   NUMCLIENT char (12) not null,

					   DATECOMM date not null,

					   ADRESSELIVR char(60) not null,

					   CODEPDT char(12) not null,

					   QUANTITE decimal (9) not null,

					primary key (NUMCOMMANDE),

					foreign key (NUMCLIENT) references CLIENT

						on delete cascade on update cascade,

					foreign key (CODEPDT) references PRODUIT
						on delete no action on update cascade)

					in SP_COMMANDE;

create unique index XCLI_NUMCLI on CLIENT(NUMCLIENT);

create unique index XCLI_NUMCLI on PRODUIT(CODEPDT);

create unique index XCLI_NUMCLI on COMMANDE(NUMCOMMANDE);
create unique index XCLI_NUMCLI on COMMANDE(NUMCLIENT);
create unique index XCLI_NUMCLI on COMMANDE(CODEPDT);