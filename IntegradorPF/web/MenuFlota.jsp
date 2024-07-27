<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="Entidad.Vehiculo, ModeloDao.VehiculoDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flota de Vehículos</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>h3{text-align: center;}</style>
</head>

<body class="bg-gray-100">
    <div class="text-white flex flex-col justify-between fixed top-0 left-0 h-screen w-3/12 p-4" style="background-color: #031936;">
        <div class="p-4">
            <div class="mb-8 text-center">
                <i class="fa-solid fa-route m-5" style="font-size: 100px;"></i>
                <h1 class="text-2xl font-bold mb-4 text-center">LA LIBERTAD</h1>
            </div>
            <nav>
                <ul>
                    <li class="mb-5">
                         <a href="MenuFlota.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
                            <span class="material-icons mr-2">directions_car</span>
                            <span>Vehículos</span>
                        </a>
                    </li>
                    <li class="mb-5">
                        <a href="ReporteMantenimiento.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded-md">
                            <span class="material-icons mr-2">build</span>   
                            <span>Reporte de Mantenimiento</span>
                        </a>
                    </li>
                    <li class="mb-5">
                        <a href="ReporteVencimientos.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded-md">
                            <span class="material-icons mr-2">event_note</span>
                            <span>Reporte de Vencimientos</span>
                        </a>
                    </li>
                     <li class="mb-5">
                       <a href="VehiculoCRUD.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded-md">
                            <span class="material-icons mr-2">settings</span>
                            <span>Mantenimiento vehiculo</span>
                       </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="p-4 text-right mb-4">
            <h2 class="mb-4 text-sm font-bold">ADMINISTRACION</h2>
            <p class="text-xs">Andres Guzman Huri</p>
        </div>
    </div>

    <div class="w-9/12 h-screen overflow-y-auto p-8" style="margin-left: 25%;">
        <h1 class="text-3xl font-bold mb-8 text-blue-900" style="text-align: center">FLOTA DE VEHICULOS</h1>
        <section class="mb-8">
            <h2 class="text-xl font-bold mb-4 text-blue-900">Registrados con Fallo</h2>
            <div class="grid grid-cols-3 gap-4">
                <%
                   
                    List<Vehiculo> vehiculosConFalla = (List<Vehiculo>) session.getAttribute("vehiculosConFalla");
                    
                   
                    if (vehiculosConFalla == null) {
                        vehiculosConFalla = new ArrayList<>();
                        session.setAttribute("vehiculosConFalla", vehiculosConFalla);
                    }
                    
                    
                    if (vehiculosConFalla.isEmpty()) {
                %>
                <p>No hay vehículos reportados con fallas.</p>
                <% } else { %>
                    <% 
                    for (Vehiculo vehiculo : vehiculosConFalla) { %>
                    <div class="p-4 bg-red-100 border rounded shadow border-black">
                        <h3 class="font-bold text-blue-900"><%= vehiculo.getMarca() %> <%= vehiculo.getModelo() %></h3>
                        <p><%= vehiculo.getKilometraje() %> km</p>
                        <p><%= vehiculo.getPlaca() %></p>
                        <a href="AdmindVehiculo.jsp?placa=<%= vehiculo.getPlaca() %>">
                            <button class="mt-4 bg-blue-900 text-white py-2 px-4 rounded">ADMINISTRAR</button>
                        </a>
                    </div>
                    <% } %>
                <% } %>
            </div>
        </section>
        <section class="mb-8">
            <h2 class="text-xl font-bold mb-4 text-blue-900">Todos los vehículos</h2>
            <div class="grid grid-cols-3 gap-4">
                <%
                   
                    VehiculoDAO vehiculoDAO = new VehiculoDAO();
                    List<Vehiculo> vehiculos = vehiculoDAO.getAllVehiculos();
                   
                    
                    for (Vehiculo vehiculo : vehiculos) {
                %>
                <div class="p-4 bg-white border rounded shadow border-black">
                    <h3 class="font-bold text-blue-900"><%= vehiculo.getMarca() %> <%= vehiculo.getModelo() %></h3>
                    <p><%= vehiculo.getKilometraje() %> km</p>
                    <p><%= vehiculo.getPlaca() %></p>
                    <a href="AdmindVehiculo.jsp?placa=<%= vehiculo.getPlaca() %>">
                        <button class="mt-4 bg-blue-900 text-white py-2 px-4 rounded">ADMINISTRAR</button>
                    </a>
                </div>
                <% } %>
            </div>
        </section>
    </div>
</body>
</html>
