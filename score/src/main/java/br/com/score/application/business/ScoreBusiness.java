package br.com.score.application.business;

import br.com.score.application.model.Person;
import br.com.score.infrastructure.repository.PersonRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ScoreBusiness {

    @Autowired
    private PersonRepository repository;

    public int calculate(Person person) {
        return -1;
    }
}
