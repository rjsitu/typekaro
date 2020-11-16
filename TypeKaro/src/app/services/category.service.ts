import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HandleError, HttpErrorHandler } from './http-error-handler.service';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  baseUrl = environment.baseAPIUrl;
  private handleError: HandleError;

  constructor(private http: HttpClient,
    httpErrorHandler: HttpErrorHandler) {
    this.handleError = httpErrorHandler.createHandleError('CategoryService');
  }

  getCategories(): Observable<any> {
    let categoryApi = this.baseUrl + '/api/GroupType';
    return this.http.get<any>(categoryApi)
      .pipe(
        catchError(this.handleError('getCategories', []))
      );
  }
}
