create database facturation_dbt_bi;
go

use facturation_dbt_bi;
go

create table dbo.devises (
    id_devise int identity(1,1) primary key,
    code_devise varchar(3) not null unique, -- EUR, MAD
    libelle varchar(50) not null
);

create table dbo.utilisateurs (
    id_utilisateur int identity(1,1) primary key,
    nom varchar(100) not null,
    email varchar(150) not null unique,
    role_utilisateur varchar(50) not null,
    actif bit not null default 1,
    date_creation datetime2 not null default sysdatetime()
);

create table dbo.personnes (
    id_personne int identity(1,1) primary key,
    nom varchar(100) not null,
    type_personne varchar(50) not null, -- famille, fournisseur, client
    actif bit not null default 1,
    date_creation datetime2 not null default sysdatetime()
);

create table dbo.comptes (
    id_compte int identity(1,1) primary key,
    nom_compte varchar(100) not null,
    id_devise int not null,
    solde_initial decimal(18,2) not null default 0,
    actif bit not null default 1,
    date_creation datetime2 not null default sysdatetime(),

    constraint fk_comptes_devises
        foreign key (id_devise) references dbo.devises(id_devise)
);

create table dbo.objectifs (
    id_objectif int identity(1,1) primary key,
    nom_objectif varchar(150) not null,
    description varchar(500) null,
    montant_cible decimal(18,2) not null,
    id_devise int not null,
    date_cible date null,
    statut_objectif varchar(30) not null default 'EN_COURS',
    date_creation datetime2 not null default sysdatetime(),

    constraint fk_objectifs_devises
        foreign key (id_devise) references dbo.devises(id_devise)
);

create table dbo.versements (
    id_versement int identity(1,1) primary key,
    id_personne int not null,
    id_compte int not null,
    id_devise int not null,
    mois_facturation date not null,
    montant_base decimal(18,2) not null,
    montant_prime decimal(18,2) not null default 0,
    commentaire varchar(500) null,
    statut_versement varchar(30) not null default 'BROUILLON',
    cree_par int null,
    date_saisie datetime2 not null default sysdatetime(),

    constraint fk_versements_personnes
        foreign key (id_personne) references dbo.personnes(id_personne),

    constraint fk_versements_comptes
        foreign key (id_compte) references dbo.comptes(id_compte),

    constraint fk_versements_devises
        foreign key (id_devise) references dbo.devises(id_devise),

    constraint fk_versements_utilisateurs
        foreign key (cree_par) references dbo.utilisateurs(id_utilisateur)
);