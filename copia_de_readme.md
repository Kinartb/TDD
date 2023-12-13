## TDD

Presenta tus respuestas en un repositorio llamado `TDD`. La actividad es individual.

En clase sobre ciclo de vida ágil, discutimos dos aspectos de la garantía del software: validación  y verificación. BDD nos ayuda a comunicarnos eficazmente con el cliente para realizar la validación. Aquí, nos centraremos en la verificación, específicamente en cómo comprobar si hemos creado el sistema correctamente mediante pruebas de software.

### FIRST

Recuerda, los principios FIRST son un conjunto de pautas para redactar pruebas unitarias precisas y efectivas. FIRST significa rápido, independiente, repetible, autocontrolado y oportuno. Dado el código siguiente, determina qué principio FIRST no se sigue y por qué. Determina cómo podrías editar la prueba para resolver su insuficiencia.

El código en HomeControllerSpec.rb no sigue el principio FIRST. El problema radica en que la prueba no es independiente. Dependiendo del día de la semana en que se ejecute, la prueba podría pasar o fallar. Esto viola el principio de independencia.
​
En el archivo `HomeController.rb`:

```rb
def index
  if Time.now.tuesday?
    render 'special_index'
   else
    render 'index'
   end
end
```

En el archivo `HomeControllerSpec.rb`:

```rb
it "should render special template on Tuesdays" do
  get 'index'
  if Time.now.tuesday?
    response.should render_template('special_index')
  else
    response.should render_template('index')
   end
end
```

### AAA

El patrón más popular para la anatomía de una prueba unitaria es el método `Arrange`, `Act` y `Assert`. En este ejercicio, implementaremos cada una de estas etapas para una clase `BankAccount`.

Aquí está el código de clase `BankAccount`:

```rb
class BankAccount
  attr_reader :total
  def initialize(amount)
    @total = amount
  end
  def cash(amount)
    @total += amount
  end
end
```
Completa la siguiente prueba unitaria, siguiendo el paradigma Triple A, para probar si el método `cash` funciona. Inicializa la cuenta bancaria con un monto 100. `Cash` un monto de 1. Indica que el total esperado después de `cash` es 101.

```rb
RSpec.describe BankAccount do
   # Arrange aqui
    ..........................................
   describe '#cash' do
      it 'adds the passed amount to total' do
        # Act aqui
        ..........................................
        # Assert aqui
        ..........................................
      end
    end
end
```

### RSpec TDD 

Ya hemos visto una variante de la anatomía `AAA` en Cucumber, donde las precondiciones generalmente son pasos `Given`, las acciones tomadas generalmente son pasos `When` 
y las postcondiciones generalmente se expresan en pasos `Then`.

En el framework RSpec, cada caso de prueba se denomina ejemplo y, aunque la terminología es un poco diferente, los conceptos son los mismos. Cada ejemplo:

  * `Arrange`: establece algunas precondiciones. Al igual que Cucumber, las precondiciones se pueden colocar en un bloque `before(:each)` que se ejecuta antes de cada ejemplo.
  * `Act`: ejecutar algún código (es decir, llamar al método de clase).
  * `Assert`: Marca 1+ expectativas para verificar la corrección del comportamiento. RSpec puede expresar muchos tipos de expectativas:
    - `Equality`: el valor calculado es igual a algún valor conocido
    - `Set Inclusion`: la colección calculada incluye algún elemento.
    - `Method Invoked`: se debe llamar a un método particular
    - `Mutation`: los valores de algunas expresiones deberían haber cambiado (es decir, la longitud de la colección después del nuevo elemento).

Dada una definición de clase para `LinkedList`, con dos métodos:

1. `add`: agrega un elemento a la lista
2. `count`: devuelve el número de elementos de la lista

Escribe pruebas RSpec para ambos métodos.

```rb
  describe "LinkedList" do
     describe "adding an item" do
          it "should increase the count by 1" do
          ................................................
          ................................................
          ................................................
     end
  end
  describe "#count" do
    it "should start at zero" do
    ................................................
    ................................................
    ................................................
    end
 end
end    
```

### Seams

Supongamos que tienes una aplicación de red de mensajería social en la que cada miembro mantiene una lista de amigos (también miembros). Cuando cualquier miembro llama a `tell_my_friends(message)`, la aplicación debe coordinar la entrega de ese mensaje llamando a `hear_news(message)` a cada amigo. El método `hear_news` también propaga el mensaje a sus amigos .


```
class Member
   def tell_my_friends(message)
    # notify all my friends of the message
   end
   def hear_news(message)
      # this gets called when one of my friends posts a message
      # it makes sure the message is also forwarded to their friends
    end
   def friends
     # returns a collection of all my friends, each is a Member
   end
end
```

¿Cómo probarías que este código funciona correctamente? Comentario: tu estrategia debería ser "espiar" el método de `receive_news` para cada amigo para asegurarte de que sea invocado por todos mis amigos. Ten en cuenta que debes configurar un "espía" para ese método utilizando la expectativa de `receive()` antes de llamar al método que podría generar esas llamadas.


