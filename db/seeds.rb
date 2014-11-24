professors = [
              {:name=>"Jose Raul Perez", :email=>"jl.loya@gmail.com", :password=>"prueba", :first_login=>true, :login_attempts=>0, :blocked_time=>Time.now}
]

classrooms = [
              {:name=>"DAW MaVi 12", :professor_id=>1},
              {:name=>"DAW LuJu 10", :professor_id=>1}
]

students = [
              {:classroom_id=>1, :name=>"Jose Luis Loya"},
              {:classroom_id=>1, :name=>"Azael Alanis"},
              {:classroom_id=>1, :name=>"Ivan Diaz"},
              {:classroom_id=>2, :name=>"Adrian Rangel"},
              {:classroom_id=>2, :name=>"Montserrat Lozano"},
              {:classroom_id=>2, :name=>"Eduardo Sifuentes"}
]

topics = [
              {:professor_id=>1, :name=>"Lenguajes Dinamicos"},
              {:professor_id=>1, :name=>"Lenguajes Estaticos"}
]

categories = [
              {:topic_id=>1, :name=>"Ruby"},
              {:topic_id=>1, :name=>"PHP"},
              {:topic_id=>1, :name=>"Python"},
              {:topic_id=>1, :name=>"JavaScript"},
              {:topic_id=>2, :name=>"C++"},
              {:topic_id=>2, :name=>"Java"},
              {:topic_id=>2, :name=>"Objective-C"},
              {:topic_id=>2, :name=>"Swift"}
]

