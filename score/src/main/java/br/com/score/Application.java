package br.com.score;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class Application {

    public static void main(String... args) {
        new SpringApplicationBuilder(Application.class)
                .properties("spring.config.name:application")
                .build()
                .run(args);
    }
}
