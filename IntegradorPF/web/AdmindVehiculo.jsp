
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidad.Vehiculo" %>
<%@page import="ModeloDao.VehiculoDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrar Vehículo</title>
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
       <% String placa=request.getParameter("placa");
       VehiculoDAO vehiculoDAO =new VehiculoDAO();
       Vehiculo vehiculo =vehiculoDAO.getVehiculoByPlaca(placa);
           
        %>
        
        <h1 class="text-3xl font-bold mb-8 text-blue-900 text-center">TOYOTA HILUX</h1>
        <section class="mb-8 p-8 bg-white rounded shadow">
            <h2 class="text-2xl font-bold mb-4 text-blue-900">Datos del Vehículo</h2>
            <div class="grid grid-cols-3 gap-4">
                <div>
                    <label class="block text-gray-700">Marca</label>
                    <p> <%=vehiculo.getMarca()%></p>
                </div>
                <div>
                    <label class="block text-gray-700">Modelo</label>
                    <p><%= vehiculo.getModelo()%></p>
                </div>
                <div>
                    <label class="block text-gray-700">Placa</label>
                    <p><%=vehiculo.getPlaca()%></p>
                </div>
            </div>
            <div class="mt-4">
                <label class="block text-gray-700">Kilometraje</label>
                <form action="ActualizarKilometrajeServlet" method="post"> 
                <input type="hidden" name="placa" value="<%= vehiculo.getPlaca() %>" >
                <input type="text" name="kilometraje" class="w-full p-2 border border-gray-300 rounded" value="<%= vehiculo.getKilometraje() %>">
                <button type="submit" class="mt-4 bg-blue-900 text-white py-2 px-4 rounded">ACTUALIZAR</button>
            </div>
        </section>
        
  
       <section class="p-8 bg-white rounded shadow">
    <h2 class="text-2xl font-bold mb-4 text-blue-900">Asignar Mantenimiento</h2>
    <form action="AsignarMantenimientoServlet" method="post">
        <input type="hidden" name="placa" value="<%= vehiculo.getPlaca() %>" >
        <div class="grid grid-cols-2 gap-4">
            <div>
                <label class="block text-gray-700">Tipo</label>
                <select name="tipoMantenimiento" class="w-full p-2 border border-gray-300 rounded">
                    <option value="">Seleccionar tipo</option>
                    <option value="Cambio de Aceite">Cambio de Aceite</option>
                    <option value="Revisión de Filtros">Revisión de Filtros</option>
                    <option value="Revisión de Frenos">Revisión de Frenos</option>
                    <option value="Revisión de Neumáticos">Revisión de Neumáticos</option>
                    <option value="Alineación y Balanceo">Alineación y Balanceo</option>
                    <option value="Revisión de Batería">Revisión de Batería</option>
                </select>
            </div>
        </div>
        <button type="submit" class="mt-4 bg-blue-900 text-white py-2 px-4 rounded">ASIGNAR</button>
    </form>
</section>
    </div>
</body>
</html>