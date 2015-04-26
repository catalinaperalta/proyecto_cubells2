class MateriaProfesor < ActiveRecord::Base
  belongs_to :curso
  belongs_to :profesor
end
