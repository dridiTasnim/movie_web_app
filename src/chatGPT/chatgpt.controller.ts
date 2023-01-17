/* eslint-disable prettier/prettier */
import { Controller, Get, Query } from '@nestjs/common';
import { ChatGPTService } from './chatgpt.service';

@Controller()
export class ChatGptController {
    constructor(private readonly appService: ChatGPTService) { }

    @Get('/askGPT')
    async getChatGPTResponse(@Query('AgeRestriction') ageRestriction, @Query('Genre') genre, @Query('country') country, @Query('duration') duration): Promise<string> {
        return this.appService.getChatGPTResponse(ageRestriction, genre, country, duration);
    }
}
