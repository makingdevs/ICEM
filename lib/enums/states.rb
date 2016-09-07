module States

  @@values = 
    {
      :AGS => {name:"Aguascalientes", code:"mx-ag"},
      :BC => {name:"Baja California", code:"mx-bc"},
      :BCS => {name:"Baja California Sur", code:"mx-bs"},
      :CAMP => {name:"Campeche", code:"mx-cm"},
      :COAH => {name:"Coahuila", code:"mx-co"},
      :COL => {name:"Colima", code:"mx-cl"},
      :CHIS => {name:"Chiapas", code:"mx-cs"},
      :CHIH => {name:"Chihuahua", code:"mx-ch"},
      :DF => {name:"Ciudad de México", code:"mx-df"},
      :DGO => {name:"Durango", code:"mx-dg"},
      :GTO => {name:"Guanajuato", code:"mx-gj"},
      :GRO => {name:"Guerrero", code:"mx-gr"},
      :HGO => {name:"Hidalgo", code:"mx-hg"},
      :JAL => {name:"Jalisco", code:"mx-ja"},
      :MEX => {name:"Estado de México", code:"mx-mx"},
      :MICH => {name:"Michoacán", code:"mx-mi"},
      :MOR => {name:"Morelos", code:"mx-mo"},
      :NAY => {name:"Nayarit", code:"mx-na"},
      :NL => {name:"Nuevo León", code:"mx-nl"},
      :OAX => {name:"Oaxaca", code:"mx-oa"},
      :PUE => {name:"Puebla", code:"mx-pu"},
      :QRO => {name:"Querétaro", code:"mx-qt"},
      :QR => {name:"Quintana Roo", code:"mx-qr"},
      :SLP => {name:"San Luis Potosí", code:"mx-sl"},
      :SIN => {name:"Sinaloa", code:"mx-si"},
      :SON => {name:"Sonora", code:"mx-so"},
      :TAB => {name:"Tabasco", code:"mx-tb"},
      :TAMS => {name:"Tamaulipas", code:"mx-tm"},
      :TLAX => {name:"Tlaxcala", code:"mx-tl"},
      :VER => {name:"Veracruz", code:"mx-ve"},
      :YUC => {name:"Yucatán", code:"mx-yu"},
      :ZAC => {name:"Zacatecas", code:"mx-za"},
    }

  def self.values
    @@values
  end

end

