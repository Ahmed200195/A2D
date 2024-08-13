import { Routes } from '@angular/router';
import { ArticleComponent } from './article/article.component';
import { CategoryComponent } from './category/category.component';
import { ClientComponent } from './client/client.component';
import { LoginComponent } from './login/login.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';

export const routes: Routes = [
    {
        path:'',
        redirectTo:'',
        pathMatch:'full'
    },
    {
        path:'article',
        component:ArticleComponent,
        pathMatch:'full'
    },
    {
        path:'category',
        component:CategoryComponent,
        pathMatch:'full'
    },
    {
        path:'client',
        component:ClientComponent,
        pathMatch:'full'
    },
    {
        path:'login',
        component:LoginComponent,
        pathMatch:'full'
    },
    {
        path:'**',
        component:PageNotFoundComponent
    },
];
