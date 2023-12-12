package com.example;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

@Controller
public class HelloController {

    @Get(produces = MediaType.TEXT_PLAIN)
    public String index() {
        return "Hello World";
    }

    @Get(value = "/{name}", produces = MediaType.TEXT_PLAIN)
    public String index(String name) {
        return "Hello " + name;
    }
}