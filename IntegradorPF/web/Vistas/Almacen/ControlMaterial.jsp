<%-- 
    Document   : ControlMaterial
    Created on : 20 jul. 2024, 3:55:44 p. m.
    Author     : livia
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ControlMaterial</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
            rel="stylesheet">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <style>
            .irbtn .fa-arrow-right,p{
                transition: all .3s ;
            }
            .irbtn:hover{
                .fa-arrow-right{
                    transform: translate(10px) ;
                }
                p{
                    transform: scale(1.1);
                }
            }
        </style>
    </head>
    <body>
        <!--NAV-->
        <div class="text-white flex flex-col justify-between fixed top-0 left-0 h-screen w-3/12	p-4" style="background-color: #031936;">
            <div class="p-4">
                <div class="mb-8 text-center">
                    <i class="fa-solid fa-route m-5" style="font-size: 100px;"></i>
                    <h1 class="text-2xl font-bold mb-4 text-center">LA LIBERTAD</h1>
                </div>
                <nav>
                    <ul>
                        <li class="mb-5">
                            <a href="ProductosAl.jsp" class="flex items-center p-2 ">
                                <span class="material-icons mr-2">build</span>
                                <span>Productos en Almacen</span>
                            </a>
                        </li>
                        <li class="mb-5">
                            <a href="SolicitudMats.jsp" class="flex items-center p-2 ">
                                <span class="material-icons mr-2">build</span>
                                <span>Solicitudes Taller</span>
                            </a>
                        </li>
                        <li class="mb-5">
                            <a href="SolicitudMats.jsp" class="flex items-center p-2 ">
                                <span class="material-icons mr-2">build</span>
                                <span>Solicitudes Taller</span>
                            </a>
                        </li>
                        <li class="mb-5">
                            <a href="ControlMaterial.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
                                <span class="material-icons mr-2">build</span>
                                <span>Control Materiales</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="p-4 text-right mb-4">
                <h2 class="mb-4 text-sm font-bold">TECNICO</h2>
                <p name="nombre" class="text-sm">${sessionScope.nombre}</p>
                <p name="apllPat" class="text-sm">${sessionScope.apllPat}</p>
                <form action="<%= request.getContextPath()%>/LoginServlet" method="POST">
                    <div class="flex justify-start">
                        <input type="submit"
                               class="bg-red-600 rounded-md text-white py-2 px-4 cursor-pointer hover:bg-red-900" 
                               name="accion"
                               value="Salir">
                    </div>
                </form>
            </div>
        </div>
        <!--contenido-->
        <div class="w-9/12 h-screen overflow-y-auto p-8" style="margin-left: 25%;">
            <!--agregarMaterial-->
            <div class="w-96 h-12 bg-[#1E415A] hover:bg-[#031936] text-white text-center font-bold content-center mx-auto">
                <a href="#VentEmer" data-modal-toggle="default-modal" class="block focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center"><h1>Agregar Material</h1></a>
            </div>
            <!-- MODAL NUEVO MATERIAL -->
            <div id="VentEmer" class="hidden fixed inset-0 bg-gray-800 bg-opacity-75 items-center justify-center overflow-x-auto">
                <div class="bg-white border border-4 rounded-lg shadow relative m-10">

                    <div class="flex items-start justify-between p-5 border-b rounded-t">
                        <h3 class="text-xl font-semibold">
                            Edit product
                        </h3>
                        <a href="#" class="bg-red-500 text-white px-4 py-2 rounded absolute top-5 right-4">Cerrar</a>
                    </div>
                    <!-- CUERPOMODAL -->
                    <form action="<%= request.getContextPath()%>/ControlMaterialServlet">
                        <div class="p-6 space-y-6">

                            <div class="grid grid-cols-6 gap-6">
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="nombre" class="text-sm font-medium text-gray-900 block mb-2">Nombre del Material</label>
                                    <input type="text" name="nombre" id="nombre" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5" required="">
                                </div>
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="stock" class="text-sm font-medium text-gray-900 block mb-2">Cantidad</label>
                                    <input type="number" name="stock" id="stock" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-cyan-600 focus:border-cyan-600 block w-full p-2.5" required="">
                                </div>
                                <div class="col-span-6 sm:col-span-3">
                                    <label for="almacen" class="text-sm font-medium text-gray-900 block mb-2">Almacen</label>
                                    <select id="almacen" name="almacen" class="w-full px-3 py-2 border border-gray-300 rounded">
                                        <%
                                            List<Almacen> lal = AlmacenDAO.listarAl();
                                            AlmacenDAO aldao = new AlmacenDAO();
                                            for (Almacen alma : lal) {
                                        %>
                                        <option value="<%= alma.getId()%>"><%=aldao.obtDep(alma.getDep())%> <%= alma.getDireccion()%></option>
                                        <%
                                            }
                                        %>
                                    </select>                               
                                </div>
                            </div>

                        </div>

                        <div class="p-6 border-t border-gray-200 rounded-b">
                            <button name="accion" id="Agregar" value="Agregar" class="text-white bg-cyan-600 hover:bg-cyan-700 focus:ring-4 focus:ring-cyan-200 font-medium rounded-lg text-sm px-5 py-2.5 text-center" type="submit">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- FIN AGREGAR MATERIAL -->
            <!-- CODIGO DE ITERACION DE ALMACEN -->
            <% List<Almacen> al = AlmacenDAO.listarAl();
                String nom = "";
                AlmacenDAO adao = new AlmacenDAO();
                for (Almacen alm : al) {%>
            <!--FIN CODIGO DE ITERACION-->
            <!-- componente -->
            <div class="p-6 overflow-scroll px-0">


                <table class="mt-4 w-full min-w-max table-auto text-left">
                    <thead>
                        <tr>
                            <th>
                                Sede: 
                                <%=adao.obtDep(alm.getDep())%> <%= alm.getDireccion()%>
                            </th>
                        </tr>
                        <tr>
                            <th class="cursor-pointer border-y border-blue-gray-100 bg-blue-gray-50/50 p-4 transition-colors hover:bg-blue-gray-50">
                                <p class="antialiased font-sans text-sm text-blue-gray-900 flex items-center justify-between gap-2 font-normal leading-none opacity-70">ID
                                </p>
                            </th>
                            <th class="cursor-pointer border-y border-blue-gray-100 bg-blue-gray-50/50 p-4 transition-colors hover:bg-blue-gray-50">
                                <p class="antialiased font-sans text-sm text-blue-gray-900 flex items-center justify-between gap-2 font-normal leading-none opacity-70">Nombre
                                </p>
                            </th>
                            <th class="cursor-pointer border-y border-blue-gray-100 bg-blue-gray-50/50 p-4 transition-colors hover:bg-blue-gray-50">
                                <p class="antialiased font-sans text-sm text-blue-gray-900 flex items-center justify-between gap-2 font-normal leading-none opacity-70">Stock
                                </p>
                            </th>
                            <th class="cursor-pointer border-y border-blue-gray-100 bg-blue-gray-50/50 p-4 transition-colors hover:bg-blue-gray-50">
                                <p class="antialiased font-sans text-sm text-blue-gray-900 flex items-center justify-between gap-2 font-normal leading-none opacity-70">Accion
                                </p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Materiales> mats = MaterialesDAO.listarMatAl(alm.getId());
                            for (Materiales m : mats) {
                        %>
                        <tr>
                            <!-- ID -->
                            <td class="p-4 border-b border-blue-gray-50">
                                <div class="flex items-center gap-3">
                                    <div class="flex flex-col">
                                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-normal"><%=m.getCodMaterial()%></p>
                                    </div>
                                </div>
                            </td>
                            <!-- NOMBRE -->
                            <td class="p-4 border-b border-blue-gray-50">
                                <div class="flex items-center gap-3">
                                    <div class="flex flex-col">
                                        <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-normal"><%=m.getNombres()%></p>
                                    </div>
                                </div>
                            </td>
                            <!-- STOCK -->
                            <td class="p-4 border-b border-blue-gray-50">
                                <div class="flex flex-col">
                                    <p class="block antialiased font-sans text-sm leading-normal text-blue-gray-900 font-normal"><%=m.getStock()%></p>
                                </div>
                            </td>

                            <!-- EDIT -->
                            <td class="p-4 border-b border-blue-gray-50">
                                <button class="relative align-middle select-none font-sans font-medium text-center uppercase transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none w-10 max-w-[40px] h-10 max-h-[40px] rounded-lg text-xs text-gray-900 hover:bg-gray-900/10 active:bg-gray-900/20" type="button">
                                    <span class="absolute top-1/2 left-1/2 transform -translate-y-1/2 -translate-x-1/2">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="h-4 w-4">
                                        <path d="M21.731 2.269a2.625 2.625 0 00-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 000-3.712zM19.513 8.199l-3.712-3.712-12.15 12.15a5.25 5.25 0 00-1.32 2.214l-.8 2.685a.75.75 0 00.933.933l2.685-.8a5.25 5.25 0 002.214-1.32L19.513 8.2z"></path>
                                        </svg>
                                    </span>
                                </button>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <%}%>
            <!-- fin componente -->
        </div>
        <!--<!-- fin contenido -->
    </body>
</html>