package com.xerxestuts.quizapp.Interface;

import com.xerxestuts.quizapp.Models.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizDao extends JpaRepository<Quiz, Integer> {
}
