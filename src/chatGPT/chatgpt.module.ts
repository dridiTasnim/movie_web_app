/* eslint-disable prettier/prettier */
/*
https://docs.nestjs.com/modules
*/

import { Module } from '@nestjs/common';
import { ChatGptController } from './chatgpt.controller';
import { ChatGPTService } from './chatgpt.service';

@Module({
    imports: [],
    controllers: [ChatGptController],
    providers: [ChatGPTService],
})
export class ChatgptModule { }
