<%-- 
    Document   : ProductosAl
    Created on : 20 jul. 2024, 3:36:52 p. m.
    Author     : livia
--%>

<%@page import="ModeloDao.MaterialesDAO"%>
<%@page import="Entidad.Materiales"%>
<%@page import="ModeloDao.AlmacenDAO"%>
<%@page import="Entidad.Almacen"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ProductosAlmacen</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    <body class="bg-[#ECEFF4]">
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
                            <a href="ProductosAlmacen.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
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
                            <a href="PedidoProv.jsp" class="flex items-center p-2">
                                <span class="material-icons mr-2">build</span>
                                <span>Pedido Proveedores</span>
                            </a>
                        </li>
                        <li class="mb-5">
                            <a href="ControlMaterial.jsp" class="flex items-center p-2 ">
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
        <!--CONTENIDO-->
        <div class="w-9/12 h-screen overflow-y-auto p-8" style="margin-left: 25%;">
            <h1 class="text-3xl font-bold mb-8 text-[#1E415A] text-center">PRODUCTOS EN ALMACEN</h1>
            <div class="grid grid-cols-1 gap-8 mx-10"> 
                <% List<Almacen> al = AlmacenDAO.listarAl();
                    String nom = "";
                    AlmacenDAO adao = new AlmacenDAO();
                    for (Almacen alm : al) {

                %>
                <div class="rounded px-16 py-10 bg-white shadow-2xl">
                    <h3 class="text-left font-bold text-3xl">Sede: <%=adao.obtDep(alm.getDep())%> <%= alm.getDireccion()%></h3>

                    <table class="w-full border border-gray-800 mt-10">
                        <thead class="border border-gray-400">
                            <tr>
                                <th scope="col" class="px-6 py-4">Nombre</th>
                                <th scope="col" class="px-6 py-4">Descripcion</th>
                                <th scope="col" class="px-6 py-4 text-center">Cantidad</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                List<Materiales> mats = MaterialesDAO.listarMatAl(alm.getId());
                                for (Materiales m : mats) {
                            %>
                            <tr class="border border-gray-400">
                                <td class="whitespace-nowrap px-6 py-4"><%=m.getNombres()%></td>
                                <td class="whitespace-nowrap px-6 py-4">Salida/Entrada/Devolucion</td>
                                <td class="whitespace-nowrap px-6 py-4 text-center"><%=m.getStock()%></td>
                            </tr>

                            <%
                                }
                            %>
                        </tbody>

                    </table>
                    <div class="w-1/3 h-10 mx-auto mt-8">
                        <a href="<%= request.getContextPath()%>/GenerarReporteServlet?almacenId=<%= alm.getId()%>">
                            <div class="rounded bg-[#1E415A] hover:bg-[#031936] text-white text-center h-3/4 font-bold content-center mx-auto">GENERAR REPORTE</div>
                        </a></div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
