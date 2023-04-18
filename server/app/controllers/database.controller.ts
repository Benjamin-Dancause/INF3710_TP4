import { Router, Request, Response, NextFunction } from "express";
import { inject, injectable } from "inversify";
import { DatabaseService } from "../services/database.service";
import Types from "../types";
import * as pg from "pg";
import { Member } from './../../../common/tables/Member';

@injectable()
export class DatabaseController {
  public constructor(
    // @ts-ignore -- À ENLEVER LORSQUE L'IMPLÉMENTATION EST TERMINÉE
    @inject(Types.DatabaseService) private readonly databaseService: DatabaseService
  ) {}

  public get router(): Router {
    const router: Router = Router();

    router.get(
      "/membres/:memberName",
      (req: Request, res: Response, _: NextFunction) => {
      const memberName: string = req.params.memberName;
      
      this.databaseService
      .getMembers(memberName)
      .then((result: pg.QueryResult) => {
        const members: Member[] = result.rows.map((member: any) => ({
          memberNo: member.memberNo,
          lastName: member.lastName,
          firstName: member.firstName,
          licenseNo: member.licenseNo,
          originPlace: member.originPlace,
          isCooperative: member.isCooperative,
          isAutoshared: member.isAutoshared,
          isPhysic: member.isPhysic,
          password: member.password,
          birthday: member.birthday,
          postalCode: member.postalCode,
          city: member.city,
          emailAdress: member.emailAdress,
          nbOfShares: member.nbOfShares,
          bankAccountNo: member.bankAccountNo,
          bankName: member.bankName,
        }));
        res.json(members);
      })
      .catch((e: Error) => {
        console.error(e.stack);
      });
    });
    return router;
  }
}
