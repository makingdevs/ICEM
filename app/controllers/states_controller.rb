require 'enums/states'
require 'enums/indicators'

class StatesController < ApplicationController

  def states
    @indicators = Indicators.values.collect do |key, value| value[:name] end
    @states = States.values
    render "states/#{params[:name].downcase}",  states: @states, Indicators: @indicators
  end

  def data
    render json:  [

    {"name":"Vivienda",
    "region":"Vivienda",
    "income":[[1990,2777.42],[1991,2730.85],[1992,2627.85],[1993,1869.92],[1994,1851.45],[1995,1989.02],[1996,2157.35],[1997,2277.14],[1998,2384.48],[1999,2417.18],[2000,2446.65],[2001,2479.69],[2002,2773.29],[2003,2785.39],[2004,3007.11],[2005,3533],[2006,4069.56],[2007,4755.46],[2008,5228.74],[2009,5055.59]],
    "population":[[1990,8290856],[1991,8490763],[1992,8735988],[1993,8961438],[1994,9170032],[1995,9421477],[1996,9660081],[1997,9875024],[1998,10071442],[1999,10263229],[2000,10442812],[2001,10623424],[2002,10866106],[2003,11186202],[2004,11521432],[2005,11827315],[2006,12127071],[2007,12420476],[2008,12707546]],
    "lifeExpectancy":[[1990,41.99],[1991,42.16],[1992,42.32],[1993,42.46],[1994,42.59],[1995,42.7],[1996,42.82],[1997,42.96],[1998,43.12],[1999,43.32],[2000,43.56],[2001,43.86],[2002,44.22],[2003,44.61],[2004,45.05],[2005,45.52],[2006,46.02],[2007,46.54],[2008,47.06],[2009,47.58]]},

    {"name":"Ingresos",
    "region":"Ingresos",
    "income":[[1990,1165.47],[1991,1181.65],[1992,1191.21],[1993,1177.91],[1994,1168.53],[1995,1176.67],[1996,1202.15],[1997,1232.98],[1998,1251.88],[1999,1272.8],[2000,1307.57],[2001,1333.3],[2002,1372.88],[2003,1386.05],[2004,1389.13],[2005,1390],[2006,1402.94],[2007,1428.15],[2008,1459.07],[2009,1457.57]],
    "population":[[1990,4676077],[1991,4828814],[1992,4981671],[1993,5214220],[1994,5487359],[1995,5700089],[1996,5886094],[1997,6066080],[1998,6248686],[1999,6435871],[2000,6627964],[2001,6824931],[2002,7026113],[2003,7230693],[2004,7438437],[2005,7649360],[2006,7862944],[2007,8078314],[2008,8294941]],
    "lifeExpectancy":[[1990,53.84],[1991,54.34],[1992,54.86],[1993,55.38],[1994,55.89],[1995,56.38],[1996,56.84],[1997,57.26],[1998,57.64],[1999,58],[2000,58.34],[2001,58.68],[2002,59.02],[2003,59.38],[2004,59.77],[2005,60.17],[2006,60.6],[2007,61.03],[2008,61.47],[2009,61.89]]},

    {"name":"Empleos",
    "region":"Empleos",
    "income":[[1990,7829.23],[1991,7964.58],[1992,7954.11],[1993,7860.65],[1994,7898.05],[1995,8030.48],[1996,8281.92],[1997,8647.14],[1998,8990.98],[1999,9416.67],[2000,10107.99],[2001,10543.61],[2002,11003.61],[2003,11391.09],[2004,11722.59],[2005,12057],[2006,12574.18],[2007,13010.7],[2008,13240.06],[2009,12282.28]],
    "population":[[1990,1263643],[1991,1301796],[1992,1342614],[1993,1385749],[1994,1427426],[1995,1466989],[1996,1503652],[1997,1536536],[1998,1564950],[1999,1588505],[2000,1607069],[2001,1620848],[2002,1630347],[2003,1636213],[2004,1639231],[2005,1640115],[2006,1639833],[2007,1639131],[2008,1638393]],
    "lifeExpectancy":[[1990,64.24],[1991,63.97],[1992,63.38],[1993,62.47],[1994,61.26],[1995,59.76],[1996,57.98],[1997,56.05],[1998,54.08],[1999,52.21],[2000,50.65],[2001,49.59],[2002,49.11],[2003,49.22],[2004,49.87],[2005,50.92],[2006,52.17],[2007,53.39],[2008,54.4],[2009,55.12]]},

    {"name":"Comunidad",
    "region":"Comunidad",
    "income":[[1990,880.17],[1991,938.09],[1992,931.75],[1993,895.91],[1994,878.97],[1995,889.91],[1996,929.21],[1997,946.29],[1998,978.6],[1999,1009.59],[2000,1001.48],[2001,1029.97],[2002,1037.65],[2003,1080.53],[2004,1096.85],[2005,1140],[2006,1175.51],[2007,1189.88],[2008,1223.52],[2009,1234.42]],
    "population":[[1990,8335771],[1991,8603238],[1992,8878303],[1993,9159653],[1994,9467871],[1995,9772602],[1996,10060724],[1997,10352843],[1998,10652495],[1999,10975109],[2000,11308552],[2001,11732326],[2002,12251209],[2003,12705775],[2004,13092647],[2005,13491736],[2006,13902972],[2007,14326203],[2008,14761339]],
    "lifeExpectancy":[[1990,47.42],[1991,47.65],[1992,47.89],[1993,48.14],[1994,48.41],[1995,48.7],[1996,49.01],[1997,49.34],[1998,49.68],[1999,50.02],[2000,50.37],[2001,50.72],[2002,51.07],[2003,51.42],[2004,51.76],[2005,52.09],[2006,52.42],[2007,52.74],[2008,53.06],[2009,53.38]]},

    {"name":"Educación",
    "region":"Educación",
    "income":[[1990,630.44],[1991,646.51],[1992,631.7],[1993,613.04],[1994,585.18],[1995,507.2],[1996,462.85],[1997,463.12],[1998,473.7],[1999,455.41],[2000,443.76],[2001,440.51],[2002,446.4],[2003,427.14],[2004,431.76],[2005,420.08],[2006,432.95],[2007,439.64],[2008,450.54],[2009,457.07]],
    "population":[[1990,5505113],[1991,5636676],[1992,5809236],[1993,5632915],[1994,5681513],[1995,6077812],[1996,6100754],[1997,6121610],[1998,6271409],[1999,6458283],[2000,6621126],[2001,6810307],[2002,7021078],[2003,7251827],[2004,7516212],[2005,7795426],[2006,8090068],[2007,8390505],[2008,8691005]],
    "lifeExpectancy":[[1990,46.36],[1991,45.76],[1992,45.27],[1993,44.96],[1994,44.85],[1995,44.95],[1996,45.23],[1997,45.61],[1998,46.03],[1999,46.47],[2000,46.9],[2001,47.33],[2002,47.77],[2003,48.22],[2004,48.69],[2005,49.15],[2006,49.61],[2007,50.06],[2008,50.51],[2009,50.95]]},

    {"name":"Entorno",
    "region":"Entorno",
    "income":[[1990,2036.08],[1991,1903.16],[1992,1793.16],[1993,1688.77],[1994,1603.04],[1995,1613.97],[1996,1652.43],[1997,1694.34],[1998,1736.44],[1999,1770.65],[2000,1803.44],[2001,1857.15],[2002,1934.01],[2003,1967.39],[2004,1997.11],[2005,1995],[2006,2003.19],[2007,2012.18],[2008,2013.83],[2009,1997.18]],
    "population":[[1990,11778594],[1991,12122404],[1992,12467171],[1993,12814205],[1994,13161203],[1995,13504356],[1996,13848792],[1997,14195809],[1998,14543246],[1999,14889962],[2000,15233673],[2001,15577246],[2002,15929988],[2003,16286408],[2004,16637276],[2005,16988132],[2006,17340702],[2007,17696293],[2008,18054929]],
    "lifeExpectancy":[[1990,55.08],[1991,54.91],[1992,54.66],[1993,54.34],[1994,53.98],[1995,53.59],[1996,53.18],[1997,52.75],[1998,52.31],[1999,51.9],[2000,51.52],[2001,51.19],[2002,50.93],[2003,50.74],[2004,50.64],[2005,50.62],[2006,50.7],[2007,50.87],[2008,51.1],[2009,51.39]]},

    {"name":"Compromiso civil",
    "region":"Compromiso civil",
    "income":[[1990,1587.89],[1993,1524.74],[1994,1600.25],[1995,1700.27],[1996,1788.78],[1997,1902.83],[1998,2018.62],[1999,2168.69],[2000,2291.29],[2001,2406.57],[2002,2505.29],[2003,2600.55],[2004,2692.59],[2005,2831],[2006,3078.92],[2007,3274.76],[2008,3384.72],[2009,3456.14]],
    "population":[[1990,349264],[1991,355545],[1992,361638],[1993,367520],[1994,373163],[1995,378520],[1996,383584],[1997,388383],[1998,392941],[1999,397270],[2000,401343],[2001,405163],[2002,408760],[2003,412137],[2004,415294],[2005,418224],[2006,420979],[2007,423613],[2008,426113]],
    "lifeExpectancy":[[1990,65.93],[1991,66.3],[1992,66.65],[1993,66.97],[1994,67.28],[1995,67.57],[1996,67.84],[1997,68.12],[1998,68.4],[1999,68.68],[2000,68.98],[2001,69.28],[2002,69.59],[2003,69.9],[2004,70.21],[2005,70.52],[2006,70.82],[2007,71.11],[2008,71.4],[2009,71.68]]},

    {"name":"Salud",
    "region":"Salud",
    "income":[[1990,999.11],[1991,1065.94],[1992,1058.06],[1993,1003.69],[1994,1023.26],[1995,995.98],[1996,995.1],[1997,1004.96],[1998,1048.81],[1999,1039.29],[2000,1017.03],[2001,1084.2],[2002,1156.18],[2003,1287.08],[2004,1669.42],[2005,1749],[2006,1708.94],[2007,1670.3],[2008,1622.41],[2009,1557.83]],
    "population":[[1990,6022856],[1991,6232340],[1992,6429417],[1993,6655731],[1994,6886696],[1995,7103883],[1996,7329462],[1997,7562011],[1998,7804481],[1999,8058514],[2000,8316481],[2001,8573507],[2002,8835739],[2003,9103618],[2004,9377194],[2005,9657069],[2006,9944201],[2007,10238807],[2008,10541156]],
    "lifeExpectancy":[[1990,51.21],[1991,51.2],[1992,51.14],[1993,51.03],[1994,50.88],[1995,50.68],[1996,50.45],[1997,50.18],[1998,49.89],[1999,49.59],[2000,49.3],[2001,49.03],[2002,48.81],[2003,48.63],[2004,48.52],[2005,48.48],[2006,48.51],[2007,48.61],[2008,48.76],[2009,48.97]]},

    {"name":"Satisfacción de vida",
    "region":"Satisfacción de vida",
    "income":[[1990,1286.8],[1991,1183.07],[1992,1246.91],[1993,1247.05],[1994,1146.29],[1995,1209.23],[1996,1158.46],[1997,1173.62],[1998,1148.85],[1999,1137.89],[2000,1090.79],[2001,1083.42],[2002,1075.81],[2003,1070.95],[2004,1083.02],[2005,1063],[2006,1054.06],[2007,1037.46],[2008,1026.03],[2009,1016.42]],
    "population":[[1990,429010],[1991,441427],[1992,454429],[1993,468010],[1994,482162],[1995,496906],[1996,512197],[1997,527982],[1998,544267],[1999,561063],[2000,578400],[2001,596202],[2002,614382],[2003,632948],[2004,651901],[2005,671247],[2006,690948],[2007,710960],[2008,731281]],
    "lifeExpectancy":[[1990,56.43],[1991,57.04],[1992,57.64],[1993,58.24],[1994,58.82],[1995,59.37],[1996,59.9],[1997,60.41],[1998,60.9],[1999,61.38],[2000,61.85],[2001,62.31],[2002,62.76],[2003,63.2],[2004,63.64],[2005,64.08],[2006,64.51],[2007,64.94],[2008,65.36],[2009,65.77]]},

    {"name":"Seguridad",
    "region":"Seguridad",
    "income":[[1990,595.59],[1991,527.67],[1992,465.07],[1993,395.61],[1994,373.44],[1995,367.22],[1996,362.19],[1997,343.52],[1998,335.86],[1999,316.71],[2000,292.45],[2001,281.91],[2002,287.38],[2003,299.49],[2004,314.52],[2005,330],[2006,338.29],[2007,348.98],[2008,359.38],[2009,358.8]],
    "population":[[1990,39064041],[1991,40388906],[1992,41672143],[1993,43055943],[1994,44539132],[1995,46343432],[1996,47265530],[1997,47798986],[1998,48877408],[1999,50400431],[2000,52021832],[2001,53682112],[2002,55379852],[2003,57124974],[2004,58919207],[2005,60764490],[2006,62660551],[2007,64606759],[2008,66604314]],
    "lifeExpectancy":[[1990,47.79],[1991,47.68],[1992,47.45],[1993,47.12],[1994,46.71],[1995,46.29],[1996,45.96],[1997,45.79],[1998,45.8],[1999,46],[2000,46.34],[2001,46.75],[2002,47.13],[2003,47.4],[2004,47.57],[2005,47.63],[2006,47.63],[2007,47.63],[2008,47.68],[2009,47.81]]},

    {"name":"Equilibrio",
    "region":"Equilibrio",
    "income":[[1990,4066.16],[1991,4036.64],[1992,4016.24],[1993,3850.64],[1994,3523.16],[1995,3554.39],[1996,3596.92],[1997,3484.16],[1998,3516.06],[1999,3304.52],[2000,3423.52],[2001,3397.84],[2002,3484.06],[2003,3425.54],[2004,3455.04],[2005,3621],[2006,3738.39],[2007,3575.55],[2008,3668.41],[2009,3834.67]],
    "population":[[1990,2264842],[1991,2336155],[1992,2409073],[1993,2487553],[1994,2568840],[1995,2648529],[1996,2729757],[1997,2800947],[1998,2878481],[1999,2970784],[2000,3102404],[2001,3238410],[2002,3328795],[2003,3412576],[2004,3502035],[2005,3602269],[2006,3702314],[2007,3800610],[2008,3903318]],
    "lifeExpectancy":[[1990,59.26],[1991,58.76],[1992,58.16],[1993,57.5],[1994,56.8],[1995,56.09],[1996,55.41],[1997,54.8],[1998,54.28],[1999,53.87],[2000,53.58],[2001,53.39],[2002,53.29],[2003,53.24],[2004,53.24],[2005,53.28],[2006,53.35],[2007,53.46],[2008,53.59],[2009,53.75]]}
    ]
  end

end
