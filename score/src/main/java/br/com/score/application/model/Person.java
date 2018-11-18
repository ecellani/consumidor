package br.com.score.application.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_NULL;

@Data
@Builder
@ToString
@JsonInclude(NON_NULL)
@Document(collection = "scoredata")
public class Person {

    @Id
    private String id;
    @Indexed(unique = true)
    private String cpf;
    private Integer age;
    private List properties;
}
