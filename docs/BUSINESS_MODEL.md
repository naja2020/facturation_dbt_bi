# Business Model

## Contexte

FinanceHub est une plateforme de gestion financière personnelle permettant de :

- gérer plusieurs utilisateurs
- gérer plusieurs comptes
- enregistrer toutes les transactions
- suivre les objectifs d'épargne
- gérer plusieurs devises
- produire des indicateurs Power BI
- générer des factures PDF

---

# Objets métier

## Utilisateur

Personne utilisant l'application.

Responsabilités :

- gérer ses comptes
- gérer ses bénéficiaires
- gérer ses objectifs
- consulter ses tableaux de bord

---

## Compte

Représente un compte financier.

Exemples :

- Compte courant France
- Compte Maroc
- Compte Épargne

Chaque compte possède :

- une devise
- un solde
- un propriétaire

---

## Bénéficiaire

Personne ou organisme recevant un paiement.

Exemples :

- Mohamed
- Samia
- Abdelfettah
- Wissal
- EDF
- Orange
- Banque

---

## Transaction

Représente un mouvement financier.

Une transaction possède notamment :

- un compte émetteur
- un compte récepteur
- un bénéficiaire
- une devise
- un montant
- une date
- un statut

Les types de transaction pourront être :

- Salaire
- Paiement
- Prime
- Épargne
- Virement
- Facture
- Dépense

---

## Devise

Permet la gestion multidevise.

Exemples :

- EUR
- MAD
- USD

---

## Taux de change

Permet la conversion entre devises.

Exemple :

1 EUR = 10.85 MAD

---

## Objectif

Permet de suivre une épargne.

Exemples :

- Acheter un appartement
- Acheter une voiture
- Vacances
- Fonds d'urgence

Chaque objectif possède :

- un montant cible
- un montant actuel
- une devise
- une date cible

---

# Règles métier

- Un utilisateur possède plusieurs comptes.
- Un compte possède plusieurs transactions.
- Une transaction utilise une seule devise.
- Un objectif appartient à un seul utilisateur.
- Une transaction peut alimenter un objectif.
- Un bénéficiaire peut recevoir plusieurs transactions.

---

# Décision d'architecture : Personne et rôles

Afin d'éviter la duplication entre les utilisateurs de l'application et les tiers impliqués dans les transactions, FinanceHub utilise un modèle basé sur le concept de Personne et de Rôle.

Une personne représente une entité physique ou morale :

- individu
- entreprise
- banque
- administration
- fournisseur
- membre de la famille

Une personne peut avoir plusieurs rôles :

- UTILISATEUR
- ADMIN
- TIERS
- BENEFICIAIRE
- FOURNISSEUR
- CLIENT

Cette approche permet de rendre le modèle extensible.

Exemples :

| Personne | Rôle |
|---|---|
| Amine | UTILISATEUR |
| Amine | ADMIN |
| Mohamed | TIERS |
| Mohamed | BENEFICIAIRE |
| EDF | TIERS |
| EDF | FOURNISSEUR |

Cette modélisation évite de dupliquer les informations entre plusieurs tables et permet à une même personne d'évoluer dans le système.