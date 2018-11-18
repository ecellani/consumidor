package br.com.score.application.business;

import br.com.score.application.ScoreException;
import br.com.score.application.model.Person;
import br.com.score.application.model.Property;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ScoreBusiness {

    public int calculate(Person person) throws ScoreException {
        log.debug("Calculate person {}", person);
        if (person == null)
            throw new ScoreException("Person is required");

        List<Property> properties = person.getProperties();
        int score = properties == null ? 0 : properties.size();

        log.debug("Score of person {} is {}", person, score);
        return score;
    }
}
