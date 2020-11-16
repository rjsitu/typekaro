import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FeedComponent } from './feed/feed.component';
import { PostComponent } from './post/post.component';
import { PostDetailsComponent } from './post-details/post-details.component';
import { LogoutComponent } from './logout/logout.component';
import { ProfileComponent } from './profile/profile.component';
import { SettingsComponent } from './settings/settings.component';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';

const routes: Routes = [
  {
    path: '', component: FeedComponent
  },
  {
    path: 'feed', component: FeedComponent,
  },
  {
    path: 'post', component: PostComponent
  },
  {
    path: 'detail/:id', component: PostDetailsComponent
  },
  {
    path: 'logout', component: LogoutComponent
  },
  {
    path: 'login', component: LoginComponent
  },
  {
    path: 'signup', component: SignupComponent
  },
  {
    path: 'profile', component: ProfileComponent
  },
  {
    path: 'settings', component: SettingsComponent
  },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    // Tell the router to use the hash instead of HTML5 pushstate.
    useHash: true,

    // In order to get anchor / fragment scrolling to work at all, we need to
    // enable it on the router.
    anchorScrolling: "enabled",

    // Once the above is enabled, the fragment link will only work on the
    // first click. This is because, by default, the Router ignores requests
    // to navigate to the SAME URL that is currently rendered. Unfortunately,
    // the fragment scrolling is powered by Navigation Events. As such, we
    // have to tell the Router to re-trigger the Navigation Events even if we
    // are navigating to the same URL.
    onSameUrlNavigation: "reload",

    // Let's enable tracing so that we can see the aforementioned Navigation
    // Events when the fragment is clicked.
    enableTracing: false,
    scrollPositionRestoration: "enabled"
  })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
