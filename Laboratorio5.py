import pyodbc
from datetime import date

# Función para conectarse a SQL Server
def connect_to_sql_server():
    server = 'localhost'  # 
    database = 'IF4000_BIBLIOTECA_LAB5'  
    username = 'UsuarioPython'  # Nombre de usuario
    password = '1234asdf'  # Contraseña

    # Cadena de conexión a SQL Server
    conn_str = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};Encrypt=no'

    try:
        # Establecer la conexión
        connection = pyodbc.connect(conn_str)
        print("Connection established successfully")
        return connection
    except pyodbc.Error as e:
        print(f"Connection failed: {e}")
        return None

# Función para llamar al procedimiento almacenado RegistrarPrestamo
def registrar_prestamo(codigo_usuario, codigo_ejemplar, fecha_devolucion=None):
    
    conn = connect_to_sql_server()
    if conn:
        cursor = conn.cursor()
        try:
            # Ejecutar el procedimiento almacenado
            cursor.execute("{CALL RegistrarPrestamo (?, ?, ?)}", (codigo_usuario, codigo_ejemplar, fecha_devolucion))
            conn.commit()  # Confirmar los cambios
            print("Prestamo registrado con éxito")
        except pyodbc.Error as e:
            print(f"Error al registrar el préstamo: {e}")
        finally:
            cursor.close()  # Cerrar el cursor
            conn.close()  # Cerrar la conexión

# Función para llamar al procedimiento almacenado BuscarLibro
def buscar_libro(id_libro=None, titulo=None, isbn=None, paginas=None, editorial=None):
   
    conn = connect_to_sql_server()
    if conn:
        cursor = conn.cursor()
        try:
            # Ejecutar el procedimiento almacenado con los parámetros proporcionados
            cursor.execute("{CALL BuscarLibro (?, ?, ?, ?, ?)}", 
                           (id_libro, titulo, isbn, paginas, editorial))
            
            # Obtener los resultados de la consulta
            resultados = cursor.fetchall()
            
            if resultados:
                print(f"Se encontraron {len(resultados)} libros:")
                for row in resultados:
                    print(f"ID: {row.CODIGO_LIBRO}, Título: {row.TITULO}, ISBN: {row.ISBN}, Páginas: {row.PAGINAS}, Editorial: {row.EDITORIAL}")
            else:
                print("No se encontraron resultados para la búsqueda.")
                
        except pyodbc.Error as e:
            print(f"Error al ejecutar la búsqueda: {e}")
        finally:
            cursor.close()  # Cerrar el cursor
            conn.close()  # Cerrar la conexión

# Función para llamar al procedimiento almacenado ActualizarAutor
def actualizar_autor(codigo, nombre_autor):
   
    conn = connect_to_sql_server()
    if conn:
        cursor = conn.cursor()
        try:
            # Ejecutar el procedimiento almacenado con los parámetros proporcionados
            cursor.execute("{CALL ActualizarAutor (?, ?)}", (codigo, nombre_autor))
            conn.commit()  # Confirmar los cambios
            print("El autor ha sido actualizado exitosamente.")
        except pyodbc.Error as e:
            print(f"Error al actualizar el autor: {e}")
        finally:
            cursor.close()  # Cerrar el cursor
            conn.close()  # Cerrar la conexión
            
            
# Función para llamar al procedimiento almacenado EliminarEstudiante   
def eliminar_estudiante(conn, codigo_estudiante):
    cursor = conn.cursor()

    try:
        # Llamar al procedimiento almacenado "EliminarEstudiante" pasando el código del estudiante como parámetro
        cursor.execute("{CALL EliminarEstudiante (?)}", (codigo_estudiante,))
        
        # Si no hay errores, hacer commit para aplicar los cambios
        conn.commit()
        print(f"Estudiante con código {codigo_estudiante} ha sido eliminado correctamente.")
    except pyodbc.Error as e:
        print(f"Error al ejecutar el procedimiento: {e}")
    finally:
        cursor.close()