```
describe "sending news" do
  before(:each) do
   @person = Member.first
   @message = Message.new("Great news!")
  end
  it "sends the news to all my friends" do
    @person.friends.each do |friend|
    ..............................................
    end
    ..............................................
  end
  # ensure that all Members who are NOT my friends
  # do NOT receive the news
  it "does not send the news to people who are not my friends" do
    ...............................................
   @not_my_friends.each do |stranger|
    ...............................................
   end
  end
end
```

### Codigo

Para realizar las distintas pruebas se han seguido los pasos de RGB que consiste en llevar las pruebas de rojo (están ejecutadas con errores) a verde (decimos que todas se ejecutan satisfactoriamente). Para esto primero inicializamiso con `bundle init` y dentro del Gemfile escribimos la gema a requerir en este caso `rspec`, creamos dos carpetas una llamada `lib` y otra llamada `spec`. Dentro de lib estaran los archivos los cuales seran los códigos a probare, mientras que en la carpeta spec se ubicarán las pruebas que se realizan sobre los archivos lib. Para ejecutar las pruebas se dirige a la ubicación del Gemfile y se ejecuta `rspec`.

Para el proceso RGB es necesario primero escribir la prueba y despues ejecutarla.

![](https://github.com/Kinartb/TDD/blob/main/Imagenes/paso1.png)

En este caso vemos que todas se encuentra en rojo debido a que no se han creado todavia los archivos lib. A continuacion continuaremos solo con su creacion

![](https://github.com/Kinartb/TDD/blob/main/Imagenes/paso2.png)

Vemos que ahora el error a cambiado, esto indica que se han realizado los documento pero que no tienen nada escrito sobre ellos ya que los metodos aun no han sido definidos.

![](https://github.com/Kinartb/TDD/blob/main/Imagenes/paso3.png)

Una vez implementado los metodos y las funcionalidad ejecutamos nuevamente rspec y observamos.

![](https://github.com/Kinartb/TDD/blob/main/Imagenes/pasa5.png)

Ahora todas las pruebas pasan perfectamente (puntos en verde).

### Fixtures y Factorías

Analiza los pros y los contras del uso de factorias y fixtures en las pruebas.


Pros y Contras de `Fixtures`:

`Pros:`

Simplicidad: Las fixtures son fáciles de crear y entender. Son simples archivos de datos que se cargan en la base de datos antes de las pruebas.

Datos consistentes: Las fixtures proporcionan un conjunto consistente de datos para cada prueba, lo que garantiza resultados predecibles.
Contras:

`Contras:`

Difíciles de mantener: A medida que el modelo de datos cambia, las fixtures pueden volverse difíciles de mantener y actualizar.

Inflexibilidad: Pueden volverse inflexibles cuando necesitas datos específicos para ciertas pruebas y no quieres cargar todo el conjunto de fixtures.

Pros y Contras de `Factorías` :

`Pros:`

Flexibilidad: Las factorías permiten crear objetos con datos específicos para cada prueba, lo que las hace más flexibles que las fixtures.

Fácil mantenimiento: Son más fáciles de mantener y actualizar a medida que el modelo de datos cambia.

`Contras:`

Mayor complejidad inicial: Puede haber una curva de aprendizaje al principio al aprender cómo configurar y usar factorías.

Mayor costo de rendimiento: Las factorías pueden ser más lentas en comparación con las fixtures ya que crean objetos en tiempo real en lugar de cargar datos en la base de datos.

### Otras pruebas

En 1999, la nave de 165 millones de dólares Mars Climate Orbiter se volatilizó al entrar en la atmósfera de Marte porque uno de los equipos que trabajaba en el software
de los impulsores había utilizado unidades del sistema internacional (SI) mientras que otro equipo, que trabajaba en otra parte distinta de dicho software, había utilizado otras unidades. ¿Qué tipo de pruebas de corrección unitarias, funcionales o de integración, habrían sido necesarias para detectar este fallo?.

El incidente con la Mars Climate Orbiter fue causado por un error de integración entre dos sistemas que utilizaban unidades de medida diferentes: libras y newtons. Para prevenir este tipo de fallos, se podrían haber implementado diferentes tipos de pruebas en distintas etapas del desarrollo del software.

`Pruebas Unitarias:`

Corrección de Unidades: En las pruebas unitarias, se podrían haber incluido casos de prueba específicos para verificar que las unidades de medida utilizadas en diferentes módulos o funciones del software fueran coherentes. Por ejemplo, asegurarse de que todas las funciones relacionadas con el control de la nave espacial utilizaban las mismas unidades de medida.

`Pruebas de Integración:`

Pruebas de Interfaz: Se podrían haber llevado a cabo pruebas de integración para verificar que los diferentes módulos del software se comunicaban correctamente y que la información compartida entre ellos estaba en el formato y unidad de medida correctos. Esto habría ayudado a identificar discrepancias en las interfaces entre los sistemas.

`Pruebas Funcionales:`

Casos de Uso Específicos: En las pruebas funcionales, se podrían haber incluido casos de prueba específicos para los escenarios de vuelo y navegación. Estos casos de prueba deberían haber abordado la coordinación entre los diferentes sistemas y la correcta interpretación de las unidades de medida durante operaciones críticas.
