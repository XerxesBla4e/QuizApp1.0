package com.xerxestuts.quizapp.Models;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Data
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer id;
    private String quizTitle;

    @ManyToMany
    private List<Question> questions;
}
