import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "../pages/app/app.component";
import { MemberComponent } from "../pages/member/member.component";
import { ReservationComponent } from "../pages/reservation/reservation.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  {path: 'membres', component: MemberComponent},
  { path: "reservations", component: ReservationComponent },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
