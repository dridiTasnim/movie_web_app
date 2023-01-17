import { Controller, Get, Param } from "@nestjs/common";
import { ApiService } from "./api.service";

@Controller("api")
export class ApiController {
  constructor(private apiService: ApiService) {}

  @Get('/get/:id')
  nice(@Param('id') id) {
    return this.apiService.getmoviebyid(id);
  }
  @Get('/search/:name')
  nicee(@Param('name') name){
    return this.apiService.seachmoviebykeyword(name);
  }
  @Get('popular/:page')
  pop(@Param('page') page){
    return this.apiService.getmoviesbypopularity(page);
  }
}
