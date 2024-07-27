<%@page import="Entidad.Vehiculo"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte de Vencimiento de Mantenimientos Preventivos</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>h3{text-align: center;}</style>
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
                         <a href="MenuFlota.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded-md">
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
                        <a href="ReporteVencimientos.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
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
        <h1 class="text-3xl font-bold mb-8 text-blue-900 text-center">REPORTE DE VENCIMIENTO DE MANTENIMIENTOS PREVENTIVOS</h1>
        
        <section class="mb-8">
            <div class="p-4 bg-white border-white border rounded shadow">
                <h2 class="text-xl font-bold mb-4 text-blue-900">Elección de Vehículo</h2>
                <form method="post" action="VencimientosServlet">
                    <div class="grid grid-cols-3 gap-4">
                        <div>
                            <label for="marca" class="block mb-2">Marca</label>
                            <select name="marca" id="marca" class="w-full p-2 border border-gray-300 rounded">
                                <option value="">Seleccionar Marca</option>
                               
                                <% List<String> marcas = (List<String>) request.getAttribute("marcas");
                                   if (marcas != null) {
                                       for (String marca : marcas) {
                                           out.println("<option value=\"" + marca + "\">" + marca + "</option>");
                                       }
                                   }
                                %>
                            </select>
                        </div>
                        <div>
                            <label for="modelo" class="block mb-2">Modelo</label>
                            <select name="modelo" id="modelo" class="w-full p-2 border border-gray-300 rounded">
                                <option value="">Seleccionar Modelo</option>
                               
                                <% List<String> modelos = (List<String>) request.getAttribute("modelos");
                                   if (modelos != null) {
                                       for (String modelo : modelos) {
                                           out.println("<option value=\"" + modelo + "\">" + modelo + "</option>");
                                       }
                                   }
                                %>
                            </select>
                        </div>
                        <div class="flex items-end">
                            <button type="submit" class="w-full bg-blue-900 text-white py-2 px-4 rounded">FILTRAR</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        
        <section>
            <div class="p-4 bg-white border-white border rounded shadow">
                <h2 class="text-xl font-bold mb-4 text-blue-900">Resultados</h2>
                <table class="w-full border-collapse">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="border p-2">Marca</th>
                            <th class="border p-2">Modelo</th>
                            <th class="border p-2">Placa</th>
                            <th class="border p-2">Km Faltantes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Corregido: Se obtiene 'vehiculos' del request --%>
                        <% List<Vehiculo> vehiculos = (List<Vehiculo>) request.getAttribute("vehiculos");
                           if (vehiculos != null) {
                               for (Vehiculo vehiculo : vehiculos) {
                                   Double kilometraje = vehiculo.getKilometraje();
                                   Double kmFaltantes = 10000 - (kilometraje % 10000);
                        %>
                                   <tr>
                                       <td class="border p-2"><%= vehiculo.getMarca() %></td>
                                       <td class="border p-2"><%= vehiculo.getModelo() %></td>
                                       <td class="border p-2"><%= vehiculo.getPlaca() %></td>
                                       <td class="border p-2"><%= kmFaltantes %></td>
                                   </tr>
                        <%         }
                           }
                        %>
                    </tbody>
                </table>
                     <div class="flex justify-center mt-4">
                    <button class="mt-4 bg-blue-900 text-white py-2 px-4 rounded">GENERAR REPORTE</button>
                </div>
            </div>
                   
        </section>
    </div>
</body>
</html>
