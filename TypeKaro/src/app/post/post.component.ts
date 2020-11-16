import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';
import { Subscription, interval } from 'rxjs';

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.css']
})
export class PostComponent implements OnInit {

  public UserPosts: any;
  private updateSubscription: Subscription;

  constructor(private userService: UserService) { }

  ngOnInit() {
    this.updateSubscription = interval(2000).subscribe(
      (val) => {
        //this.getPosts();
      });
      this.getPosts();
  }

  getPosts(): void {
    this.userService.getPosts()
      .subscribe((postData: any) => {
        this.UserPosts = postData;
      });
  }

  ngOnDestroy(): void {
    this.updateSubscription.unsubscribe();
  }

}
