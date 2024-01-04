package com.xerxestuts.quizapp.Models;

import jakarta.persistence.*;
import lombok.Data;

@Data//reduce boilerplate code
@Entity
//@Table(name = "MyBook")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer id;
    private String difficultyLevel;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String questionTitle;
    private String rightAnswer;
    private String category;


}
