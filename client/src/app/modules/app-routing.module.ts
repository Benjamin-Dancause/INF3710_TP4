import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "../pages/app/app.component";
import { MemberComponent } from "../pages/member/member.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  {path: 'membres', component: MemberComponent},
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
