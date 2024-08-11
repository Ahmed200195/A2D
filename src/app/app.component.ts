import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { LoginComponent } from "./login/login.component";
import { NgFor } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, LoginComponent, NgFor, FormsModule, CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {

  colors = ['Red', 'Blue', 'Green'];

  title = 'MyAngularProject';

  name="Ahmed Delwan";
  age = 23;

  isAuth:boolean = false;
  stateLog = "Login";

  toggleLogin(){
    this.isAuth = !this.isAuth;
    this.stateLog = this.isAuth ? "Logout" : "Login";
  }

  MyFunction(){
    alert("Hello !!!");
  }

  OnChange(){
    alert("Ok Changed!");
  }
}
