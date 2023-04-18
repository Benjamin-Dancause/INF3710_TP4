import { injectable } from "inversify";
import * as pg from "pg";
import "reflect-metadata";

@injectable()
export class DatabaseService {
  public connectionConfig: pg.ConnectionConfig = {
    user: "postgres",
    database: "TP4",
    password: "root",
    port: 5432,          // Attention ! Peut aussi être 5433 pour certains utilisateurs
    host: "127.0.0.1",
    keepAlive: true
  };

  public pool: pg.Pool = new pg.Pool(this.connectionConfig);
  public async getMembers(memberName: string): Promise<pg.QueryResult> {
    if (!memberName) throw new Error("Invalid member name")

    const client = await this.pool.connect();
    const query : string = `SELECT * FROM membre g WHERE g.lastName LIKE '${memberName}%'`;
    const res = await client.query(query);
    client.release();
    return res;
  }
}
