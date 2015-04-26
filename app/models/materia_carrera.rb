class MateriaCarrera < ActiveRecord::Base
  belongs_to :curso
  belongs_to :carrera
end
