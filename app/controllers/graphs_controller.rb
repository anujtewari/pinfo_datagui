class GraphsController < ApplicationController

  def index

  	@passedid = params[:id]  
    map = Hash.new
    map['Car']= [
 {"year" => 1997, :make => 'Ford', :model => 'E350', :description => 'ac, abs, moon', :price => 3000.00},
 {:year => 1999, :make => 'Chevy', :model => 'Venture "Extended Edition"', :description => nil, :price => 4900.00},
 {:year => 1999, :make => 'Chevy', :model => 'Venture "Extended Edition, Very Large"', :description => nil, :price => 5000.00},
 {"year" => 1996, :make => 'Jeep', :model => 'Grand Cherokee', :description => "MUST SELL!\nair, moon roof, loaded", :price => 4799.00}
] 
    
    map['Truck']= [
 {"year" => 1997, :make => 'Ford', :model => 'E350', :description => 'ac, abs, moon', :price => 3000.00},
 {:year => 1999, :make => 'Chevy', :model => 'Venture "Extended Edition"', :description => nil, :price => 4900.00},
 {:year => 1999, :make => 'Chevy', :model => 'Venture "Extended Edition, Very Large"', :description => nil, :price => 5000.00},
 {"year" => 1996, :make => 'Jeep', :model => 'Grand Cherokee', :description => "MUST SELL!\nair, moon roof, loaded", :price => 4799.00}
] 

  @keysMap=Hash.new
  map.each do |key, array|
  	flash[:notice]="#{key}"
  	@keysMap[key]=map[key][0].keys

  	# 

  	# map[key].each do |keys, arrays|
  	# 	flash[:notice]="#{keys.keys}"
  	# end
  	# flash[:notice]="#{keysMap[key]}"
  end
  end
  def new
  	#This controller will be contain the parser code 
  	# and the logic for displaying different types of tables
  	id = params[:id]
  	path = File.expand_path("../../../public" + id, __FILE__)  	
  	data = Hash.new
  	i = 1
  	average=[0,0,0,0,0,0,0]
  	File.open(path, "r") do |f|
  		f.each_line do |line|
  			line = line.strip()
  			data[i] = line.split(',').map{|s| s.to_i}
  			for k in 0..6
  				average[k]= average[k]+ data[i][k]
  			end
  			
    		
    		i += 1
  		end
	end
 	
 	for i in 0..6
 		average[i]=average[i]/6.0
 	end

	

	@chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title({ :text=>"Diabetes Results"})
 	  f.options[:xAxis][:categories] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday']
 	  f.options[:yAxis][:title][:text] = '(in mg/dl)'
	  #f.labels(:items=>[:html=>"Diabetes Value", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ]) 
	  f.series(:type=> 'column',:name=> 'Before Breakfast',:data=> data[1])
	  f.series(:type=> 'column',:name=> 'After Breakfast',:data=> data[2])
	  f.series(:type=> 'column',:name=> 'Before Lunch',:data=> data[3])
	  f.series(:type=> 'column',:name=> 'After Lunch',:data=> data[4])
	  f.series(:type=> 'column',:name=> 'Before Dinner', :data=> data[5])
	  f.series(:type=> 'column',:name=> 'After Dinner', :data=> data[6])
	  f.series(:type=> 'line',:name=> 'Average', :data=> average)

	 
	end 


	@line_chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title({ :text=>"Diabetes Results"})
 	  f.options[:xAxis][:categories] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday']
 	  f.options[:yAxis][:title][:text] = '(in mg/dl)'
	  #f.labels(:items=>[:html=>"Diabetes Value", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ]) 
	  f.series(:type=> 'line',:name=> 'Before Breakfast',:data=> data[1])
	  f.series(:type=> 'line',:name=> 'After Breakfast',:data=> data[2])
	  f.series(:type=> 'line',:name=> 'Before Lunch',:data=> data[3])
	  f.series(:type=> 'line',:name=> 'After Lunch',:data=> data[4])
	  f.series(:type=> 'line',:name=> 'Before Dinner', :data=> data[5])
	  f.series(:type=> 'line',:name=> 'After Dinner', :data=> data[6])
	  
  end
end
  def show
  end
end
