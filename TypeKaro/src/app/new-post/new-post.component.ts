import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../services/category.service';
import { UserService } from '../services/user.service';
import { UserPost } from '../models/UserPost';
import { Router } from '@angular/router';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
import { BehaviorSubject } from 'rxjs';

@Component({
  selector: 'app-new-post',
  templateUrl: './new-post.component.html',
  styleUrls: ['./new-post.component.css']
})
export class NewPostComponent implements OnInit {
  public Categories: any;
  public groupHeader: string;
  public groupMessage: string;
  public groupTypeId: string;
  public postForm: FormGroup;  
  public groupMessageLength = new BehaviorSubject(0);
  
  constructor(private categoryService: CategoryService, private userService: UserService, private router: Router,
    private fb: FormBuilder) {
      
     }

  ngOnInit() {
    this.postForm = this.fb.group({
      groupHeader: ['', Validators.required],
      groupMessage: ['', Validators.required],
      groupTypeId: ['', Validators.required]
    });
    this.postForm.get("groupMessage").valueChanges.subscribe((v)=> this.groupMessageLength.next(v.length));
    this.getCategories();
  }

  getCategories(): void {

    this.categoryService.getCategories()
      .subscribe((categoryData: any) => {
        this.Categories = categoryData;
      });
  }

  onSubmit() {
    console.warn(this.postForm.value);
    if (this.postForm.valid) {
      let userPost: UserPost = {
        PostId: null,
        PostHeader: this.postForm.get("groupHeader").value,
        PostMessage: this.postForm.get("groupMessage").value,
        UserId: "B385A254-F500-4AC9-B582-BC9B81FE2B04",
        GroupId: this.postForm.get("groupTypeId").value,
        CreatedDate: null,
        ModifiedDate: null,
        IsActive: true
      };

      this.userService.UserPost(userPost)
        .subscribe((postData: any) => {
          alert('Post successfully!!');
          //location.reload();
          this.router.navigate(['/feed']);
        });;
    } else {
      alert('Please select all the fields!');
    }
  }
}
