# Automatización de APIs con Karate Framework

## Descripción del proyecto

Este proyecto corresponde al desarrollo de pruebas automatizadas para la API pública **Restful Booker**, utilizando **Karate Framework**, **Gradle** y **JUnit 5**.

El objetivo fue validar el comportamiento de los principales servicios REST mediante la automatización de operaciones CRUD sobre reservas (bookings), implementando buenas prácticas como reutilización de componentes, generación dinámica de datos y validación estructural de respuestas.

Durante la solución se automatizaron los siguientes métodos HTTP:

- GET
- POST
- PUT
- DELETE

Además, se incorporaron validaciones de:

- Códigos de estado HTTP.
- Estructura de respuestas JSON mediante schemas.
- Datos específicos del negocio.
- Manejo de datos dinámicos como IDs generados y datos aleatorios.

La solución fue diseñada para que los escenarios sean independientes entre sí, permitiendo su ejecución individual o conjunta sin depender de datos previamente creados.

---

## Tecnologías utilizadas

- Java 17
- Karate Framework
- JUnit 5
- Gradle
- REST API Testing

API utilizada:

- https://restful-booker.herokuapp.com

---

## Estructura del proyecto

```text
src
└── test
    ├── java
    │   └── features
    │       └── runner
    │           └── BookingRunner.java
    │
    └── resources
        ├── common
        │   ├── Authentication.feature
        │   └── GenerateBookingData.feature
        │
        ├── data
        │   └── booking
        │       ├── booking-create-schema.json
        │       ├── booking-schema.json
        │       └── format-booking.json
        │
        ├── features
        │   └── booking
        │       ├── BookingGet.feature
        │       ├── BookingPost.feature
        │       ├── BookingPut.feature
        │       └── BookingDelete.feature
        │
        └── karate-config.js
```

### Organización

- **common:** funcionalidades reutilizables como autenticación y generación de datos dinámicos.
- **data:** payloads y schemas utilizados para las validaciones.
- **features:** escenarios de prueba de los diferentes servicios REST.
- **runner:** punto de ejecución de la suite de pruebas.
- **karate-config.js:** configuración global de URL base y encabezados comunes.

---

## Casos de prueba implementados

### GET
- Consulta de todas las reservas.
- Consulta de una reserva específica por ID.
- Validación de estructura y datos de respuesta.

### POST
- Creación de nuevas reservas.
- Validación de datos creados.
- Captura y reutilización de IDs generados.

### PUT
- Actualización de reservas existentes.
- Validación de cambios realizados.

### DELETE
- Eliminación de reservas.
- Verificación posterior para confirmar que el recurso fue eliminado.

---

## Instrucciones de ejecución

### Desde IntelliJ IDEA

1. Abrir el proyecto.
2. Esperar la sincronización de Gradle.
3. Ubicar la clase:

```text
BookingRunner.java
```

4. Ejecutar la clase seleccionando:

```text
Run 'BookingRunner'
```

---

### Desde consola

Ubicarse en la raíz del proyecto y ejecutar:

```bash
gradlew test
```

o en Linux/Mac:

```bash
./gradlew test
```

---

## Consideraciones

- La autenticación se encuentra centralizada en `Authentication.feature`.
- Los datos de prueba se generan dinámicamente desde `GenerateBookingData.feature`.
- Los esquemas JSON se almacenan de forma independiente para facilitar el mantenimiento.
- La URL base y los encabezados globales se configuran desde `karate-config.js`.
- Los escenarios están diseñados para ejecutarse de forma independiente y evitar dependencias entre pruebas.

---

## Autor

**Jhojan Andrey Guerrero Torres**

Proyecto desarrollado como solución al reto de automatización de APIs utilizando Karate Framework.