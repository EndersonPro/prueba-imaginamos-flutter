## Prueba Flutter Imaginamos

##### Para poder modificar este proyecto usando el ambiente de trabajo configurado con docker es necesario tener VSCode y tener instalado 2 extenciones y evidentemente docker en tu maquina.
- ##### Requisitos
    - Docker
    - VSCode
    - [Docker Ext VSCode](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
    - [Remote Dev](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
- ##### Pasos para modificar
    - Clonar el proyecto con `git clone https://github.com/EndersonPro/prueba-imaginamos-flutter PruebaEnderson`
    - Activar Remote Dev con `ctrl + shit + p` y escribir Remote-Container
    - Seleccionar la carpeta del proyecto
    - Esperar que se instalen todas las dependencias... 

NOTAS: 
- En el Dockerfile he comentado la ultima linea, `flutter doctor` opcionalmente puedes descomentarla o esperar a que el workspace este completo y ejecutarla tu mismo.

Ahora solo conectar dispositivo y listo. :D

> Enderson Vizcaino made with :heart:
