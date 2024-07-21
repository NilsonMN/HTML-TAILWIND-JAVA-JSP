<%-- 
    Document   : ReporteStock
    Created on : 20 jul. 2024, 3:37:08 p. m.
    Author     : livia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ReporteStock</title>
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
        <div class="text-white flex flex-col justify-between fixed top-0 left-0 h-screen w-3/12	p-4" style="background-color: #031936;">
            <div class="p-4">
                <div class="mb-8 text-center">
                    <i class="fa-solid fa-route m-5" style="font-size: 100px;"></i>
                    <h1 class="text-2xl font-bold mb-4 text-center">LA LIBERTAD</h1>
                </div>
                <nav>
                    <ul>
                        <li class="mb-5">
                            <a href="ProductosAl.jsp" class="flex items-center p-2 bg-green-600 rounded-md">
                                <span class="material-icons mr-2">build</span>
                                <span>Productos en Almacen</span>
                            </a>
                        </li>
                        <li class="mb-5">
                            <a href="SolicitudMats.jsp" class="flex items-center p-2">
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
                <p class="text-xs">Andres Guzman Huri</p>
            </div>
        </div>

        <div class="w-9/12 h-screen overflow-y-auto p-8" style="margin-left: 25%;">
            <h1 class="text-3xl font-bold mb-8 text-[#1E415A] text-center">REPORTE DE STOCK EN ALMACEN</h1>
            <div class="rounded px-16 py-10 bg-white shadow-2xl"> 
                <h3 class="text-left font-bold text-3xl text-[#1E415A]">Datos de Sede</h3>
                <table class="mx-auto w-3/5">
                    <tr>
                        <td class="font-bold text-xl text-[#1E415A] whitespace-nowrap px-6 py-4">Direccion</td>
                        <td class="font-bold text-xl text-[#1E415A] whitespace-nowrap px-6 py-4">Contacto</td>
                    </tr>
                    <tr>
                        <td class="whitespace-nowrap px-6 py-4 text-gray-500 text-xl text-center">XXXXXXXX-j123. 124124</td>
                        <td class="text-center whitespace-nowrap px-6 py-4 text-gray-500 text-xl">XXXXXXX</td>
                    </tr>
                </table>
            </div><br><br><br>
            <div class="rounded px-16 py-10 bg-white shadow-2xl"> 
                <h3 class="text-left font-bold text-3xl text-[#1E415A]">Detalles de Reporte</h3>
                <form> 
                    <div class=" mx-auto flex flex-wrap">
                        <div class="w-1/2 text-[#1E415A] font-bold text-lg border-2 border-gray">
                            <p class="mt-10"><label class="font-bold text-xl text-[#1E415A] whitespace-nowrap px-6 py-4">Mes
                                    <select class="border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:border-blue-500">
                                        <option>XXXXXXXXX</option>
                                        <option>XXXXXXXXX</option>
                                        <option>XXXXXXXXX</option>
                                    </select></label>
                                <br><br>
                            <p><label class="font-bold text-xl text-[#1E415A] whitespace-nowrap px-6 py-4">Año
                                    <select class="border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:border-blue-500">
                                        <option>XXXXXXXXX</option>
                                        <option>XXXXXXXXX</option>
                                        <option>XXXXXXXXX</option>
                                    </select></label></p>
                            <br>
                        </div>
                        <div class="w-1/2 grid rounded-lg text-[#1E415A]
                             font-bold text-lg border-2 border-gray">
                            <label class="font-bold text-xl text-[#1E415A] whitespace-nowrap px-6 py-4 ml-0">Productos</label>
                            <label><input type="checkbox" class="mr-5 ml-10">Salida</label>                    
                            <label><input type="checkbox" class="mr-5 ml-10">Ingreso</label>
                        </div>
                    </div>   
                    <a href="#"><div class="mt-10 w-1/3 mx-auto rounded bg-[#1E415A] hover:bg-[#031936] text-white text-center h-3/4 font-bold content-center">GENERAR REPORTE</div></a>  
                </form>
            </div>
        </div>

    </body>
</html>
