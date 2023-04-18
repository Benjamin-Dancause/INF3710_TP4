import { Router } from "express";
import { inject, injectable } from "inversify";
import { DatabaseService } from "../services/database.service";
import Types from "../types";
const databaseService = new DatabaseService();

@injectable()
export class DatabaseController {
  public constructor(
    // @ts-ignore -- À ENLEVER LORSQUE L'IMPLÉMENTATION EST TERMINÉE
    @inject(Types.DatabaseService) private readonly databaseService: DatabaseService
  ) {}

  public get router(): Router {
    const router: Router = Router();

    router.get("/members/:membre", function (req, res) {
      databaseService.getMembers(req.params.membre).then((result) => {
        const response = result.rows;
        res.send(response);
      });
    });

    router.get("/members", function (req, res) {
      databaseService.getAllMembers().then((result) => {
        const response = result.rows;
        res.send(response);
      });
    });

    router.get("/vehicles", function (req, res) {
      databaseService.getAllVehicles().then((result) => {
        const response = result.rows;
        res.send(response);
      });
    });

    router.get("/reservations", function (req, res) {
      databaseService.getAllReservations().then((result) => {
        const response = result.rows;
        res.send(response);
      });
    });



    return router;
  }
}
