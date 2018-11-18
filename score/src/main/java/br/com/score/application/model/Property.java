package br.com.score.application.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.springframework.data.annotation.Id;

import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_NULL;

@Data
@Builder
@ToString
@JsonInclude(NON_NULL)
public class Property {

    @Id
    private String id;
    private String name;
    private String address;
    private String incomeSource;
}
