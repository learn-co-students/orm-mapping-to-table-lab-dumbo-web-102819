class Student
 attr_accessor :name,:grade
 attr_reader :id
 
    def initialize (name,grade,id=nil)
        @name =name 
        @grade = grade 
        @id = id 
    end 


    def self.create_table 
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS students (
            id INTEGER PRIMARY KEY,
            name TEXT, 
            grade INTEGER
        ) 
        SQL
        DB[:conn].execute(sql)
    end 

    def self.drop_table 
        sql1 = <<-SQL1
        DROP TABLE students
        SQL1

        DB[:conn].execute(sql1)
    end 


    def save 
        sql2 = <<-SQL2 
        INSERT INTO students (name, grade)
        VALUES(?, ?)
        SQL2
        DB[:conn].execute(sql2, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end


    def self.create(hash)
    
        student = Student.new(hash[:name],hash[:grade])
        student.save
        student 
    end 
end 
