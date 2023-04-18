import { Component, OnInit } from '@angular/core';
import { Membre } from '../../../../../common/tables/Membre';
import { CommunicationService } from 'src/app/services/communication.service';

@Component({
  selector: 'app-member',
  templateUrl: './member.component.html',
  styleUrls: ['./member.component.css']
})
export class MemberComponent implements OnInit {
  public membres: Membre[] = [];
  public nom:string;

  public constructor(private communicationService: CommunicationService) {
  }

  public ngOnInit(): void {
    this.getAllMembers();
  }


  public getMembers():void {
    this.communicationService
      .getMember(this.nom)
      .subscribe((membres: Membre[]) => {
        this.membres = membres;
      });

    }

  public getAllMembers():void {
    this.communicationService
      .getAllMembers()
      .subscribe((membres: Membre[]) => {
        this.membres = membres;
      });
    }
}