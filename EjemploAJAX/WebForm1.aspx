<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EjemploAJAX.WebForm1" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Buscar número aleatorio en el servidor utilizando AJAX</title>
    <style>
        .label{
            font-size:30px;
        }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="btnNumeroAleatorio" runat="server" AutoPostBack="false">Buscar número aleatorio</asp:TextBox>
        <br />
        <asp:Label ID="lblResultado" runat="server" CssClass="label" />
    </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnNumeroAleatorio').click(function (e) {
                e.preventDefault();
 
                $.ajax({
                    type: "POST",                                              // tipo de request que estamos generando
                    url: 'default.aspx/BuscarNumAleatorio',                    // URL al que vamos a hacer el pedido
                    data: null,                                                // data es un arreglo JSON que contiene los parámetros que 
                                                                               // van a ser recibidos por la función del servidor
                    contentType: "application/json; charset=utf-8",            // tipo de contenido
                    dataType: "json",                                          // formato de transmición de datos
                    async: true,                                               // si es asincrónico o no
                    success: function (resultado) {                            // función que va a ejecutar si el pedido fue exitoso
                        var num = resultado.d;
                        $('#lblResultado').text('Número aleatorio es ' + num);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) { // función que va a ejecutar si hubo algún tipo de error en el pedido
                        var error = eval("(" + XMLHttpRequest.responseText + ")");
                        aler(error.Message);
                    }
                });
            });
        });
    </script>
</body>
</html>
