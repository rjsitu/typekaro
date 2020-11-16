import { Injectable } from '@angular/core';
import { AuthResponse } from '../models/AuthResponse';
import { BehaviorSubject, Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { catchError, map } from 'rxjs/operators';
import { HandleError, HttpErrorHandler } from './http-error-handler.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private currentUserSubject: BehaviorSubject<AuthResponse>;
    public currentUser: Observable<AuthResponse>;
    private handleError: HandleError;

    constructor(private http: HttpClient, httpErrorHandler: HttpErrorHandler) {
        this.currentUserSubject = new BehaviorSubject<AuthResponse>(JSON.parse(localStorage.getItem('currentUser')));
        this.currentUser = this.currentUserSubject.asObservable();
        this.handleError = httpErrorHandler.createHandleError('AuthenticationService');
    }

    public get currentUserValue(): AuthResponse {
        return this.currentUserSubject.value;
    }

    getUserProfile(email: string): Observable<any> {
        return this.http.get<any>(`${environment.baseAPIUrl}/api/user/profile/?email=` + email)
            .pipe(
                catchError(this.handleError('getRecommendedGround', null))
            );
    }

    login(username: string, password: string) {
        const headers = new HttpHeaders({ 'Content-Type': 'application/x-www-form-urlencoded' });
        headers.append('Access-Control-Allow-Origin', '*');
        headers.append('Accept', 'application/json');
        var data = "grant_type=password&username=" + username + "&password=" + password;
        return this.http.post<AuthResponse>(environment.baseAPIUrl + '/oauth2/token', data, { headers: headers })
            .pipe(map(user => {
                // login successful if there's a jwt token in the response
                if (user && user.access_token) {
                    // store user details and jwt token in local storage to keep user logged in between page refreshes
                    localStorage.setItem('currentUser', JSON.stringify(user));
                    localStorage.setItem('currentEmail', username);
                    this.currentUserSubject.next(user);
                }
                return user;
            }));
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');
        localStorage.removeItem('currentEmail');
        localStorage.removeItem('userProfile');
        localStorage.setItem('reload', '1');
        this.currentUserSubject.next(null);
    }
}
