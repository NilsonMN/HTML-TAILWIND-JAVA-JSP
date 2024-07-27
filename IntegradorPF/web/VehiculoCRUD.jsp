<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Entidad.Vehiculo" %>
<%@page import="ModeloDao.VehiculoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento Vehículo</title>
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
                            <a href="ReporteVencimientos.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded-md">
                                <span class="material-icons mr-2">event_note</span>
                                <span>Reporte de Vencimientos</span>
                            </a>
                        </li>
                        <li class="mb-5">
                            <a href="VehiculoCRUD.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
                                <span class="material-icons mr-2">settings</span>
                                <span>Mantenimiento vehículo</span>
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
            <h1 class="text-3xl font-bold mb-8 text-blue-900 text-center">MANTENIMIENTO DE VEHÍCULOS</h1>
            
            <section class="mb-8">
                <div class="p-4 bg-white border-white border rounded shadow">
                    <h2 class="text-xl font-bold mb-4 text-blue-900">Lista de Vehículos</h2>
                    
                    <div class="flex justify-end mb-4">
                        <button onclick="document.getElementById('addModal').style.display='block'" class="bg-blue-900 text-white py-2 px-4 rounded">Agregar Vehículo</button>
                    </div>
                    
                    <table class="w-full border-collapse">
                        <thead>
                            <tr class="bg-gray-200">
                                <th class="border p-2">Placa</th>
                                <th class="border p-2">Marca</th>
                                <th class="border p-2">Modelo</th>
                                <th class="border p-2">Kilometraje</th>
                                <th class="border p-2">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                VehiculoDAO vehiculoDAO = new VehiculoDAO();
                                List<Vehiculo> listaVehiculos = vehiculoDAO.getAllVehiculos();
                                for (Vehiculo vehiculo : listaVehiculos) {
                            %>
                            <tr>
                                <td class="border p-2"><%= vehiculo.getPlaca() %></td>
                                <td class="border p-2"><%= vehiculo.getMarca() %></td>
                                <td class="border p-2"><%= vehiculo.getModelo() %></td>
                                <td class="border p-2"><%= vehiculo.getKilometraje() %></td>
                                <td class="border p-2">
                                    <button class="bg-yellow-500 text-white py-1 px-3 rounded" onclick="openEditModal('<%= vehiculo.getPlaca() %>', '<%= vehiculo.getMarca() %>', '<%= vehiculo.getModelo() %>', <%= vehiculo.getKilometraje() %>)">Editar</button>
                                    
                                    <form action="EliminarVehiculoServlet" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de que quieres eliminar este vehículo?')">
                                        <input type="hidden" name="placaVehiculo" value="<%= vehiculo.getPlaca() %>">
                                        <button type="submit" class="bg-red-500 text-white py-1 px-2 rounded">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        
        <div id="addModal" class="fixed inset-0 flex items-center justify-center bg-gray-900 bg-opacity-50 hidden">
            <div class="bg-white p-8 rounded shadow-lg">
                <h2 class="text-2xl mb-4">Agregar Vehículo</h2>
                <form action="AgregarVehiculoServlet" method="post">
                    <div class="mb-4">
                        <label for="placa" class="block text-sm font-medium text-gray-700">Placa</label>
                        <input type="text" name="placaVehiculo" id="placa" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>
                    </div>
                    <div class="mb-4">
                        <label for="marca" class="block text-sm font-medium text-gray-700">Marca</label>
                        <input type="text" name="marcaVehiculo" id="marca" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>
                    </div>
                    <div class="mb-4">
                        <label for="modelo" class="block text-sm font-medium text-gray-700">Modelo</label>
                        <input type="text" name="modeloVehiculo" id="modelo" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>
                    </div>
                    <div class="mb-4">
                        <label for="kilometraje" class="block text-sm font-medium text-gray-700">Kilometraje</label>
                        <input type="number" name="kilomentrajeVehiculo" id="kilometraje" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>
                    </div>
                    <div class="flex justify-end">
                        <button type="button" onclick="document.getElementById('addModal').style.display='none'" class="bg-gray-500 text-white py-2 px-4 rounded mr-2">Cancelar</button>
                        <button type="submit" class="bg-blue-900 text-white py-2 px-4 rounded">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
                        
        <div id="editModal" class="fixed inset-0 flex items-center justify-center bg-gray-900 bg-opacity-50 hidden">
            <div class="bg-white p-8 rounded shadow-lg">
                <h2 class="text-2xl mb-4">Editar Vehículo</h2>
                <form action="ActualizarVehiculoServlet" method="post">
                    <div class="mb-4">
                        <label for="editPlaca" class="block text-sm font-medium text-gray-700">Placa</label>
                        <input type="text" name="placaVehiculo" id="editPlaca" class="mt-1 block w-full p-2 border border-gray-300 rounded" readonly>
                    </div>
                    <div class="mb-4">
                        <label for="editMarca" class="block text-sm font-medium text-gray-700">Marca</label>
                        <input type="text" name="marcaVehiculo" id="editMarca" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>
                    </div>
                    <div class="mb-4">
                        <label for="editModelo" class="block text-sm font-medium text-gray-700">Modelo</label>
                        <input type="text" name="modeloVehiculo" id="editModelo" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>
                    </div>
                    <div class="mb-4">
                        <label for="editKilometraje" class="block text-sm font-medium text-gray-700">Kilometraje</label>
                        <input type="number" name="kilometrajeVehiculo" id="editKilometraje" class="mt-1 block w-full p-2 border border-gray-300 rounded" required>
                    </div>
                    <div class="flex justify-end">
                        <button type="button" onclick="document.getElementById('editModal').style.display='none'" class="bg-gray-500 text-white py-2 px-4 rounded mr-2">Cancelar</button>
                        <button type="submit" class="bg-blue-900 text-white py-2 px-4 rounded">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function openEditModal(placa, marca, modelo, kilometraje) {
                document.getElementById('editPlaca').value = placa;
                document.getElementById('editMarca').value = marca;
                document.getElementById('editModelo').value = modelo;
                document.getElementById('editKilometraje').value = kilometraje;
                document.getElementById('editModal').style.display = 'block';
            }
        </script>
    </body>
</html>
