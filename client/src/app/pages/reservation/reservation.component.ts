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
  heureDebut: string;
  dateFin: Date;
  heureFin: string;
  exigence: string;

  reservationValide: boolean = false;
  ngOnInit(): void {
    this.getVehicles();
    this.getReservations();
    this.getMembre();
  };

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

  addReservation():void {
    console.log(this.vehicule);
  }

}
