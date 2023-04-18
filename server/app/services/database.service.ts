import { injectable } from "inversify";
import * as pg from "pg";
import "reflect-metadata";

@injectable()
export class DatabaseService {
  public connectionConfig: pg.ConnectionConfig = {
    user: "postgres",
    database: "TP4",
    password: "p",
    port: 5432,          // Attention ! Peut aussi être 5433 pour certains utilisateurs
    host: "127.0.0.1",
    keepAlive: true
  };

  public pool: pg.Pool = new pg.Pool(this.connectionConfig);

  public async getAllMembers(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    const res = await client.query("SELECT * FROM membre;");
    client.release();
    return res;
  }

  public async getMembers(memberName: string): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    const res = await client.query(`SELECT * FROM membre g WHERE g.nom LIKE '${memberName}%'`);
    client.release();
    return res;
  }

  public async getAllVehicles(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    const res = await client.query("SELECT * FROM vehicule;");
    client.release();
    return res;
  }

  public async getAllReservations(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    const res = await client.query("SELECT * FROM reservation;");
    client.release();
    return res;
  }

  public async sendReservation(reservation: any): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    const res = await client.query(`INSERT INTO reservation (id_reservation, emplacement, vehicule_desire, membre, date_debut, heure_debut, date_fin, heure_fin, exigence) VALUES ('${reservation.id_reservation}', '${reservation.emplacement}', '${reservation.vehicule_desire}', '${reservation.membre}', '${reservation.date_debut}', '${reservation.heure_debut}:00', '${reservation.date_fin}', '${reservation.heure_fin}:00', '${reservation.exigence}');`);
    client.release();
    return res;
  }
}
