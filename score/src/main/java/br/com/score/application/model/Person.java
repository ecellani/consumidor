package br.com.score.application.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.springframework.data.annotation.Id;

import java.util.List;

import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_NULL;

@Data
@Builder
@ToString
@JsonInclude(NON_NULL)
public class Person {

    @Id
    private String id;
    private String cpf;
    private Integer age;
    private List properties;
}
