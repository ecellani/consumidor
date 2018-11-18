package br.com.score.application.business;

import br.com.score.application.ScoreException;
import br.com.score.application.builders.PersonBuilder;
import br.com.score.application.model.Person;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

@RunWith(MockitoJUnitRunner.class)
public class ScoreBusinessTest {

    @InjectMocks
    ScoreBusiness scoreBusiness;

    @Test
    public void calculateRichPerson() throws Exception {
        Person richPerson = PersonBuilder.srSilva();
        int score = scoreBusiness.calculate(richPerson);
        assertEquals(2, score);
    }

    @Test
    public void calculatePoorPerson() throws Exception {
        Person poor = PersonBuilder.mendigo();
        int score = scoreBusiness.calculate(poor);
        assertEquals(0, score);
    }

    @Test(expected = ScoreException.class)
    public void personNotInformed() throws Exception {
        scoreBusiness.calculate(null);
    }
}
