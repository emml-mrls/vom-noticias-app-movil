//Para las notificaciones, el problema suele estar en la configuración nativa o en el ciclo de vida. Al aplicar MVVM, puedes crear un NotificationService independiente:
//    Aislar el servicio: No pongas la lógica de Firebase en el initState de tu home.
//   Inicialización: Crea un servicio que se inicialice al arrancar la app.
//    Permisos: Asegúrate de solicitar los permisos de usuario explícitamente en el ViewModel de inicio.