package br.com.score.application.service;

import br.com.score.application.business.ScoreBusiness;
import br.com.score.application.model.Person;
import br.com.score.infrastructure.repository.PersonRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.apache.logging.log4j.util.Strings.isEmpty;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Slf4j
@RestController
@RequestMapping("/v1/score")
public class ScoreService {

    @Autowired
    private ScoreBusiness scoreBusiness;

    @Autowired
    private PersonRepository personRepository;

    @RequestMapping(value = "/cpf/{cpf:.+}", method = GET, produces = APPLICATION_JSON_VALUE)
    public Person getPersonByCpf(@PathVariable(value = "cpf") String cpf) {
        log.debug("Search person by CPF \"{}\"", cpf);
        if (isEmpty(cpf))
            return null;

        Person person;
        try {
            person = personRepository.findByCpf(cpf);
        } catch (Exception e) {
            throw e;
        }

        return person;
    }
}
