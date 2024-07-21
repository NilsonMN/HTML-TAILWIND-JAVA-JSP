<%-- 
    Document   : ControlMaterial
    Created on : 20 jul. 2024, 3:55:44 p. m.
    Author     : livia
--%>

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
            <div class="flex items-center justify-center min-h-screen bg-gray-900">
                <div class="col-span-12">
                    <div class="overflow-auto lg:overflow-visible ">
                        <table class="table text-gray-400 border-separate space-y-6 text-sm">
                            <thead class="bg-gray-800 text-gray-500">
                                <tr>
                                    <th class="p-3">Nombre</th>
                                    <th class="p-3 text-left">Category</th>
                                    <th class="p-3 text-left">Price</th>
                                    <th class="p-3 text-left">Status</th>
                                    <th class="p-3 text-left">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-gray-800">
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <img class="rounded-full h-12 w-12  object-cover" src="https://images.unsplash.com/photo-1613588718956-c2e80305bf61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80" alt="unsplash image">
                                            <div class="ml-3">
                                                <div class="">Appple</div>
                                                <div class="text-gray-500">mail@rgmail.com</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        Technology
                                    </td>
                                    <td class="p-3 font-bold">
                                        200.00$
                                    </td>
                                    <td class="p-3">
                                        <span class="bg-green-400 text-gray-50 rounded-md px-2">available</span>
                                    </td>
                                    <td class="p-3 ">
                                        <a href="#" class="text-gray-400 hover:text-gray-100 mr-2">
                                            <i class="material-icons-outlined text-base">visibility</i>
                                        </a>
                                        <a href="#" class="text-gray-400 hover:text-gray-100  mx-2">
                                            <i class="material-icons-outlined text-base">edit</i>
                                        </a>
                                        <a href="#" class="text-gray-400 hover:text-gray-100  ml-2">
                                            <i class="material-icons-round text-base">delete_outline</i>
                                        </a>
                                    </td>
                                </tr>
                                <tr class="bg-gray-800">
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <img class="rounded-full h-12 w-12   object-cover" src="https://images.unsplash.com/photo-1423784346385-c1d4dac9893a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="unsplash image">
                                            <div class="ml-3">
                                                <div class="">Realme</div>
                                                <div class="text-gray-500">mail@rgmail.com</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        Technology
                                    </td>
                                    <td class="p-3 font-bold">
                                        200.00$
                                    </td>
                                    <td class="p-3">
                                        <span class="bg-red-400 text-gray-50 rounded-md px-2">no stock</span>
                                    </td>
                                    <td class="p-3">
                                        <a href="#" class="text-gray-400 hover:text-gray-100  mr-2">
                                            <i class="material-icons-outlined text-base">visibility</i>
                                        </a>
                                        <a href="#" class="text-gray-400 hover:text-gray-100 mx-2">
                                            <i class="material-icons-outlined text-base">edit</i>
                                        </a>
                                        <a href="#" class="text-gray-400 hover:text-gray-100 ml-2">
                                            <i class="material-icons-round text-base">delete_outline</i>
                                        </a>
                                    </td>
                                </tr>
                                <tr class="bg-gray-800">
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <img class="rounded-full h-12 w-12   object-cover" src="https://images.unsplash.com/photo-1600856209923-34372e319a5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2135&q=80" alt="unsplash image">
                                            <div class="ml-3">
                                                <div class="">Samsung</div>
                                                <div class="text-gray-500">mail@rgmail.com</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        Technology
                                    </td>
                                    <td class="p-3 font-bold">
                                        200.00$
                                    </td>
                                    <td class="p-3">
                                        <span class="bg-yellow-400 text-gray-50  rounded-md px-2">start sale</span>
                                    </td>
                                    <td class="p-3">
                                        <a href="#" class="text-gray-400 hover:text-gray-100 mr-2">
                                            <i class="material-icons-outlined text-base">visibility</i>
                                        </a>
                                        <a href="#" class="text-gray-400 hover:text-gray-100 mx-2">
                                            <i class="material-icons-outlined text-base">edit</i>
                                        </a>
                                        <a href="#" class="text-gray-400 hover:text-gray-100 ml-2">
                                            <i class="material-icons-round text-base">delete_outline</i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <style>
                .table {
                    border-spacing: 0 15px;
                }

                i {
                    font-size: 1rem !important;
                }

                .table tr {
                    border-radius: 20px;
                }

                tr td:nth-child(n+5),
                tr th:nth-child(n+5) {
                    border-radius: 0 .625rem .625rem 0;
                }

                tr td:nth-child(1),
                tr th:nth-child(1) {
                    border-radius: .625rem 0 0 .625rem;
                }
            </style>
        </div>
        <!--<!-- fin contenido -->
    </body>
</html>
