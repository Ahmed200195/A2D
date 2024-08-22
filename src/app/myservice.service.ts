import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MyserviceService {

  constructor() { }

  /**
   * sayHello
   */
  public sayHello(componentName:string) {
    console.log("Hello from the component: " + componentName);
  }
}
