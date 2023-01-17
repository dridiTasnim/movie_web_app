import { HttpService } from '@nestjs/axios';
import { ForbiddenException, Injectable } from '@nestjs/common';
import { map, catchError, identity } from 'rxjs';
const BASE_URL = 'https://api.themoviedb.org/3';
const API_KEY = '?api_key=89544fa5b5a4e780a17fb40324900182';
const genres = [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 12,
      "name": "Adventure"
    },
    {
      "id": 16,
      "name": "Animation"
    },
    {
      "id": 35,
      "name": "Comedy"
    },
    {
      "id": 80,
      "name": "Crime"
    },
    {
      "id": 99,
      "name": "Documentary"
    },
    {
      "id": 18,
      "name": "Drama"
    },
    {
      "id": 10751,
      "name": "Family"
    },
    {
      "id": 14,
      "name": "Fantasy"
    },
    {
      "id": 36,
      "name": "History"
    },
    {
      "id": 27,
      "name": "Horror"
    },
    {
      "id": 10402,
      "name": "Music"
    },
    {
      "id": 9648,
      "name": "Mystery"
    },
    {
      "id": 10749,
      "name": "Romance"
    },
    {
      "id": 878,
      "name": "Science Fiction"
    },
    {
      "id": 10770,
      "name": "TV Movie"
    },
    {
      "id": 53,
      "name": "Thriller"
    },
    {
      "id": 10752,
      "name": "War"
    },
    {
      "id": 37,
      "name": "Western"
    }
  ]

@Injectable()
export class ApiService {
  constructor(private http: HttpService) {}

  async getmoviebyid(id : string) {
    return this.http
      .get(BASE_URL+'/movie/'+id+API_KEY)
      .pipe(
        map((genre) => genre?.data),
        )
      .pipe(
        catchError(() => {
          throw new ForbiddenException('API not available');
        }),
      );
  }
  async seachmoviebykeyword(name : string){
    console.log(name);
    return this.http
    .get(BASE_URL+'/search/movie'+API_KEY+'&query='+name)
    .pipe(
      map((genre) => genre?.data),
      )
    .pipe(
      catchError(() => {
        throw new ForbiddenException('API not available');
      }),
    );
}
async getmoviesbypopularity(page:string){
    return this.http
    .get(BASE_URL+'/movie/popular'+API_KEY+'&language=en-US&page='+page)
    .pipe(
      map((genre) => genre?.data),
      )
    .pipe(
      catchError(() => {
        throw new ForbiddenException('API not available');
      }),
    );
}
  }

