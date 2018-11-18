package br.com.score.application.builders;

import br.com.score.application.model.Property;

public class PropertyBuilder {

    public static Property triplexGuaruja() {
        return Property.builder()
                .name("Triplex no Guarujá")
                .address("R. Ver. Roberto Gelsomini, 235")
                .incomeSource("Povo")
                .build();
    }

    public static Property sitioAtibaia() {
        return Property.builder()
                .name("Sítio em Atibaia")
                .address("Rua sem nome, Atibaia")
                .incomeSource("Família")
                .build();
    }
}
