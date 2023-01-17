import { Injectable } from '@nestjs/common';
import { OpenAIApi, Configuration } from 'openai';
import { ChatGPTBuilder } from './ChatGPTBuilder';

@Injectable()
export class ChatGPTService {
    async getChatGPTResponse(ageRestriction: string, genre: string, country: string, duration: string): Promise<string> {

        // add in a method
        const configuration = new Configuration({
          apiKey: "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" // to change with dotenv
        }); 
        const openai = new OpenAIApi(configuration);
    
        const chatGPTBuilder = new ChatGPTBuilder();
        const question = chatGPTBuilder.build(ageRestriction, duration, genre, country);
    
        const response = await openai.createCompletion( {
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
      }

}

