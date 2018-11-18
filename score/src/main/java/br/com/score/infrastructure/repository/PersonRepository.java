package br.com.score.infrastructure.repository;

import br.com.score.application.model.Person;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface PersonRepository extends MongoRepository<Person, String> {

    Person findByCpf(String cpf);
    List<Person> findByAge(Integer age);
}
