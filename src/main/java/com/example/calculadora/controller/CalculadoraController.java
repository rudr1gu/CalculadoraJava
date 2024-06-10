package com.example.calculadora.controller;

import com.example.calculadora.service.CalculadoraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalculadoraController {

    @Autowired
    private CalculadoraService calculadoraService;

    @GetMapping("/calculadora")
    public String index() {
        return "index";
    }

    @PostMapping("/calcular")
    public String calcular(@RequestParam("numero1") double numero1,
                           @RequestParam("numero2") double numero2,
                           @RequestParam("operacao") String operacao,
                           Model model) {
        double resultado = 0;
        switch (operacao) {
            case "+":
                resultado = calculadoraService.adicionar(numero1, numero2);
                break;
            case "-":
                resultado = calculadoraService.subtrair(numero1, numero2);
                break;
            case "*":
                resultado = calculadoraService.multiplicar(numero1, numero2);
                break;
            case "/":
                resultado = calculadoraService.dividir(numero1, numero2);
                break;
        }
        model.addAttribute("resultado", resultado);
        return "index";
    }
}