package br.com.score.application.builders;

import br.com.score.application.model.Person;

import static java.util.Arrays.asList;

public class PersonBuilder {

    public static Person srSilva() {
        return Person.builder()
                .id("1")
                .cpf("465.092.081-72")
                .age(73)
                .properties(asList(
                        PropertyBuilder.triplexGuaruja(),
                        PropertyBuilder.sitioAtibaia()
                )).build();
    }

    public static Person mendigo() {
        return Person.builder()
                .id("2")
                .cpf("524.432.897-29")
                .age(33)
                .build();
    }
}
