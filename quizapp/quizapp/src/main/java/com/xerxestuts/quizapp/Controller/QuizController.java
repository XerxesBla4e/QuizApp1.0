package com.xerxestuts.quizapp.Controller;

import com.xerxestuts.quizapp.Models.Question;
import com.xerxestuts.quizapp.Models.QuestionWrapper;
import com.xerxestuts.quizapp.Modelsl.Response;
import com.xerxestuts.quizapp.Service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("quiz")
public class QuizController {

    @Autowired
    QuizService quizService;

    @PostMapping("create")
    public ResponseEntity<String> createQuiz(@RequestParam String category,
                                             @RequestParam int numQ, @RequestParam String title) {
        return quizService.createQuiz(category, numQ, title);
    }

    @GetMapping("get/{id}")
    public ResponseEntity<List<QuestionWrapper>> getQuizQuestions(@PathVariable Integer id) {
        return quizService.getQuizQuestion(id);
    }

    @PostMapping("submit/{id}")
    public ResponseEntity<Integer> submitQuiz(@PathVariable Integer id,@RequestBody List<Response> responses){
        return quizService.calculateResult(id,responses);
        /*
        example of request to this
        [
        {"id":3
        "response":"right_answer"},
        {"id":4
        "response":"right_answer1"}
        ]
         */
    }
}
