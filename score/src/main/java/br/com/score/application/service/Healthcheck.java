package br.com.score.application.service;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Healthcheck {

    @RequestMapping("/")
    public String isUp() {
        return "UP";
    }
}
