import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { HttpErrorHandler, HandleError } from './http-error-handler.service';
import { environment } from 'src/environments/environment';
import { catchError } from 'rxjs/operators';
import { UserPost } from '../models/UserPost';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  baseUrl = environment.baseAPIUrl;
  private handleError: HandleError;

  constructor(private http: HttpClient,
    httpErrorHandler: HttpErrorHandler) {
    this.handleError = httpErrorHandler.createHandleError('UserService');
  }

  getPosts(): Observable<any> {
    let categoryApi = this.baseUrl + '/api/UserPost';
    return this.http.get<any>(categoryApi)
      .pipe(
        catchError(this.handleError('getPosts', []))
      );
  }

  getPost(postId: string): Observable<any> {
    let categoryApi = this.baseUrl + '/api/UserPost';
    return this.http.get<any>(categoryApi + "/" + postId)
      .pipe(
        catchError(this.handleError('getPosts', []))
      );
  }

  UserPost(userpost: UserPost): Observable<any> {
    return this.http.post<any>(`${environment.baseAPIUrl}/api/UserPost`, userpost)
      .pipe(
        catchError(this.handleError('UserPost', null))
      );
  }
}
