<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/style.css">
    <title>Calculadora Java</title>
    <script>
        function enviarOperacao(operacao) {
            document.getElementById("operacao").value = operacao;
            if (operacao === "=") {
                var screen = document.getElementById('screen');
                var valor = screen.innerText.split(" ");
                document.getElementById("numero1").value = valor[0];
                document.getElementById("numero2").value = valor[2];
                document.getElementById('calculadoraForm').submit();
            }
        }
        function adicionarNumero(numero) {
            var screen = document.getElementById('screen');
            if (screen.innerText === "0") {
                screen.innerText = numero;
            } else {
                screen.innerText += numero;
            }
        }
        function adicionarOperador(operador) {
            var screen = document.getElementById('screen');
            screen.innerText += " " + operador + " ";
        }
    </script>
</head>
<body>
    <h1>Calculadora Java</h1>

    <section class="corpoCalc">
        <form id="calculadoraForm" action="/calcular" method="post">
            <input type="hidden" name="operacao" id="operacao">
            <div class="screen" id="screen">
                <%= request.getAttribute("resultado") != null ? request.getAttribute("resultado") : 0 %>
            </div>
            <div class="buttons">
                <button type="button" class="btn" onclick="adicionarNumero('7')">7</button>
                <button type="button" class="btn" onclick="adicionarNumero('8')">8</button>
                <button type="button" class="btn" onclick="adicionarNumero('9')">9</button>
                <button type="button" class="btn" onclick="adicionarOperador('/')">/</button>
                <button type="button" class="btn" onclick="adicionarNumero('4')">4</button>
                <button type="button" class="btn" onclick="adicionarNumero('5')">5</button>
                <button type="button" class="btn" onclick="adicionarNumero('6')">6</button>
                <button type="button" class="btn" onclick="adicionarOperador('*')">*</button>
                <button type="button" class="btn" onclick="adicionarNumero('1')">1</button>
                <button type="button" class="btn" onclick="adicionarNumero('2')">2</button>
                <button type="button" class="btn" onclick="adicionarNumero('3')">3</button>
                <button type="button" class="btn" onclick="adicionarOperador('-')">-</button>
                <button type="button" class="btn" onclick="adicionarNumero('0')">0</button>
                <button type="button" class="btn" onclick="adicionarNumero('.')">.</button>
                <button type="button" class="btn" onclick="enviarOperacao('=')">=</button>
                <button type="button" class="btn" onclick="adicionarOperador('+')">+</button>
            </div>
            <input type="hidden" name="numero1" id="numero1">
            <input type="hidden" name="numero2" id="numero2">
        </form>
    </section>
</body>
</html>
