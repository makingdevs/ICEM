module Indicators

  @@values = 
  {
    :VI => {name:"Vivienda",color:"#1F77B4"},
    :IN => {name:"Ingresos", color:"#AEC7E8"},
    :EM => {name:"Empleos", color:"#FF7F0E"},
    :CO => {name:"Comunidad", color:"#FFBB78"},
    :ED => {name:"Educación", color:"#2CA02C"},
    :EN => {name:"Entorno", color:"#98DF8A"},
    :CC => {name:"Compromiso civil", color:"#D62728"},
    :SA => {name:"Salud", color:"#FF9896"},
    :SV => {name:"Satisfacción de vida", color:"#9467BD"},
    :SE => {name:"Seguridad", color:"#C5B0D5"},
    :ET => {name:"Equilibrio trabajo-vida", color:"#8C564B"}
  }

  def self.values
    @@values
  end

end
