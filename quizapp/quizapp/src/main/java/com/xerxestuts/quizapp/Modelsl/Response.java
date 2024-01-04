package com.xerxestuts.quizapp.Modelsl;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data//lombok
@RequiredArgsConstructor
public class Response {
    private Integer id;
    private String response;
}
