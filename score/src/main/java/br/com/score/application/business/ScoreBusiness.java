package br.com.score.application.business;

import br.com.score.application.ScoreException;
import br.com.score.application.model.Person;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ScoreBusiness {

    public int calculate(Person person) throws ScoreException {
        if (person == null)
            throw new ScoreException("Person is required");
        return -1;
    }
}
