import { Component, OnInit } from '@angular/core';
import { CommunicationService } from 'src/app/services/communication.service';
import { Vehicule } from '../../../../../common/tables/Vehicule';
import { Reservation } from '../../../../../common/tables/Reservation';
import { Membre } from '../../../../../common/tables/Membre';

@Component({
  selector: 'app-reservation',
  templateUrl: './reservation.component.html',
  styleUrls: ['./reservation.component.css']
})
export class ReservationComponent implements OnInit {

  constructor(private communicationService: CommunicationService) {};
  vehicules: Vehicule[] = [];
  reservations: Reservation[] = [];
  membres: Membre[] = [];

  vehicule: string;
  membre: string;
  dateDebut: Date;
  heureDebut: any;
  dateFin: Date;
  heureFin: any;
  exigence: string;

  reservationValide: boolean = true;

  ngOnInit(): void {
    this.getVehicles();
    this.getReservations();
    this.getMembre();
  };


  checkVehiculeAvailability(immatriculation:string):boolean {
    for(let reservation of this.reservations) {
      if (reservation.vehicule_desire == immatriculation) {
        if (reservation.date_debut.getDay() == this.dateDebut.getDay()) {
          if (reservation.heure_debut > this.heureDebut && this.heureFin < reservation.heure_debut) {
            return true;
          } else if (reservation.heure_fin < this.heureDebut) {
            return true;
          }
        } else if (reservation.date_fin.getDay() < this.dateDebut.getDay()) {
          return true;
        } else if (reservation.date_debut.getDay() > this.dateFin.getDay()) {
          return true;
        }
      }
    }
    return false;
  }

          
  
  checkReservation(): void {
    if (this.vehicule != null && this.membre != null && this.dateDebut != null 
      && this.heureDebut != null && this.dateFin != null && this.heureFin != null &&
      (this.dateDebut.getDay() < this.dateFin.getDay() || (this.dateDebut.getDay() == this.dateFin.getDay() && this.heureDebut < this.heureFin))
      && (this.dateDebut.getDay() >= new Date().getDay() || (this.dateDebut.getDay() == new Date().getDay() && this.heureDebut >= new Date().getHours()))) {
        this.reservationValide = this.checkVehiculeAvailability(this.vehicule);
      }
    }

    addReservation():void {
      const next_id_num = this.reservations.length + 1;
      let next_id_string: string;
      if (next_id_num < 10) {
        next_id_string = "000000" + next_id_num;
      } else if (next_id_num < 100) {
        next_id_string = "00000" + next_id_num;
      } else if (next_id_num < 1000) {
        next_id_string = "0000" + next_id_num;
      } else if (next_id_num < 10000) {
        next_id_string = "000" + next_id_num;
      } else if (next_id_num < 100000) {
        next_id_string = "00" + next_id_num;
      } else if (next_id_num < 1000000) {
        next_id_string = "0" + next_id_num;
      } else {
        next_id_string = next_id_num.toString();
      };

      let emplacement: string = "";
      for (let vehicule of this.vehicules) {
        if (vehicule.immatriculation == this.vehicule) {
          emplacement = vehicule.emplacement_origine;
        }
      };

      const reservation: Reservation = {
        id_reservation: next_id_string,
        emplacement: emplacement,
        vehicule_desire: this.vehicule,
        membre: this.membre,
        date_debut: this.dateDebut,
        heure_debut: this.heureDebut,
        date_fin: this.dateFin,
        heure_fin: this.heureFin,
        exigence: this.exigence
      };


      this.checkReservation();
      console.log(this.reservationValide)
      if (this.reservationValide) {
        this.communicationService
        .sendReservation(reservation)
        .subscribe((reservation: Reservation) => {
          this.reservations.push(reservation);
        });
      }
    }      
    
  getVehicles():void {
    this.communicationService
      .getAllVehicles()
      .subscribe((vehicles: Vehicule[]) => {
        this.vehicules = vehicles;
      });
  }

  getReservations():void {
    this.communicationService
      .getAllReservations()
      .subscribe((reservations: Reservation[]) => {
        this.reservations = reservations;
      });
  }

  getMembre():void {
    this.communicationService
      .getAllMembers()
      .subscribe((membre: Membre[]) => {
        this.membres = membre;
      });
  }


}
