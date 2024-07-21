<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ModeloDAO.MantenimientoDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Entidad.Mantenimiento" %>
<%@ page import="Entidad.Vehiculo" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tareas Pendientes - Tecnico</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .irbtn .fa-arrow-right,p{transition: all .3s ;}
        .irbtn:hover{.fa-arrow-right{transform: translate(10px) ;}
              p{transform: scale(1.1);}} 
    </style>
</head>
<body class="bg-gray-100">
    <div class="text-white flex flex-col justify-between fixed top-0 left-0 h-screen w-3/12	p-4" style="background-color: #031936;">
        <div class="p-4">
            <div class="mb-8 text-center">
                <i class="fa-solid fa-route m-5" style="font-size: 100px;"></i>
                <h1 class="text-2xl font-bold mb-4 text-center">LA LIBERTAD</h1>
            </div>
            <nav>
                <ul>
                    <li class="mb-5">
                         <a href="TareaPendiente.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
                            <span class="material-icons mr-2">build</span>
                            <span>Tareas</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="p-4 text-right mb-4">
            <h2 class="mb-4 text-sm font-bold">TECNICO</h2>
            <p class="text-xs">Andres Guzman Huri</p>
        </div>
    </div>
    
    <div class="w-9/12 h-screen overflow-y-auto p-8" style="margin-left: 25%;">
        <h1 class="text-3xl font-bold mb-8 text-blue-900 text-center">TAREAS PENDIENTES</h1>
        <div class="grid grid-cols-2 gap-8"> 
        <%
            MantenimientoDAO mantenimientoDAO = new MantenimientoDAO();
            List<Mantenimiento> listaMantenimientos = mantenimientoDAO.obtenerMantenimientosVehiculos();

            for (Mantenimiento mantenimiento : listaMantenimientos) {
                Vehiculo vehiculo = mantenimiento.getVehiculo();
        %>
            <div class="border rounded border-black">
                <div class="p-4 bg-white rounded">
                    <h3 class="font-bold text-blue-900 text-center text-xl">
                        <%= vehiculo.getMarca() %> <%= vehiculo.getModelo() %>
                    </h3>
                    <div class="flex gap-14 my-6">
                        <h4 class="font-bold">Tipo:</h4>
                        <p>Mantenimiento <%= mantenimiento.getTipo() %></p>
                    </div>
                    <div class="flex gap-7 my-4">
                        <h4 class="font-bold text-justify">Detalles:</h4>
                        <p>Este vehículo tiene <%= vehiculo.getKilometraje() %> kilómetros y placa <%= vehiculo.getPlaca() %>.</p>
                    </div>
                </div>
                
                <a class="irbtn" href="TareaCurso.jsp">
                    <button class="bg-blue-900 text-white p-4 rounded w-full font-bold hover:bg-blue-800">
                        <p>ACEPTAR E IR <i class="fa-solid fa-arrow-right"></i></p>
                    </button>
                </a>
            </div>
        <%
            }
        %>

    </div>
    
</body>
</html>