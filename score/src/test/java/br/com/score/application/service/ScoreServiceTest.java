package br.com.score.application.service;

import br.com.score.application.builders.PersonBuilder;
import br.com.score.application.business.ScoreBusiness;
import br.com.score.application.model.Person;
import br.com.score.infrastructure.repository.PersonRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class ScoreServiceTest {

    @Mock
    PersonRepository personRepository;

    @InjectMocks
    ScoreService scoreService;

    @Test
    public void personWithProperty() throws Exception {
        Person richPerson = PersonBuilder.srSilva();
        when(personRepository.findByCpf(richPerson.getCpf())).thenReturn(richPerson);
        assertEquals(richPerson, scoreService.getPersonByCpf(richPerson.getCpf()));
    }

    @Test
    public void personWithoutProperty() throws Exception {
        Person poor = PersonBuilder.mendigo();
        when(personRepository.findByCpf(poor.getCpf())).thenReturn(poor);
        assertEquals(poor, scoreService.getPersonByCpf(poor.getCpf()));
    }

    @Test
    public void notFound() throws Exception {
        String cpf = "000.000.000-00";
        when(personRepository.findByCpf(cpf)).thenReturn(null);
        assertEquals(null, scoreService.getPersonByCpf(cpf));
    }

    @Test
    public void cpfNotInformed() {
        assertEquals(null, scoreService.getPersonByCpf(""));
        assertEquals(null, scoreService.getPersonByCpf(" "));
        assertEquals(null, scoreService.getPersonByCpf(null));
    }
}
