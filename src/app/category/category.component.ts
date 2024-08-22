import { Component, OnInit } from '@angular/core';
import { MyserviceService } from '../myservice.service';
import { category } from '../category';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-category',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './category.component.html',
  styleUrl: './category.component.css'
})
export class CategoryComponent implements OnInit{

  cat:category = new category(0, "UnKnown");


  constructor(private service:MyserviceService){

  }

  ngOnInit(): void {
    this.service.sayHello("Category");
  }

  onSubmit(){
    console.log(this.cat)
  }

}
