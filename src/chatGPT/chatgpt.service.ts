/* eslint-disable prettier/prettier */
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { OpenAIApi, Configuration } from 'openai';
import { ChatGPTBuilder } from './ChatGPTBuilder';

@Injectable()
export class ChatGPTService {
  async getChatGPTResponse(ageRestriction: string, genre: string, country: string, duration: string): Promise<string> {

    // add in a method
    try {
      const configuration = new Configuration({
        apiKey: "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" // to change with dotenv XD
      });
      const openai = new OpenAIApi(configuration);

      const chatGPTBuilder = new ChatGPTBuilder();
      const question = chatGPTBuilder.build(ageRestriction, duration, genre, country);
      const response = await openai.createCompletion({
        model: "text-davinci-003",
        prompt: question,
        temperature: 0,
        max_tokens: 100,
        top_p: 1,
        frequency_penalty: 0,
        presence_penalty: 0,
        stop: ["endChatGPT"],
      });

      // Log the question built with the ChatGPTBuilder
      console.log(question);

      return response.data.choices[0].text;
    } catch (error) {
      throw new HttpException("ChatGPT server is down", HttpStatus.BAD_REQUEST);
    }

  }

}

