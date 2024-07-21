<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloDao.MaterialesDAO, Entidad.Materiales, java.util.List, java.util.ArrayList, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tarea En Curso - Tecnico</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
</head>
<body class="bg-gray-100">
    <script>
        function alerta(){
            alert("️🚫️🚫 ALERTA 🚫️🚫\n\Debes marcar como FINALIZADA la tarea para regresar");
        }
        function agregarTarea() {
            var tareaInput = document.getElementById("tarea");
            var descripcionInput = document.getElementById("descripcion");
            var tarea = tareaInput.value;
            var descripcion = descripcionInput.value;

            if (tarea.trim() === "" || descripcion.trim() === "") {
                alert("Por favor, complete todos los campos.");
                return;
            }

            var table = document.getElementById("tablaTareas");
            var newRow = table.insertRow(-1);
            var cell1 = newRow.insertCell(0);
            var cell2 = newRow.insertCell(1);

            cell1.className = "whitespace-nowrap px-6 py-4";
            cell2.className = "whitespace-nowrap px-6 py-4";
            cell1.innerHTML = tarea;
            cell2.innerHTML = descripcion;
            tareaInput.value = "";
            descripcionInput.value = "";
        }

        window.onload = function() {
            var startTime = new Date();
            var cronometro = document.getElementById("cronometro");

            setInterval(function() {
                var currentTime = new Date();
                var elapsedTime = new Date(currentTime - startTime);
                var hours = elapsedTime.getUTCHours().toString().padStart(2, '0');
                var minutes = elapsedTime.getUTCMinutes().toString().padStart(2, '0');
                var seconds = elapsedTime.getUTCSeconds().toString().padStart(2, '0');

                cronometro.innerHTML = hours + ":" + minutes + ":" + seconds;
            }, 1000);
        }

         function mostrarResumen() {
            var cronometro = document.getElementById("cronometro").innerHTML;
            var table = document.getElementById("tablaTareas");
            var tbody = table.getElementsByTagName("tbody")[0];
            var filas = tbody.getElementsByTagName("tr");

            var resumenContenido = "<h3 class='text-xl font-bold mb-4'>Resumen de Tareas Realizadas</h3>";
                resumenContenido += "<p class='mb-4'>Tiempo Transcurrido: " + cronometro + "</p>";
                resumenContenido += "<table class='min-w-full bg-white border'><thead><tr><th class='py-2 px-4 border-b'>Nombre</th><th class='py-2 px-4 border-b'>Descripcion</th></tr></thead><tbody>";

            for (var i = 0; i < filas.length; i++) {
                var celdas = filas[i].getElementsByTagName("td");
                if (celdas.length > 0) {
                    resumenContenido += "<tr class='border border-gray-400'><td class='whitespace-nowrap px-6 py-4'>" + celdas[0].innerHTML + "</td><td class='whitespace-nowrap px-6 py-4'>" + celdas[1].innerHTML + "</td></tr>";
                }
            }

            resumenContenido += "</tbody></table>";
            document.getElementById("resumenModalContenido").innerHTML = resumenContenido;
            var modal = document.getElementById("resumenModal");
            modal.style.display = "block";
        }

        function cerrarModal() {
            var modal = document.getElementById("resumenModal");
            modal.style.display = "none";
        }
        
        function imprimirResumen() {
            var contenido = document.getElementById("resumenModalContenido").innerHTML;
            var ventanaImpresion = window.open('', '', 'height=600,width=800');
            ventanaImpresion.document.write('<html><head><title>Resumen de Tareas<br></title>');
            ventanaImpresion.document.write('<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">');
            ventanaImpresion.document.write('</head><body>');
            ventanaImpresion.document.write(contenido);
            ventanaImpresion.document.write('</body></html>');
            ventanaImpresion.document.close();
            ventanaImpresion.print();
        }
        
        function mostrarModalMateriales() {
            document.getElementById('modalMateriales').classList.remove('hidden');
        }

        function cerrarModalMateriales() {
            document.getElementById('modalMateriales').classList.add('hidden');
        }

        function anadirAMateriales() {
            const nombre = document.getElementById('materialNombre').selectedOptions[0].text;
            const cantidad = document.getElementById('materialCantidad').value;
            if (nombre && cantidad) {
                const tabla = document.getElementById('tablaMateriales').getElementsByTagName('tbody')[0];
                const nuevaFila = tabla.insertRow();
                nuevaFila.insertCell(0).textContent = nombre;
                nuevaFila.insertCell(1).textContent = cantidad;
                const celdaAcciones = nuevaFila.insertCell(2);
                celdaAcciones.innerHTML = '<button class="bg-red-500 text-white py-1 px-2 rounded" onclick="eliminarFila(this)">Eliminar</button>';
                document.getElementById('materialCantidad').value = '';
            }
        }

        function eliminarFila(boton) {
            const fila = boton.parentNode.parentNode;
            fila.parentNode.removeChild(fila);
        }

        function imprimirResumenSolicitud() {
            var tablaSolicitud = document.getElementById('tablaMateriales').outerHTML;
            var fechaActual = new Date().toLocaleDateString();
            var contenidoSolicitud = '<h1 class="text-xl font-bold mb-4">Resumen de la Solicitud de Materiales</h1>';
                  contenidoSolicitud += '<p>Fecha:'+fechaActual+' </p>'+tablaSolicitud;
            var ventanaImpresionSolicitud = window.open('', '', 'height=600,width=800');
            ventanaImpresionSolicitud.document.write('<html><head><title>Resumen de la Solicitud de Materiales</title>');
            ventanaImpresionSolicitud.document.write('<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">');
            ventanaImpresionSolicitud.document.write('</head><body>');
            ventanaImpresionSolicitud.document.write(contenidoSolicitud);
            ventanaImpresionSolicitud.document.write('</body></html>');
            ventanaImpresionSolicitud.document.close();
            ventanaImpresionSolicitud.print();
        }
        
        function solicitarMateriales() {
            alert('Solicitud de materiales realizada.');
            cerrarModalMateriales();
        }
    </script>
    <div class="text-white flex flex-col justify-between fixed top-0 left-0 h-screen w-3/12	p-4" style="background-color: #031936;">
        <div class="p-4">
            <div class="mb-8 text-center">
                <i class="fa-solid fa-route m-5" style="font-size: 100px;"></i>
                <h1 class="text-2xl font-bold mb-4 text-center">LA LIBERTAD</h1>
            </div>
            <nav>
                <ul>
                    <li class="mb-5">
                         <a class="flex items-center p-2 bg-green-600 rounded-md" onclick="alerta();">
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
        <h1 class="text-3xl font-bold mb-8 text-blue-900 text-center">TAREA EN CURSO</h1>
        <div class="grid grid-cols-1 gap-8 mx-10"> 
            <div class="rounded flex px-16 py-10" style="box-shadow: 0 0 15px #a5a5a5;">
                <div class="grid grid-cols-1 w-3/4">
                    <h3 class="text-center font-bold text-xl">Tiempo Transcurrido</h3>
                    <div id="cronometro" class="text-center font-bold text-6xl my-10">00:00:00</div>
                </div>
                <div class="grid grid-cols-1 w-1/4">
                    <a href="javascript:void(0);" onclick="mostrarModalMateriales();"><div class="rounded py-4 text-center text-white bg-red-900 font-bold">SOLICITAR MATERIALES</div></a>
                    <a href="javascript:void(0);" onclick="mostrarResumen();"><div class="rounded py-6 text-center text-white bg-green-800 font-bold">FINALIZAR</div></a>
                </div>
                
                <!-- Modal Finalizar -->
                <div id="resumenModal" class="modal hidden fixed inset-0 z-10 overflow-auto bg-black bg-opacity-50 pt-16">
                    <div class="modal-content bg-white rounded-lg mx-auto shadow-lg p-10 w-2/3">
                        <span class="close text-gray-600 float-right text-2xl cursor-pointer" onclick="cerrarModal()">&times;</span>
                        <div id="resumenModalContenido"></div>
                        <div class="text-right mt-4">
                            <a class="bg-blue-500 text-white py-2 px-4 rounded" href="./TareaPendiente.jsp">Confirmar</a>
                            <button class="bg-green-500 text-white py-2 px-4 rounded" onclick="imprimirResumen()">Imprimir</button>
                        </div>
                    </div>
                </div>
                
                <!-- Modal para solicitar materiales -->
                <div id="modalMateriales" class="modal hidden fixed inset-0 z-10 overflow-auto bg-black bg-opacity-50 pt-16">
                    <div class="modal-content bg-white rounded-lg mx-auto shadow-lg p-10 w-2/3">
                        <span class="close text-gray-600 float-right text-2xl cursor-pointer" onclick="cerrarModalMateriales()">&times;</span>
                        <h3 class="text-xl font-bold mb-4">Solicitud de Materiales</h3>
                        <div class="flex">
                            <div class="w-1/2 pr-4">
                                <div class="mb-4">
                                    <label for="materialNombre" class="block text-gray-700">Material:</label>
                                    <select id="materialNombre" class="w-full px-3 py-2 border border-gray-300 rounded">
                                        <% 
                                        List<Materiales> listaMateriales = new ArrayList<>();
                                        MaterialesDAO materialesDAO = new MaterialesDAO();
                                        listaMateriales = materialesDAO.obtenerMateriales();

                                        for (Materiales material : listaMateriales) {
                                        %>
                                            <option value="<%= material.getCodMaterial() %>"><%= material.getNombres() %></option>
                                        <% 
                                        } 
                                        %>
                                    </select>
                                </div>
                                <div class="mb-4">
                                    <label for="materialCantidad" class="block text-gray-700">Cantidad:</label>
                                    <input id="materialCantidad" type="number" class="w-full px-3 py-2 border border-gray-300 rounded" />
                                </div>
                                <button onclick="anadirAMateriales()" class="bg-blue-500 text-white py-2 px-4 rounded">Añadir a Lista</button>
                            </div>
                            <div class="w-1/2 pl-4">
                                <h4 class="font-bold mb-2">Lista de Materiales</h4>
                                <table id="tablaMateriales" class="w-full border border-gray-300">
                                    <thead>
                                        <tr>
                                            <th class="border border-gray-300 px-4 py-2">Nombre</th>
                                            <th class="border border-gray-300 px-4 py-2">Cantidad</th>
                                            <th class="border border-gray-300 px-4 py-2">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <div class="text-right mt-4">
                                    <button onclick="imprimirResumenSolicitud()" class="bg-green-500 text-white py-2 px-4 rounded">Imprimir</button>
                                    <button onclick="solicitarMateriales()" class="bg-blue-500 text-white py-2 px-4 rounded ml-4">Solicitar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rounded px-16 py-10" style="box-shadow: 0 0 15px #a5a5a5;">
                <h3 class="text-left font-bold text-xl">Registro de Tareas</h3>
                <div class="flex gap-7 my-10">
                    <div class="w-1/4">
                        <h3 class="font-bold">Tarea</h3>
                        <input type="text" id="tarea" class="rounded border-solid border-black border p-1 my-2">
                    </div>
                    <div class="w-2/4">
                        <h3 class="font-bold">Descripcion</h3>
                        <input type="text" id="descripcion" class="rounded border-solid border-black border p-1 my-2 w-full">
                    </div>
                    <div class="w-1/4">
                        <a href="javascript:void(0);" onclick="agregarTarea();">
                            <div class="rounded bg-blue-900 text-white text-center h-3/4 font-bold content-center mx-2">AÑADIR</div>
                        </a>
                    </div>
                </div>

                <table id="tablaTareas" class="w-full border border-gray-800">
                    <thead class="border border-gray-400">
                      <tr>
                        <th scope="col" class="px-6 py-4">Nombre</th>
                        <th scope="col" class="px-6 py-4">Descripcion</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="border border-gray-400">
                      </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

