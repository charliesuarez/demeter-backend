package com.demeter.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Main
{
    public static void main(String[] arguments)
    {
	SpringApplication.run(Main.class, arguments);
    }

    @GetMapping("/")
    public String root()
    {
	return "Demeter Backend";
    }
}
