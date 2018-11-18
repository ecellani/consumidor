package br.com.score.application.business;

import br.com.score.application.builders.PersonBuilder;
import br.com.score.application.model.Person;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class ScoreBusinessTest {

    @Autowired
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
}
