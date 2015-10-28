class GraphsController < ApplicationController
  def index
  	#puts "Hello world"
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
  			
    		# flash[:notice] = "#{data[1]} "
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
	  #f.series(:type=> 'pie',:name=> 'Total consumption', 
	  #:data=> [
	   # {:name=> 'Jane', :y=> 13, :color=> 'red'}, 
	    #{:name=> 'John', :y=> 23,:color=> 'green'},
	    #{:name=> 'Joe', :y=> 19,:color=> 'blue'}
	  #],
	  #:center=> [100, 80], :size=> 100, :showInLegend=> false)

	

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
