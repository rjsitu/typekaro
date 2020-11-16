import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MenuComponent } from './menu/menu.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { SettingsComponent } from './settings/settings.component';
import { ProfileComponent } from './profile/profile.component';
import { PostComponent } from './post/post.component';
import { PostDetailsComponent } from './post-details/post-details.component';
import { FooterComponent } from './footer/footer.component';
import { FeedComponent } from './feed/feed.component';
import { LogoutComponent } from './logout/logout.component';
import { NewPostComponent } from './new-post/new-post.component';
import { AuthService } from './services/auth.service';
import { HttpErrorHandler } from './services/http-error-handler.service';
import { MessageService } from './services/message.service';
import { JwtInterceptor } from './services/jwt.Interceptor';
import { ErrorInterceptor } from './services/error.Interceptor';
import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { NgpSortModule } from "ngp-sort-pipe";

@NgModule({
  declarations: [
    AppComponent,
    MenuComponent,
    SidebarComponent,
    LoginComponent,
    SignupComponent,
    SettingsComponent,
    ProfileComponent,
    PostComponent,
    PostDetailsComponent,
    FooterComponent,
    FeedComponent,
    LogoutComponent,
    NewPostComponent
  ],
  imports: [
    BrowserModule,    
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    NgpSortModule
  ],
  providers: [
    AuthService,    
    HttpErrorHandler,
    MessageService,   
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
