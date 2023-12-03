package org.yascode.lambdaexp.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;

@RestController
@RequestMapping("/api/v1/health")
public class HealthCheckController {

    @GetMapping("/check")
    public String healthCheck() {
        return "Application is up and running!";
    }

    @GetMapping("/ping")
    public String ping() {
        return "Ping successful!";
    }

    @GetMapping("local-date")
    public LocalDateTime localDate() {
        return LocalDateTime.now();
    }

    @GetMapping("client-ip-address")
    public String remoteAddressIP(HttpServletRequest request) {
        return "Client IP Address: " + request.getRemoteAddr();
    }

}
