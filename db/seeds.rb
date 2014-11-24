professors = [
              {:name=>"Jose Raul Perez", :email=>"jl.loya@gmail.com", :password=>"prueba", :first_login=>true, :login_attempts=>0, :blocked_time=>Time.now}
]

classrooms = [
              {:name=>"DAW MaVi 12", :professor_id=>1},
              {:name=>"DAW LuJu 10", :professor_id=>1}
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

ruby_clues = [
              {:category_id=>1, :value=>200,  :description=>"Regresa true si el string esta vacio",
               :right=>"empty?", :wrong1=>"blank?", :wrong2=>"clear?"},

              {:category_id=>1, :value=>400,  :description=> "Transforma un string a un integer",
               :right=>"to_i", :wrong1=>"to_int", :wrong2=>"to_integer"},

              {:category_id=>1, :value=>600,  :description=> "Es el objeto de mas alto nivel",
               :right=>"BasicObject", :wrong1=>"Object", :wrong2=>"Kernel"},

              {:category_id=>1, :value=>800,  :description=> "Sirve para checar si un objeto tiene un metodo",
               :right=>"respond_to?", :wrong1=>"methods_exists?", :wrong2=>"method_present?"},

              {:category_id=>1, :value=>1000, :description=> "Que pasa si se define un metodo sin codigo adentro",
               :right=>"Regresa Nil", :wrong1=>"Regresa Error", :wrong2=>"No ejecuta el codigo"}
]

php_clues = [
              {:category_id=>2, :value=>200,  :description=>"Regresa true si el string esta vacio",
               :right=>"empty?", :wrong1=>"blank?", :wrong2=>"clear?"},

              {:category_id=>2, :value=>400,  :description=> "Transforma un string a un integer",
               :right=>"to_i", :wrong1=>"to_int", :wrong2=>"to_integer"},

              {:category_id=>2, :value=>600,  :description=> "Es el objeto de mas alto nivel",
               :right=>"BasicObject", :wrong1=>"Object", :wrong2=>"Kernel"},

              {:category_id=>2, :value=>800,  :description=> "Sirve para checar si un objeto tiene un metodo",
               :right=>"respond_to?", :wrong1=>"methods_exists?", :wrong2=>"method_present?"},

              {:category_id=>2, :value=>1000, :description=> "Que pasa si se define un metodo sin codigo adentro",
               :right=>"Regresa Nil", :wrong1=>"Regresa Error", :wrong2=>"No ejecuta el codigo"}
]
