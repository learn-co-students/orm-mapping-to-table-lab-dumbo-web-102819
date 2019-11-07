class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  attr_accessor :name, :grade, :id

  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id
  end

  #The following creates a class method that maps 
  #instance attributes to table columns
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS student (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      )
      SQL
    DB[:conn].execute(sql)
end

#A method to create a new song instance and save it
def self.create(name, grade)
  student = student.new(name, grade)
  student.save
  student
end

def save 
  sql = <<-SQL
    INSERT INTO students (name, grade)
    VALUES (?, ?)
  SQL

  DB[:conn].execute(sql, self.name, self.grade)
   
end
end