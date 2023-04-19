import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { of, Observable, Subject } from "rxjs";
import { catchError } from "rxjs";
import { Membre } from "../../../../common/tables/Membre";
import { Vehicule } from "../../../../common/tables/Vehicule";
import { Reservation } from "../../../../common/tables/Reservation";

@Injectable()
export class CommunicationService {
  private readonly BASE_URL: string = "http://localhost:3000/database";
  public constructor(private readonly http: HttpClient) {}

  private _listeners: any = new Subject<any>();

  listen(): Observable<any> {
    return this._listeners.asObservable();
  }

  filter(filterBy: string): void {
    this._listeners.next(filterBy);
  }

  public getMember(name: string): Observable<Membre[]> {
    return this.http
    .get<Membre[]>(this.BASE_URL + `/members/${name}`)
    .pipe(catchError(this.handleError<Membre[]>("getMember")));
  }

  public getAllMembers(): Observable<Membre[]> {
    return this.http
    .get<Membre[]>(this.BASE_URL + `/members`)
    .pipe(catchError(this.handleError<Membre[]>("getAllMembers")));
  }

  public getAllVehicles(): Observable<Vehicule[]> {
    return this.http
    .get<Vehicule[]>(this.BASE_URL + `/vehicles`)
    .pipe(catchError(this.handleError<Vehicule[]>("getAllVehicles")));
  }

  public getAllReservations(): Observable<Reservation[]> {
    return this.http
    .get<Reservation[]>(this.BASE_URL + `/reservations`)
    .pipe(catchError(this.handleError<Reservation[]>("getAllReservations")));
  }

  public sendReservation(reservation: Reservation): Observable<Reservation> {
    return this.http
    .post<Reservation>(this.BASE_URL + `/reservations`, reservation)
    .pipe(catchError(this.handleError<Reservation>("sendReservation")));
  }


  private handleError<T>(
    request: string,
    result?: T
  ): (error: Error) => Observable<T> {
    return (error: Error): Observable<T> => {
      return of(result as T);
    };
  }
}
