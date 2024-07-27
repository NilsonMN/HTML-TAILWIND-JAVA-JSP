<%@page import="ModeloDao.TecnicoDAO"%>
<%@page import="Entidad.Tecnico"%>
<%@page import="ModeloDAO.TecnicoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Entidad.Vehiculo" %>
<%@ page import="ModeloDAO.VehiculoDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitudes de aprobacion</title>
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
                         <a href="SupervisorAprobacion.jsp" class="flex items-center p-2 hover:bg-gray-700 rounded-md">
                            <span class="material-icons mr-2">directions_car</span>
                            <span>Solicitudes</span>
                        </a>
                    </li>
                    <li class="mb-5">
                        <a href="ReporteMantenimientoTecnico.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
                            <span class="material-icons mr-2">build</span>   
                            <span>Reporte de Mantenimiento</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="p-4 text-right mb-4">
            <h2 class="mb-4 text-sm font-bold">SUPERVISOR DEL TALLER</h2>
            <p class="text-xs">Andres Guzman Huri</p>
        </div>
    </div>
       <div class="w-9/12 h-screen overflow-y-auto p-8" style="margin-left: 25%;">
        <h1 class="text-3xl font-bold mb-8 text-blue-900" style="text-align: center">REPORTE DE MANTENIMIENTO POR TECNICO</h1>
        <section class="mb-8">
            <div class="p-4 bg-white border-white border rounded shadow">
                <h2 class="text-xl font-bold mb-4 text-blue-900">Detalles de Reporte</h2>
                <form method="GET" action="ReporteMantenimiento.jsp">
                    <label for="placa" class="block mb-2"><b>Tecnico:</b></label>
                    <select id="placa" name="placa" class="w-full p-2 border border-gray-300 rounded">
                        <option>Seleccione un tecnico</option>
                        <% 
                            TecnicoDAO tecnicoDAO = new TecnicoDAO();
                            List<Tecnico> listaTecnico = tecnicoDAO.ListarTodoTecnico();
                            for(Tecnico tecnico :listaTecnico ){
                        %>
                        <option value=""><%= tecnico.getNombre() %> <%= tecnico.getApllPat() %> <%= tecnico.getApllMat() %></option>
                        <%
                            }
                        %>
                    </select>
                    <p>
                        
                    </p>
                    <table class="w-full p-2">
                        <tr>
                            <td>
                                <label for="placa" class="block mb-2"><b>Mes :</b></label>
                            </td>
                            <td>
                                <label for="placa" class="block mb-2"><b>Año :</b></label>
                            </td>
                            <td>
                                <label for="placa" class="block mb-2"><b>Tipo de Mantenimiento :</b></label>
                            </td>
                        </tr>
                        <tr>
                            <td>                          
                                <select id="mes" name="mes" class="w-80 p-2 border border-gray-300 rounded">
                                
                                </select>
                                
                            </td>
                            <td>
                                <select id="anio" name="anio" class="w-80 p-2 border border-gray-300 rounded">

                                </select>
                            </td>
                            <td>
                                <select id="tipoMan" name="tipoMan" class="w-80 p-2 border border-gray-300 rounded">
                                    <option value="">Preventido</option>
                                    <option value="">Corectivo</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <P>
                    <button type="submit" class="mt-4 bg-blue-900 text-white py-2 px-4 rounded">FILTRAR</button>
                </form>
            </div>
        </section>
        <div class="w-full p-2 bg-white border border-gray-300 rounded">
        <h2 class="text-2xl font-bold mb-4 text-blue-900">Resumen</h2>
            <table class="w-full border p-2">
                <thead>
                    <tr class="bg-black-200">
                        <th class="border p-2">Nombre</th>
                        <th class="border p-2">Tipo</th>
                        <th class="border p-2">Fecha</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        <button type="submit" class="mt-4 bg-blue-900 text-white py-2 px-4 rounded">GENERAR REPORTE</button>
        </div>
    </div>

</body>
<script>
        document.addEventListener('DOMContentLoaded', (event) => {
            const meses = [
                { value: '01', text: 'Enero' },
                { value: '02', text: 'Febrero' },
                { value: '03', text: 'Marzo' },
                { value: '04', text: 'Abril' },
                { value: '05', text: 'Mayo' },
                { value: '06', text: 'Junio' },
                { value: '07', text: 'Julio' },
                { value: '08', text: 'Agosto' },
                { value: '09', text: 'Septiembre' },
                { value: '10', text: 'Octubre' },
                { value: '11', text: 'Noviembre' },
                { value: '12', text: 'Diciembre' }
            ];

            const selectMes = document.getElementById('mes');
            const optionDefaultMes = document.createElement('option');
            optionDefaultMes.value = '';
            optionDefaultMes.text = 'Seleccionar Mes';
            selectMes.appendChild(optionDefaultMes);

            meses.forEach(mes => {
                const option = document.createElement('option');
                option.value = mes.value;
                option.text = mes.text;
                selectMes.appendChild(option);
            });

            const selectAnio = document.getElementById('anio');
            const optionDefaultAnio = document.createElement('option');
            optionDefaultAnio.value = '';
            optionDefaultAnio.text = 'Seleccionar Año';
            selectAnio.appendChild(optionDefaultAnio);

            const currentYear = new Date().getFullYear();
            const startYear = 2000; // Puedes cambiar el año de inicio según tus necesidades

            for (let year = startYear; year <= currentYear; year++) {
                const option = document.createElement('option');
                option.value = year;
                option.text = year;
                selectAnio.appendChild(option);
            }
        });
    </script>
</html>