class Person
  def initialize(name)
    @name = name
  end

  def to_s
    "Hi, my name is #{@name}"
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object."
  end
end

instructor = Instructor.new("Chris")
puts instructor

student = Student.new("Cristina")
puts student

instructor.teach
student.learn

# student.teach will error because teach does not belong to the class student

student.teach