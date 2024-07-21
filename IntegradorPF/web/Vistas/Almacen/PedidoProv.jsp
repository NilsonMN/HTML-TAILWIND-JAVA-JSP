<%-- 
    Document   : PedidoProv
    Created on : 20 jul. 2024, 3:36:41 p. m.
    Author     : livia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pedidos Proveedores</title>
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
                            <a href="PedidoProv.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
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
        <!--contenido-->
        <div class="w-9/12 h-screen overflow-y-auto p-8" style="margin-left: 25%;">
            <h1 class="text-3xl font-bold mb-8 text-[#1E415A] text-center">REALIZAR PEDIDO A PROVEEDORES</h1>

            <div class="rounded px-16 py-10 bg-white shadow-2xl ">
                <div class="mt-10 "> 
                    <form class="flex flex-wrap font-bold text-xl text-[#1E415A] whitespace-nowrap">
                        <div class="w-1/5">
                            <label><p>Proveedor</p></label>
                            <select class="ml-5 mt-5 w-56 rounded-lg border-2 border-black">
                                <option>XXXXXXX</option>
                                <option>XXXXXXX</option>
                                <option>XXXXXXX</option>
                            </select><br><br>
                            <label><p>Material</p></label>
                            <select class="ml-5 mt-5 w-56 rounded-lg border-2 border-black">
                                <option>XXXXXXX</option>
                                <option>XXXXXXX</option>
                                <option>XXXXXXX</option>
                            </select><br><br>
                            <label><p>Cantidad</p></label>
                            <select class="ml-5 mt-5 w-56 rounded-lg border-2 border-black">
                                <option>XXXXXXX</option>
                                <option>XXXXXXX</option>
                                <option>XXXXXXX</option>
                            </select><br><br>
                            <a href="#"><div class="mt-10 mx-auto rounded bg-[#1E415A] hover:bg-[#031936]
                                             text-white text-center font-bold content-center">AÑADIR A LISTA</div></a>  

                        </div>
                        <div class="mx-auto bg-[#ECEFF4] px-10 border-2 border-black rounded-lg">
                            <h1>Resumen de Pedido</h1>
                            <table class="table-fixed font-semibold content-center">
                                <tr>
                                    <td class="px-10 py-7">Material 1</td>
                                    <td class="px-10 py-7">3 Unidades</td>
                                    <td class="px-10 py-7">Proveedor A</td>
                                </tr>
                                <tr>
                                    <td class="px-10 py-7">Material 1</td>
                                    <td class="px-10 ">3 Unidades</td>
                                    <td class="px-10">Proveedor A</td>
                                </tr>
                                <tr>
                                    <td class="px-10 py-7">Material 1</td>
                                    <td class="px-10 ">3 Unidades</td>
                                    <td class="px-10">Proveedor A</td>
                                </tr>
                                <tr>
                                    <td class="px-10 py-7">Material 1</td>
                                    <td class="px-10 ">3 Unidades</td>
                                    <td class="px-10">Proveedor A</td>
                                </tr>
                                <tr>
                                    <td class="px-10 py-7">Material 1</td>
                                    <td class="px-10">3 Unidades</td>
                                    <td class="px-10">Proveedor A</td>
                                </tr>
                                <tr>
                                    <td class="px-10 py-7">Material 1</td>
                                    <td class="px-10">3 Unidades</td>
                                    <td class="px-10">Proveedor A</td>
                                </tr>
                            </table>
                            <a href="#"><div class="mt-10 w-2/3 mx-auto rounded bg-[#1E415A] hover:bg-[#031936]
                                             text-white text-center font-bold content-center mb-10">SOLICITAR</div></a>  
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>