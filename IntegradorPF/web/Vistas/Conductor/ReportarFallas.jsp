<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Reportar Fallas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="bg-gray-100">

        <div class="text-white flex flex-col justify-between fixed top-0 left-0 h-screen w-3/12 p-4" style="background-color: #031936;">
            <div class="p-4">
                <div class="mb-8 text-center">
                    <i class="fa-solid fa-route m-5" style="font-size: 100px;"></i>
                    <h1 class="text-2xl font-bold mb-4 text-center">LA LIBERTAD</h1>
                </div>
                <hr class="mb-10 opacity-50">
                <nav>
                    <ul>
                        <li class="mb-5">
                            <a class="flex items-center p-2 bg-green-600 rounded-md">
                                <span class="fa-solid fa-signal mx-2"></span>
                                <span>Reportar Fallas</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="p-4 text-right mb-4">
                <hr class="opacity-50 mb-10">
                <h2 class="mb-4 text-sm font-bold">CONDUCTOR</h2>
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

        <div class="p-10" style="margin-left: 25%;">
            <h1 class="font-bold mb-8 text-blue-900 text-center my-5 text-5xl">REPORTE DE FALLAS VEHICULARES</h1>
            <div class="grid grid-cols-1 gap-8 mx-10">
                <div class="rounded px-16 py-10" style="box-shadow: 0 0 15px #a5a5a5;">
                    <form action="<%= request.getContextPath()%>/ReportarFallasServlet" method="POST">
                        <h3 class="text-left font-bold text-3xl text-blue-900">Información del Vehiculo</h3>
                        <h2 name="id" class="text-lg font-bold text-blue-900 mt-4">ID del Usuario: ${sessionScope.id}</h2>
                        <input type="hidden" name="id" value="${sessionScope.id}">
                        <input type="hidden" name="nombre" value="${sessionScope.nombre}">
                        <input type="hidden" name="apllPat" value="${sessionScope.apllPat}">

                        <div class="flex gap-7 my-10 px-5 text-2xl">
                            <div class="w-3/4 flex items-center">
                                <div class="w-full">
                                    <h3 class="font-bold text-blue-900">Placa</h3>
                                    <input type="text" name="placa" 
                                           class="rounded border-solid border-black border p-1 my-2 w-full" placeholder="xxx-xxx"
                                           value="<%= request.getAttribute("placa") != null ? request.getAttribute("placa") : ""%>">
                                </div>
                                <button type="submit" name="action" value="buscar" class="text-base ml-2 border-2 bg-blue-900 py-2 px-4 rounded border-solid text-white hover:bg-blue-800">Buscar</button>
                            </div>
                            <div class="w-3/4">
                                <h3 class="font-bold text-blue-900">Marca</h3>
                                <input type="text" name="marca" value="<%= request.getAttribute("marca") != null ? request.getAttribute("marca") : ""%>" class="rounded border-solid border-black border p-1 my-2 w-full">
                            </div>
                            <div class="w-3/4">
                                <h3 class="font-bold text-blue-900">Modelo</h3>
                                <input type="text" name="modelo" value="<%= request.getAttribute("modelo") != null ? request.getAttribute("modelo") : ""%>" class="rounded border-solid border-black border p-1 my-2 w-full">
                            </div>
                        </div>
                        <h3 class="text-left font-bold text-3xl text-blue-900">Detalles de Fallo</h3>
                        <div class="flex gap-7 my-10 px-5 text-2xl">
                            <div class="w-2/4">
                                <h3 class="font-bold text-blue-900">Tipo</h3>
                                <select name="tipoFallo" class="rounded border-solid border-black border p-1 my-2 w-full">
                                    <option value="Correctivo">Mantenimiento Correctivo</option>
                                </select>
                            </div>
                            <div class="w-3/4">
                                <h3 class="font-bold text-blue-900">Descripcion</h3>
                                <textarea name="descripcion" rows="6" cols="60" class="rounded border-solid border-black border p-1 my-2"></textarea>
                            </div>
                        </div>
                        <div class="flex justify-center mt-4">
                            <button type="submit" name="action" value="reportar" class="border-2 text-2xl bg-blue-900 py-2 px-10 rounded border-solid text-white hover:bg-blue-800">Reportar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
