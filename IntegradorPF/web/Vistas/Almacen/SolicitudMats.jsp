<%-- 
    Document   : SolicitudMats
    Created on : 20 jul. 2024, 3:37:25 p. m.
    Author     : livia
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDao.TareaDAO"%>
<%@page import="Entidad.Tarea"%>
<%@page import="ModeloDao.SoliMatsDAO"%>
<%@page import="Entidad.SoliMats"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Solicitudes de Materiales</title>
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
            #VentEmer:target{
                display:flex;
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
                            <a href="ProductosAl.jsp" class="flex items-center p-2 ">
                                <span class="material-icons mr-2">build</span>
                                <span>Productos en Almacen</span>
                            </a>
                        </li>
                        <li class="mb-5">
                            <a href="SolicitudMats.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
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
        <!--FIN NAV-->
        <!-- CONTENIDO-->
        <div class="w-9/12 h-screen overflow-y-auto p-8 text-[#1E415A]" style="margin-left: 25%;">
            <div>
                <h1 class="text-3xl font-bold mb-8 text-center">SOLICITUDES DE MATERIALES</h1>
            </div>
            <%
                List<Tarea> ta = TareaDAO.listT();
                SoliMatsDAO smdao = new SoliMatsDAO();
                for (Tarea tac : ta) {
            %>
            <!--SOLICITUD CARD-->
            <div class="flex flex-wrap gap-6 mb-6 justify-center">
                <div name="card" class="border-2 border-black h-72 mx-auto text">
                    <div class="w-96 h-60 bg-white p-4">
                        <table class="w-full text-xl text-center">
                            <tr>
                                <td colspan="2" class="py-4 font-bold text-2xl">001-0<%= tac.getCodTarea()%></td>
                            </tr>
                            <tr>
                                <td class="font-bold">Técnico</td>
                                <td class="py-5"><%= smdao.obtTec(tac.getCodTarea())%></td>
                            </tr>
                            <tr>
                                <td class="font-bold">Fecha</td>
                                <td class="py-5"><%= tac.getFechInicio()%></td>
                            </tr>
                        </table>
                    </div>
                    <div class="w-96 h-12 bg-[#1E415A] hover:bg-[#031936] text-white text-center font-bold flex items-center justify-center mx-auto">
                        <a href="#VentEmer" data-modal-toggle="default-modal" class="block focus:ring-4 focus:outline-none font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                            <h1>VER DETALLES</h1>
                        </a>
                    </div>
                </div>
            </div>
            <!--FIN SOLICITUD CARD-->
            <!--VENTANA AL PRESIONAR EL BOTÓN-->
            <div id="VentEmer" class="hidden fixed inset-0 bg-gray-800 bg-opacity-75 items-center justify-center overflow-x-auto">
                <div class="bg-white rounded-lg overflow-hidden shadow-xl w-2/3 p-6 relative">
                    <div class="mx-5 shadow-xl">
                        <h1 class="text-3xl font-bold mt-10 text-center">Detalles de Solicitud<br>/-/-/</h1>
                        <div class="flex flex-wrap mr-16">
                            <div class="w-2/5 mt-10 ml-16">
                                <h2 class="py-3"><p class="font-bold">Tecnico:</p> <%=smdao.obtTec(tac.getCodTarea())%></h2>
                                <h2 class="py-3"><p class="font-bold">Fecha:</p><%= tac.getFechInicio()%></h2>
                            </div>
                            <div class="w-2/5 py-10 ml-16">
                                <h2 class="py-3"><p class="font-bold">Almacen:</p></h2>
                                <div class="mx-auto bg-[#ECEFF4] px-10 border-2 border-black rounded-lg">
                                    <h1 class="text-center font-bold">Pedido</h1>
                                    <div class="max-w-4xl mx-auto">
                                        <div class="overflow-x-auto">
                                            <table class="table-auto min-w-full border border-gray-200">
                                                <thead>
                                                    <tr>
                                                        <th class="px-4 py-2 border-b border-gray-200 text-left">Material</th>
                                                        <th class="px-4 py-2 border-b border-gray-200 text-left">Cantidad</th>
                                                        <th class="px-4 py-2 border-b border-gray-200 text-left">Almacen</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        int idT = tac.getCodTarea();
                                                        List<SoliMats> sm = SoliMatsDAO.listSMTa(tac.getCodTarea());
                                                        for (SoliMats sms : sm) {
                                                    %>    
                                                    <tr>
                                                        <td class="px-4 py-3 border-b"> <%= smdao.obtMat(sms.getCodMaterial())%></td>
                                                        <td class="px-4 py-3 border-b"> <%= sms.getCantidad()%> Unidades</td>
                                                        <td class="px-4 py-3 border-b"> <%= smdao.obtSede(sms.getCodMaterial())%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form method="post" action="<%= request.getContextPath()%>/ControlMaterialServlet">
                            <% for (SoliMats sms : sm) {%>
                            <input type="hidden" name="codMaterial" value="<%= sms.getCodMaterial()%>">
                            <input type="hidden" name="cantidad" value="<%= sms.getCantidad()%>">
                            <% }%>
                            <input type="hidden" name="codTarea" value="<%= tac.getCodTarea()%>">
                            <button name="accion" id="aprobar" value="aprobar" class="bg-red-500 text-white px-4 py-2 rounded">Aprobar</button>
                        </form>
                    </div>
                </div>  
            </div>
            <%
                }
            %>
            <!--FINVENTANA DE CARD-->
        </div>

    </body>
</html>
