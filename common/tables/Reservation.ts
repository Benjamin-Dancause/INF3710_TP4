export interface Reservation {
    id_reservation: string;
    emplacement: string;
    vehicule_desire: string;
    membre: string;
    date_debut: Date;
    heure_debut: number;
    date_fin: Date; 
    heure_fin: number;
    exigence: string;
}