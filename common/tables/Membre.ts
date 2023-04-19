export interface Membre {
    id_membre: string;
    nom: string;
    permis_de_conduire: string;
    emplacement_origine: string;
    est_cooperatif: boolean;
    est_autopartage: boolean;
    est_physique: boolean; 
    mot_de_passe: string;
    date_de_naissance: string;
    adresse_postale: string;
    ville: string;
    courriel: string;
    nombre_de_part: number;
    numerobanque: string;
    comptedebanque: string;
    cotisation: number;
}