# Función para solicitar datos de búsqueda al usuario
def solicitar_datos_busqueda():
    try:
        # Solicitar los parámetros de búsqueda al usuario
        id_libro = input("Ingrese el ID del libro (deje en blanco para no buscar por ID): ")
        titulo = input("Ingrese el título del libro (deje en blanco para no buscar por título): ")
        isbn = input("Ingrese el ISBN del libro (deje en blanco para no buscar por ISBN): ")
        paginas = input("Ingrese el número de páginas del libro (deje en blanco para no buscar por número de páginas): ")
        editorial = input("Ingrese la editorial del libro (deje en blanco para no buscar por editorial): ")

        # Convertir los valores vacíos a None para no aplicar el filtro en esos casos
        id_libro = int(id_libro) if id_libro else None
        titulo = titulo if titulo else None
        isbn = isbn if isbn else None
        paginas = int(paginas) if paginas else None
        editorial = editorial if editorial else None

        # Llamar a la función que realiza la búsqueda
        buscar_libro(id_libro, titulo, isbn, paginas, editorial)
        
    except ValueError as ve:
        print(f"Error de entrada: {ve}")
    except Exception as e:
        print(f"Ocurrió un error: {e}")

# Solicitar los datos al usuario como parámetros para registrar un préstamo
def solicitar_datos_y_registrar():
    
    try:
        # Solicitar los datos del usuario
        codigo_usuario = int(input("Ingrese el código del usuario: "))
        codigo_ejemplar = int(input("Ingrese el código del ejemplar: "))
        
        # Preguntar si quiere ingresar una fecha de devolución
        fecha_dev_input = input("Ingrese la fecha de devolución (YYYY-MM-DD) o presione Enter para dejarla como NULL: ")
        
        # Si se ingresa una fecha, convertirla en objeto de tipo date
        if fecha_dev_input:
            fecha_devolucion = date.fromisoformat(fecha_dev_input)
        else:
            fecha_devolucion = None
        
        # Llamar a la función que registra el préstamo, pasando los datos como parámetros
        registrar_prestamo(codigo_usuario, codigo_ejemplar, fecha_devolucion)
    except ValueError as ve:
        print(f"Error de entrada: {ve}")
    except Exception as e:
        print(f"Ocurrió un error: {e}")

# Función para solicitar datos al usuario para actualizar un autor
def solicitar_datos_y_actualizar_autor():
    
    try:
        # Solicitar los datos del autor
        codigo = int(input("Ingrese el código del autor a actualizar: "))
        nombre_autor = input("Ingrese el nuevo nombre del autor: ")

        # Llamar a la función que actualiza el autor
        actualizar_autor(codigo, nombre_autor)
    except ValueError as ve:
        print(f"Error de entrada: {ve}")
    except Exception as e:
        print(f"Ocurrió un error: {e}")
        
        
# Función para solicitar datos al usuario para Eliminar un estudiante
def solicitar_datos_y_eliminar():
    try:
        # Solicitar el código del estudiante
        codigo_estudiante = int(input("Ingrese el código del estudiante a eliminar: "))
        
        # Conectar a la base de datos
        conn = connect_to_sql_server()

        # Si la conexión es exitosa, llamar al procedimiento almacenado
        if conn:
            eliminar_estudiante(conn, codigo_estudiante)  # Llamar al procedimiento almacenado
            conn.close()  # Cerrar la conexión
    except ValueError as ve:
        print(f"Error de entrada: {ve}. Asegúrese de ingresar un número entero válido.")
    except Exception as e:
        print(f"Ocurrió un error: {e}")


# Test de las funciones

def main():
    while True:  # Bucle infinito que continuará hasta que el usuario decida salir
        # Mostrar el menú
        print("************************************************")
        print("***********BIBLIOTECA UCR SEDE CARIBE***********")
        print("************************************************")
        print("Bienvenido al sistema:")
        print("Seleccione una opción:")
        print("1. Registrar préstamo")
        print("2. Buscar libro")
        print("3. Actualizar autor")
        print("4. Eliminar Estudiante")
        print("5. Salir")  # Opción para salir del programa

        # Pedir la opción al usuario
        opcion = input("Ingrese el número de opción: ")

        # Ejecutar la opción seleccionada
        if opcion == '1':
            solicitar_datos_y_registrar()  # Llamar a la función para registrar préstamo
        elif opcion == '2':
            solicitar_datos_busqueda()  # Llamar a la función para buscar libro
        elif opcion == '3':
            solicitar_datos_y_actualizar_autor()  # Llamar a la función para actualizar autor
        elif opcion == '4':
            solicitar_datos_y_eliminar()  # Llamar a la función para eliminar estudiante
        elif opcion == '5':
            print("Saliendo del programa...")  # Mensaje de salida
            break  # Salir del bucle y terminar el programa
        else:
            print("Opción no válida. Intente nuevamente.")  # Si la opción no es válida

if __name__ == "__main__":
    main()




