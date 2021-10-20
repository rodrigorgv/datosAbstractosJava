
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cola de Datos</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            html {
                font-size: 62.5%;
                box-sizing: border-box;
            }

            *,
            *::before,
            *::after {
                box-sizing: inherit;
            }

            body {
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: rgb(35, 28, 43);
            }

            h1 {
                color: white;
                font-size: 40px;
                text-align: center;
            }


            h2 {
                color: hsl(345, 95%, 68%);
                text-align: center;
                font-size: 25px;

            }


            h3 {
                color: hsl(345, 95%, 68%);
                ;
                text-align: center;
                font-size: 20px;
                font-weight: bold;
            }

            .main {
                width: 80%;
                height: 70%;
                display: grid;
                grid-template-columns: 30% 70%;
            }

            .menu {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-evenly;
                height: 80%;

            }

            .menuContainer {
                position: relative;
            }

            .menu .btn {
                background-color: transparent;
                color: white;
                width: 4rem;
                font-size: 20px;
                width: 60%;
                height: 5rem;
                border: 3px solid rgb(79, 77, 95);
                border-radius: 25px;
                cursor: pointer;
                transition: ease .3s;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .btn:hover {
                color: hsl(345, 95%, 68%);
                background-color: white;
            }

            a {
                text-decoration: none;
                color: white;
                height: 100%;
                display: flex;
                width: 100%;
                justify-content: center;
                align-items: center;

            }

            .btn:hover>a {
                color: hsl(345, 95%, 68%);
            }

            .datosNuevo {
                display: none;
            }

            .mostrar {
                position: absolute;
                height: 100%;
                background-color: rgb(35, 28, 43);
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-evenly;
            }

            .txtdato {
                padding: 1rem 2rem;
                border-radius: 10px;
            }

            .tittle {
                height: 10rem;
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                justify-content: space-between;
            }

            .close {
                cursor: pointer;
            }

            .datos {
                display: flex;
                flex-direction: column;
                align-items: center;

            }

            .table {
                width: 50%;
                table-layout: fixed;




            }

            .table tr, .table td{
                padding: 0 4rem;
                text-align: center;
                color: white;
                font-size: 18px;
            }

            .table td{
                height: 4.5rem;
            }
        </style>
    </head>

    <body>
        <header>
            <h1>Cola de Datos</h1>
            <h3>seleccione una opción del menu</h3>

        </header>
        <main class="main">
            <form action="srvCola" class="menuContainer" method="get">
                <h2>Menu</h2>
                <div class="menu">
                    <button class="btn" type="button" onclick="mostrar()">encolar</button>
                    <div id="datos" class="datosNuevo">
                        <div class="tittle">
                            <svg onclick="quitar()" class="close" width="20" height="20" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M17.778.808l1.414 1.414L11.414 10l7.778 7.778-1.414 1.414L10 11.414l-7.778 7.778-1.414-1.414L8.586 10 .808 2.222 2.222.808 10 8.586 17.778.808z"
                                fill="#FFF" fill-rule="evenodd" />
                            </svg>
                            <h3>Ingrese el dato que desea Acolar</h3>

                        </div>
                        <input type="text" name="txtDato" class="txtdato" placeholder="ingrese el dato aqui" required>
                        <button type="submit" value="add" name="btn" class="btn">ENCOLAR</button>
                    </div>
                    <button  class="btn" type="button" onclick="mostrar2()">desencolar</button>
            </form>

            <div id="datos2" class="datosNuevo">

                <div class="tittle">
                    <svg onclick="quitar2()" class="close" width="20" height="20" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M17.778.808l1.414 1.414L11.414 10l7.778 7.778-1.414 1.414L10 11.414l-7.778 7.778-1.414-1.414L8.586 10 .808 2.222 2.222.808 10 8.586 17.778.808z"
                        fill="#FFF" fill-rule="evenodd" />
                    </svg>
                    <h3>¿Seguro que quieres eliminar el dato?</h3>
                    <form action="srvCola" method="get">
                </div>
                <button type="submit" value="delete" name="btn" class="btn">ELIMINAR</button>
            </div>
            <button class="btn" type="button"><a href="index.html"> salir</a></button>
        </div>
    </form>
    <div class="datos">
        <h2>Datos</h2>
        <table class="table" border="2">
            <tbody>
                <tr>
                    <td id="position0"></td>
                </tr>
                <tr>
                    <td id="position1"></td>
                </tr>
                <tr>
                    <td id="position2"></td>
                </tr>
                <tr>
                    <td id="position3"></td>
                </tr>
                <tr>
                    <td id="position4"></td>
                </tr>
                <tr>
                    <td id="position5"></td>
                </tr>
                <tr>
                    <td id="position6"></td>
                </tr>
                <tr>
                    <td id="position7"></td>
                </tr>
                <tr>
                    <td id="position8"></td>
                </tr>
                <tr>
                    <td id="position9"></td>
                </tr>
            </tbody>
            <%

                if (request.getAttribute("datos") != null) {
                    int valor = Integer.parseInt(request.getAttribute("datos2").toString());
                    if (valor == 0) {
                        String[] datos = (String[]) request.getAttribute("datos");
                      
            %>
            <script>
                <%for (int i = 0; i < 10; i++) {%>
                document.getElementById("position" + <%=i%>).innerText = `<%= datos[i]%>`;
                <%
                            }%>
            </script>
            <%
            } else {
            %>
            <script>alert("ALERTA, la cola se encuentra llena, para continuar debe desencolar un dato")</script>
            <%
                    }
                }
            %>


        </table>

    </div>
</main>

<script>
    function mostrar() {
        var x = document.getElementById("datos");
        if (x.className == "datosNuevo") {
            x.className = "mostrar";
        } else {
            x.className = "datosNuevo";
        }
    }

    function mostrar2() {
        var x = document.getElementById("datos2");
        if (x.className == "datosNuevo") {
            x.className = "mostrar";
        } else {
            x.className = "datosNuevo";
        }
    }

    function quitar() {
        var x = document.getElementById("datos");
        x.className = "datosNuevo";
    }

    function quitar2() {
        var x = document.getElementById("datos2");
        x.className = "datosNuevo";
    }



</script>
</body>

</html>