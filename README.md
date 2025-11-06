<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Proyecto php-simple-app</title>
</head>
<body>
    <h1>✅ Proyecto php-simple-app</h1>
    <div class="info">
        <p><strong>Estudiante:</strong> Jhon Jairo Montoya</p>
        <p><strong>Curso:</strong> Computación en la Nube</p>
        <p><strong>Fecha:</strong> <?php echo date('d/m/Y H:i:s'); ?></p>
        <p><strong>PHP Version:</strong> <?php echo phpversion(); ?></p>
    </div>
</body>
</html>