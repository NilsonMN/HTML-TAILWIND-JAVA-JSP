<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio Sesion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="bg-gray-100">
        <div class="mb-8 text-center pt-20">
            <i class="fa-solid fa-route m-5" style="font-size: 120px;"></i>
            <h1 class="text-2xl font-bold mb-4 text-center" style="font-size: 200%">INICIO DE SESIÓN</h1>
        </div>

        <div class="flex items-center justify-center">
            <div class="w-full md:w-1/2 lg:w-1/5">
                <form class="bg-white px-8 pt-6 pb-8 mb-4 font-medium rounded-lg shadow-lg" 
                      action="<%= request.getContextPath()%>/LoginServlet" 
                      method="post" 
                      style="font-size: 130%">
                    <div class="mb-4">
                        <label class="block text-1xl font-bold mb-2">Usuario:</label>
                        <input class="rounded-md border-2 border-black my-3 px-4 py-2 w-full" 
                               type="text"
                               id="usuario" 
                               name="usuario" required>
                    </div>
                    <div class="mb-6">
                        <label class="block text-1xl font-bold mb-2">Contraseña:</label>
                        <input class="rounded-md border-2 border-black my-3 px-4 py-2 w-full" 
                               type="password" 
                               id="password" 
                               name="password" required>
                    </div>
                    <div class="mb-4 text-sm">
                        <label class="block text-1xl font-bold mb-2" for="rol">Rol:</label>
                        <select id="rol" name="rol" 
                                class="block w-full mt-1 border border-black rounded-md">
                            <option value="conductor">Conductor</option>
                            <option value="tecnico">Técnico</option>
                            <option value="supervisor">Supervisor</option>
                            <option value="adminalmacen">Adm. Almacen</option>
                            <option value="adminvehiculos">Adm. Vehículos</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <input type="submit" 
                                class="bg-blue-900 rounded-md text-white py-2 cursor-pointer w-full hover:bg-blue-800" 
                                name="accion"
                                value="Ingresar">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
