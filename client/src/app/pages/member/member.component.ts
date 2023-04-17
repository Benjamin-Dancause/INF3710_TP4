import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Member } from './../../../../../common/tables/Member';
import { CommunicationService } from 'src/app/services/communication.service';

@Component({
  selector: 'app-member',
  templateUrl: './member.component.html',
  styleUrls: ['./member.component.css']
})
export class MemberComponent implements OnInit {
  @ViewChild("memberName") memberName: ElementRef;
  public members: Member[] = [];

  public constructor(private communicationService: CommunicationService) {}

  public ngOnInit(): void {
    this.memberName.nativeElement.innerText = "";
  }

  /*private refresh() {
    this.getMembers();
    this.memberName.nativeElement.innerText = "";
  }*/

  public getMembers():void {
    this.communicationService
      .getMember(this.memberName.nativeElement.innerText)
      .subscribe((members: Member[]) => {
        this.members = members;
      });
    }
}