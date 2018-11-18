package br.com.score.infrastructure.repository;

import br.com.score.application.model.Person;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface PersonRepository extends MongoRepository<Person, String> {

    @Query("{cpf:'?0'}")
    Person findByCpf(String cpf);
}
