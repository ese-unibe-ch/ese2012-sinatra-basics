      # a module is a namespace to avoid name collisions
      module University

        class Student

          # class variable
          @@students = Array.new

          # generate instance attributes
          attr_accessor :name, :grades

          # class factory method
          def self.named( name )
              student = self.new
              student.name = name
              student
          end

          def self.all
            @@students
          end

          def self.by_name name
            @@students.detect {|student| student.name == name }
          end

          # add the instance to the list of students
          def save
            @@students.push self
          end

          # instance initialize
          def initialize
            self.grades = Array.new
          end

          def to_s
            "#{name} (average=#{self.average})"
          end

          def add( grade )
            grades.push( grade )
          end

          def average
            total = grades.inject(0){ |sum, grade| sum + grade }
            total / grades.length
          end

          def award?
            grades.all? { |grade| grade == 6 }
          end

        end

      end