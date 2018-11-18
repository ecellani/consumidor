package br.com.score.application.service;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import java.net.URL;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.IsEqual.equalTo;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = RANDOM_PORT)
public class HealthcheckTest {

    @LocalServerPort
    private int port;

    private URL url;

    @Autowired
    private TestRestTemplate template;

    @Before
    public void setUp() throws Exception {
        this.url = new URL("http://localhost:" + port + "/challenge");
    }

    @Test
    public void isUp() throws Exception {
        ResponseEntity<String> response = template.getForEntity(url.toString(), String.class);
        assertThat(response.getBody(), equalTo("UP"));
    }
}
