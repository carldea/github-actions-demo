package com.example;

import io.micronaut.http.annotation.*;

@Controller("/demo")
public class DemoController {

    @Get(uri="/", produces="text/plain")
    public String index() {
        return "Java Version: " + System.getProperty("java.version");
    }
}
