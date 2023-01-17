export class ChatGPTBuilder {

    chatGPTQuestion: string;

    filmAgeRestriction: string;
    filmDuration: string;
    filmGenre: string;
    filmCountry: string;

    addWhiteSpace(): void{
        this.chatGPTQuestion += ' '; 
    }

    setBaseQuestion(): void {
        this.chatGPTQuestion = 'Recommand me and give me a small description for a';
        this.addWhiteSpace();
    }

    addMovieAdjectives(ajectives: string[]): void{
        ajectives.forEach(adjective => {
            this.chatGPTQuestion += adjective;
            this.addWhiteSpace();
        });
    }

    addMovieAdjectivesSuffix(): void{
        this.chatGPTQuestion += 'movie';
        this.addWhiteSpace();
    }

    addDurationCondition(filmDuration: string): void{
        this.chatGPTQuestion += 'with duration ';
        this.chatGPTQuestion += filmDuration;
        this.addWhiteSpace();
    }

    addAgeCondition(filmAgeRestriction: string): void{
        this.chatGPTQuestion += 'and age restriction ';
        this.chatGPTQuestion += filmAgeRestriction;
        this.chatGPTQuestion += ' ';
    }

    addQuestionSuffix(): void{
        this.chatGPTQuestion += '?';
        this.addWhiteSpace();
        this.chatGPTQuestion += " endChatGPT"; // put in a constant file
    }

    build(filmAgeRestriction: string, filmDuration: string, filmGenre: string, filmCountry: string, ): string {
        this.setBaseQuestion();
        this.addMovieAdjectives([filmCountry, filmGenre]);
        this.addMovieAdjectivesSuffix();
        this.addDurationCondition(filmDuration);
        this.addAgeCondition(filmAgeRestriction);
        this.addQuestionSuffix();
        return this.chatGPTQuestion;
    }
}