clues = [

              # RUBY
              {:category_id=>1, :value=>200,  :description=>"Regresa true si el string esta vacio",
               :right=>"empty?", :wrong1=>"blank?", :wrong2=>"clear?"},

              {:category_id=>1, :value=>400,  :description=> "Transforma un string a un integer",
               :right=>"to_i", :wrong1=>"to_int", :wrong2=>"to_integer"},

              {:category_id=>1, :value=>600,  :description=> "Es el objeto de mas alto nivel",
               :right=>"BasicObject", :wrong1=>"Object", :wrong2=>"Kernel"},

              {:category_id=>1, :value=>800,  :description=> "Sirve para checar si un objeto tiene un metodo",
               :right=>"respond_to?", :wrong1=>"methods_exists?", :wrong2=>"method_present?"},

              {:category_id=>1, :value=>1000, :description=> "Que pasa si se define un metodo sin codigo adentro",
               :right=>"Regresa Nil", :wrong1=>"Regresa Error", :wrong2=>"No ejecuta el codigo"},

               # PHP

              {:category_id=>2, :value=>200,  :description=>"Indica el comienzo de un bloque de codigo PHP",
               :right=>"<?php", :wrong1=>"<php?>", :wrong2=>"< php ? >"},

              {:category_id=>2, :value=>400,  :description=> "Se usa para imprimir datos en una pagina",
               :right=>"echo", :wrong1=>"printf", :wrong2=>"cout"},

              {:category_id=>2, :value=>600,  :description=> "Syntaxis para terminar una linea de codigo en PHP",
               :right=>";", :wrong1=>".", :wrong2=>"/"},

              {:category_id=>2, :value=>800,  :description=> "Funcion que cuenta los elementos de un arreglo",
               :right=>"count()", :wrong1=>"enum()", :wrong2=>"lenght()"},

              {:category_id=>2, :value=>1000, :description=> "Fue el nombre original de PHP",
               :right=>"Personal Home Page Tools", :wrong1=>"Perl-like Hypertext Preprocessor", :wrong2=>"Personal High Level Programming"},

               # PYTHON

              {:category_id=>3, :value=>200,  :description=>"Syntaxis una linea de codigo en Python",
               :right=>"#", :wrong1=>"//", :wrong2=>"*"},

              {:category_id=>3, :value=>400,  :description=> "Alterna la condicion del if",
               :right=>"elif", :wrong1=>"else if", :wrong2=>"elseif"},

              {:category_id=>3, :value=>600,  :description=> "Como se le conoce a la implementacion Java de Python",
               :right=>"Jython", :wrong1=>"PyJava", :wrong2=>"Javathon"},

              {:category_id=>3, :value=>800, :description=> "Define una funcion en Python",
               :right=>"def fun():", :wrong1=>"def fun()", :wrong2=>"function fun ()"},

              {:category_id=>3, :value=>1000,  :description=> "El fue quien creo Python",
               :right=>"Guido van Rossum", :wrong1=>"Bill Joy", :wrong2=>"Larry Wall"},

               # JAVASCRIPT

              {:category_id=>4, :value=>200,  :description=>"Dentro de este elemento HTML va el codigo JavaScript",
               :right=>"<script>", :wrong1=>"<js>", :wrong2=>"<javascript>"},

              {:category_id=>4, :value=>400,  :description=> "Es el lugar correcto para insertar JavaScript",
               :right=>"En <head> y/o <body>", :wrong1=>"En <body>", :wrong2=>"En <head>"},

              {:category_id=>4, :value=>600, :description=> "Escribe Hello World en una alerta",
               :right=>"alert(\"Hello World\");", :wrong1=>"msgBox(\"Hello World\");", :wrong2=>"alertBox(\"Hello World\");"},

              {:category_id=>4, :value=>800,  :description=> "Redondea el numero 7.25 al entero mas cercano",
               :right=>"Math.round(7.25)", :wrong1=>"round(7.25)", :wrong2=>"rnd(7.25)"},

              {:category_id=>4, :value=>1000,  :description=> "Detecta el nombre del browser del cliente",
               :right=>"navigator.appName", :wrong1=>"browser.name", :wrong2=>"client.navName"},

               # CPP

              {:category_id=>5, :value=>200,  :description=> "Asi se representa un string",
                :right=>"\"mesa\" ", :wrong1=>"'G'", :wrong2=>"28889"},

              {:category_id=>5, :value=>400,  :description=> "Funcion que se llama automaticamente al inicio de un programa en C++",
               :right=>"main()", :wrong1=>"getline()", :wrong2=>"init()"},

              {:category_id=>5, :value=>600,  :description=>"Que tipo de dato es el double",
               :right=>"Floating point", :wrong1=>"Integer", :wrong2=>"Boolean"},

              {:category_id=>5, :value=>800,  :description=> "Consiste en pasar la direccion de memoria como parametro",
               :right=>"Parametro por referencia", :wrong1=>"Parametro por valor", :wrong2=>"Parametro por argumento"},

              {:category_id=>5, :value=>1000, :description=> "Es una declaracion de funcion sin cuerpo",
               :right=>"Funcion prototipo", :wrong1=>"Llamada a funcion", :wrong2=>"Definicion de funcion"},

               # JAVA

              {:category_id=>6, :value=>200,  :description=>"Fue el nombre original de Java",
               :right=>"Oak", :wrong1=>"Ada", :wrong2=>"Lisp"},

              {:category_id=>6, :value=>400,  :description=> "Codigo Java embebido en una applicacion web",
               :right=>"Applet", :wrong1=>"Javabean", :wrong2=>"JSP"},

              {:category_id=>6, :value=>600,  :description=> "Nombre de la clase de la que todas las clases de Java heredan",
               :right=>"Object", :wrong1=>"Classloader", :wrong2=>"Class"},

              {:category_id=>6, :value=>800,  :description=> "Es el significado de AWT",
               :right=>"Abstract Window Toolkit", :wrong1=>"Abstract Widget Transfer", :wrong2=>"Abstract Widget Transfer"},

              {:category_id=>6, :value=>1000, :description=> "Es el inventor de JAVA",
               :right=>"James Gosling", :wrong1=>"Dennis Ritchie", :wrong2=>"Bjarne Stroustroup"},

               # OBJECTIVE-C

              {:category_id=>7, :value=>200,  :description=>"Es la extension de un archivo Objective-C",
               :right=>".m", :wrong1=>".oc", :wrong2=>".c"},

              {:category_id=>7, :value=>400,  :description=> "Asi se le llama al tipo de dato String en Objective-C",
               :right=>"NSString", :wrong1=>"String", :wrong2=>"var"},

              {:category_id=>7, :value=>600,  :description=> "Es el año en que se creo Objective-c",
               :right=>"1980", :wrong1=>"1990", :wrong2=>"2000"},

              {:category_id=>7, :value=>800,  :description=> "Es el creador de Objective-c",
               :right=>"Brad Cox", :wrong1=>"Jack Perry", :wrong2=>"Stephen Geller"},

              {:category_id=>7, :value=>1000, :description=> "Es la tecnica de manejo de memoria automatico que emplea Objective-C",
               :right=>"ARC", :wrong1=>"REC", :wrong2=>"CRA"},

               # SWIFT

              {:category_id=>8, :value=>200,  :description=>"Sus aplicaciones se programan en Swift",
               :right=>"IOS", :wrong1=>"Android", :wrong2=>"Windows Phone"},

              {:category_id=>8, :value=>400,  :description=> "Es quien invento Swift",
               :right=>"Chris Lattner", :wrong1=>"James Hawk", :wrong2=>"Thomas Franco"},

              {:category_id=>8, :value=>600,  :description=> "Es el año en el que aparecio Swift",
               :right=>"2014", :wrong1=>"2013", :wrong2=>"2012"},

              {:category_id=>8, :value=>800,  :description=> "Es utilizado por Swift para manejar memoria de manera automatica",
               :right=>"ARC", :wrong1=>"MRR", :wrong2=>"RMA"},

              {:category_id=>8, :value=>1000, :description=> "Es el IDE utilizado para programar en Swift",
               :right=>"XCode", :wrong1=>"Code Blocks", :wrong2=>"NetBeans"}

]

professors.each do |attributes|
  Professor.create do |a|
    a.name = attributes[:name]
    a.email = attributes[:email]
    a.password = attributes[:password]
    a.first_login = attributes[:first_login]
    a.login_attempts = attributes[:login_attempts]
    a.blocked_time = attributes[:blocked_time]
  end
end

classrooms.each do |attributes|
  Classroom.create do |a|
    a.name = attributes[:name]
    a.professor_id = attributes[:professor_id]
  end
end

students.each do |attributes|
  Student.create do |a|
    a.name = attributes[:name]
    a.classroom_id = attributes[:classroom_id]
  end
end

topics.each do |attributes|
  Topic.create do |a|
    a.name = attributes[:name]
    a.professor_id = attributes[:professor_id]
  end
end

categories.each do |attributes|
  Category.create do |a|
    a.name = attributes[:name]
    a.topic_id = attributes[:topic_id]
  end
end

clues.each do |attributes|
  Clue.create do |a|
    a.value = attributes[:value]
    a.description = attributes[:description]
    a.right = attributes[:right]
    a.wrong1 = attributes[:wrong1]
    a.wrong2 = attributes[:wrong2]
    a.category_id = attributes[:category_id]
  end
end
