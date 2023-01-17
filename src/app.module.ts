import { ChatgptModule } from './chatGPT/chatgpt.module';
import { ChatGPTService } from './chatGPT/chatgpt.service';
/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { UserModel } from './auth/model/user.model';

@Module({
  imports: [
    ChatgptModule, AuthModule, TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: "root",
      password: "",
      database: "auth-project-web",
      entities: [UserModel],
      synchronize: true,
    })],
  controllers: [AppController],
  providers: [
    ChatGPTService, AppService],
})
export class AppModule { }
