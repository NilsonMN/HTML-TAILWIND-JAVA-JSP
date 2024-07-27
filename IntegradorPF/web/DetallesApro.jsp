<%@page import="Entidad.Tarea"%>
<%@page import="Entidad.MantenimientoTarea"%>
<%@page import="Entidad.Mantenimiento"%>
<%@page import="Entidad.VehiculoMantenimiento"%>
<%@page import="ModeloDao.TareaDAO"%>
<%@page import="ModeloDao.MantenimientoTareaDAO"%>
<%@page import="ModeloDao.MantenimientoDAO"%>
<%@page import="ModeloDao.VehiculoMantenimientoDAO"%>
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
                         <a href="SupervisorAprobacion.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
                            <span class="material-icons mr-2">directions_car</span>
                            <span>Solicitudes</span>
                        </a>
                    </li>
                    <li class="mb-5">
                        <a href="ReporteMantenimientoTecnico.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded-md">
                            <span class="material-icons mr-2">build</span>   
                            <span>Reporte de Mantenimiento</span>
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
        
        <h1 class="text-3xl font-bold mb-8 text-blue-900 text-center">DETALLES DE APROBACION</h1>
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
        </section>
        
  
        <section class="p-8 bg-white rounded shadow">
            <h2 class="text-2xl font-bold mb-4 text-blue-900">Tareas desarrolladas</h2>
            <table class="w-full border p-2">
                <thead>
                    <tr class="bg-black-200">
                        <th class="border p-2">Nombre</th>
                        <th class="border p-2">Tipo</th>
                        <th class="border p-2">Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        VehiculoMantenimientoDAO vehiculoMantenimientoDAO = new VehiculoMantenimientoDAO();
                        MantenimientoDAO mantenimientoDAO = new MantenimientoDAO();
                        MantenimientoTareaDAO mantenimientoTareaDAO = new MantenimientoTareaDAO();
                        TareaDAO tareaDAO = new TareaDAO();
                        VehiculoMantenimiento objVehiMante = vehiculoMantenimientoDAO.buscarManPorPlaca(placa);
                        Mantenimiento objMantenimiento = mantenimientoDAO.buscarPorIdMante(objVehiMante.getCodMantenimiento());
                        MantenimientoTarea objManteTare = mantenimientoTareaDAO.buscariddManteTarea(objMantenimiento.getCodMantenimiento());
                        Tarea objTarea = tareaDAO.buscarIDTarea(objManteTare.getCodTarea());
                    %>
                    <tr>
                        <td class="border p-2"><%= objTarea.getNombre() %> </td>
                        <td class="border p-2">Tarea</td>
                        <td class="border p-2"><%= objTarea.getFechInicio() %></td>
                    </tr>
                    <tr>
                        <td class="border p-2"><%= objMantenimiento.getTipo() %></td>
                        <td class="border p-2">Mantenimiento</td>
                        <td class="border p-2"></td>
                    </tr>
                </tbody>
            </table>
            <button class="mt-4 bg-green-900 text-white py-2 px-4 rounded">APROBAR</button>
            <button class="mt-4 bg-red-900 text-white py-2 px-4 rounded">DESAPROBAR</button>
        </section>
    </div>
</body>
</html>