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

ruby_clues.each do |attributes|
  Clue.create do |a|
    a.value = attributes[:value]
    a.description = attributes[:description]
    a.right = attributes[:right]
    a.wrong1 = attributes[:wrong1]
    a.wrong2 = attributes[:wrong2]
    a.category_id = attributes[:category_id]
  end
end
