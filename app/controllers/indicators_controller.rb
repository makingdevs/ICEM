require 'enums/states'
require 'enums/indicators'
require 'json'

class IndicatorsController < ApplicationController

  def indicators
    p params[:name]
    @indicators = Indicators.constants.collect  do |indicator| Indicators.const_get(indicator) end
    @states = States.constants.collect  do |state| States.const_get(state) end
    render states: @states, Indicators: @indicators
  end

  def data
    render json: [{'articles': [[2010, 6], [2011, 10], [2012, 11], [2013, 23], [2006, 1]], 'total': 51, 'name': 'Aguascalientes'}, 
                  {'articles': [[2008, 1], [2010, 3], [2011, 4], [2012, 17], [2013, 10]], 'total': 35, 'name': 'Baja California'}, 
                  {'articles': [[2009, 1], [2010, 2], [2011, 8], [2012, 13], [2013, 11]], 'total': 35, 'name': 'Baja California Sur'}, 
                  {'articles': [[2007, 1], [2009, 3], [2010, 5], [2011, 7], [2012, 9], [2013, 9]], 'total': 34, 'name': 'Campeche'}, 
                  {'articles': [[2009, 2], [2010, 3], [2011, 4], [2012, 8], [2013, 9]], 'total': 26, 'name': 'Coahuila'}, 
                  {'articles': [[2009, 2], [2010, 2], [2011, 3], [2012, 9], [2013, 7]], 'total': 23, 'name': 'Colima'}, 
                  {'articles': [[2008, 1], [2010, 5], [2011, 10], [2012, 3], [2013, 3]], 'total': 22, 'name': 'Chiapas'}, 
                  {'articles': [[2007, 1], [2009, 1], [2010, 3], [2011, 4], [2012, 4], [2013, 8]], 'total': 21, 'name': 'Chihuahua'}, 
                  {'articles': [[2006, 1], [2009, 3], [2010, 4], [2011, 1], [2012, 2], [2013, 7]], 'total': 18, 'name': 'Ciudad de México'}, 
                  {'articles': [[2010, 2], [2011, 4], [2012, 6], [2013, 4], [2007, 1]], 'total': 17, 'name': 'Durango'}, 
                  {'articles': [[2010, 1], [2011, 3], [2012, 8], [2013, 3]], 'total': 15, 'name': 'Guanajuato'}, 
                  {'articles': [[2009, 1], [2012, 4], [2013, 9]], 'total': 14, 'name': 'Guerrero'}, 
                  {'articles': [[2012, 1], [2013, 13]], 'total': 14, 'name': 'Hidalgo'}, 
                  {'articles': [[2009, 2], [2010, 1], [2011, 2], [2013, 8]], 'total': 13, 'name': 'Jalisco'}, 
                  {'articles': [[2008, 1], [2010, 2], [2011, 3], [2012, 3], [2013, 4]], 'total': 13, 'name': 'Estado de México'}, 
                  {'articles': [[2009, 1], [2010, 1], [2011, 8], [2012, 2]], 'total': 12, 'name': 'Michoacán'}, 
                  {'articles': [[2012, 12]], 'total': 12, 'name': 'Morelos'}, 
                  {'articles': [[2009, 1], [2010, 1], [2012, 4], [2013, 6]], 'total': 12, 'name': 'Nayarit'}, 
                  {'articles': [[2011, 3], [2012, 5], [2013, 3]], 'total': 11, 'name': 'Nuevo León'}, 
                  {'articles': [[2011, 1], [2012, 2], [2013, 8]], 'total': 11, 'name': 'Oaxaca'}, 
                  {'articles': [[2008, 1], [2010, 2], [2011, 5], [2012, 2]], 'total': 10, 'name': 'Puebla'}, 
                  {'articles': [[2012, 10]], 'total': 10, 'name': 'Querétaro'}, 
                  {'articles': [[2009, 1], [2011, 1], [2012, 5], [2013, 1]], 'total': 8, 'name': 'Quintana Roo'}, 
                  {'articles': [[2010, 2], [2012, 4], [2013, 1]], 'total': 7, 'name': 'San Luis Potosí'}, 
                  {'articles': [[2013, 7]], 'total': 7, 'name': 'Sinaloa'}, 
                  {'articles': [[2011, 5], [2013, 1]], 'total': 6, 'name': 'Sonora'}, 
                  {'articles': [[2011, 1], [2012, 1], [2013, 4]], 'total': 6, 'name': 'Tabasco'}, 
                  {'articles': [[2011, 1], [2012, 2], [2013, 2]], 'total': 5, 'name': 'Tamaulipas'}, 
                  {'articles': [[2011, 2], [2013, 3]], 'total': 5, 'name': 'Tlaxcala'}, 
                  {'articles': [[2009, 1], [2010, 1], [2011, 1], [2012, 1], [2013, 1]], 'total': 5, 'name': 'Veracruz'},
                  {'articles': [[2009, 2], [2010, 1], [2011, 1], [2012, 1], [2013, 1]], 'total': 6, 'name': 'Yucatán'},
                  {'articles': [[2009, 1], [2010, 2], [2011, 2], [2012, 1], [2013, 1]], 'total': 7, 'name': 'Zacatecas'}]
  end

end
