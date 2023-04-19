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
  vehicules: Vehicule[];
  reservations: Reservation[];
  membres: Membre[];
  vehicule: string;
  membre: string;
  dateDebut: Date;
  heureDebut: any;
  dateFin: Date;
  heureFin: any;
  exigence: string;
  reservationValide: boolean;

  constructor(private communicationService: CommunicationService) {
    this.vehicule = '';
    this.membre = '';
    this.exigence = '';
    this.reservationValide = true;
    this.membres = [];
    this.reservations = [];
    this.vehicules = [];
    this.dateDebut = new Date();
    this.heureDebut = new Date();
    this.dateFin = new Date();
    this.heureFin = new Date();
  };


  ngOnInit(): void {
    this.getVehicles();
    this.getReservations();
    this.getMembre();
  };


  checkVehiculeAvailability(immatriculation:string):boolean {

    for(let reservation of this.reservations) {

      let testDateDebut:Date = new Date(reservation.date_debut);
      let testDateFin:Date = new Date(reservation.date_fin);
      if (reservation.vehicule_desire == immatriculation) {
        if (testDateDebut == this.dateDebut) {
          if (reservation.heure_debut < this.heureFin && this.heureDebut < reservation.heure_debut) {
            return false;
          } else if (this.heureDebut > reservation.heure_debut && this.heureDebut < reservation.heure_fin) {
            return false;
          }
        } 
        else if (testDateDebut< this.dateFin && this.dateDebut < testDateDebut) {
          return false;
        }
        else if (this.dateDebut > testDateDebut && this.dateDebut < testDateFin) {
          return false;
        }
      }
    }
    return true;
  }

          
  
  checkReservation(): void {
    this.dateDebut = new Date(this.dateDebut);
    this.dateFin = new Date(this.dateFin);


    if (this.vehicule != null && this.membre != null && this.dateDebut != null 
      && this.heureDebut != null && this.dateFin != null && this.heureFin != null &&
      (this.dateDebut < this.dateFin|| (this.dateDebut === this.dateFin&& this.heureDebut < this.heureFin))
      && (this.dateDebut >= new Date() || (this.dateDebut === new Date() && this.heureDebut >= new Date().getHours()))) {
        this.reservationValide = this.checkVehiculeAvailability(this.vehicule);

      }
    else {
      this.reservationValide = false;
      this.exigence="";
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
        exigence: this.exigence? this.exigence : ""
      };

    this.checkReservation();
    if (this.reservationValide) {
      this.sendReservation(reservation);
    }
  }      

  sendReservation(reservation:Reservation){
    this.communicationService.sendReservation(reservation).subscribe((res: Reservation)=> {
      this.reservations.push(res);
      window.location.reload();
    });
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
