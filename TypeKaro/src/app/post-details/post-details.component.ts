import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-post-details',
  templateUrl: './post-details.component.html',
  styleUrls: ['./post-details.component.css']
})
export class PostDetailsComponent implements OnInit {

  public postId: string;
  public UserPost:any;
  constructor(private route: ActivatedRoute, private userService: UserService) { }

  ngOnInit() {
    this.route.params.subscribe(params => {
      this.postId = this.route.snapshot.paramMap.get('id');
      this.getPost(this.postId);
    });
  }

  getPost(postId: string): void {
    this.userService.getPost(postId)
      .subscribe((postData: any) => {
        this.UserPost = postData;
        //console.log(this.UserPost);
      });
  }
}
