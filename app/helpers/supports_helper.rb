module SupportsHelper
	def set_color_state state 
	  ">>>>>>>>>>>>>>>>>>><estadooooooooooooooooooooooooo #{state}  oooooooooooooooooooo"
      case state # a_variable is the variable we want to compare
		when "abierto"    #compare to 1
		  "#e31919" 

		when "pendiente" 
		  "#f9f822"
		when "pre_finalizado"
		  "#1148cc"
		when "cerrado"
		  "#20c807"
		else
		  "white"
	  end
	end
end
