class GraphsController < ApplicationController
  def index
  	#puts "Hello world"
	@chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title({ :text=>"Diabetes Results"})
 	  f.options[:xAxis][:categories] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
 	  f.options[:yAxis][:title][:text] = '(in mg)'
	  #f.labels(:items=>[:html=>"Diabetes Value", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ]) 
	  f.series(:type=> 'column',:name=> 'Before Breakfast',:data=> [3, 2, 1, 3, 4,6])
	  f.series(:type=> 'column',:name=> 'After Breakfast',:data=> [2, 3, 5, 7, 6,8])
	  f.series(:type=> 'column',:name=> 'Before Lunch',:data=> [4, 3, 3, 9, 9,1])
	  f.series(:type=> 'column',:name=> 'After Lunch',:data=> [4, 3, 3, 9, 9,7])
	  f.series(:type=> 'column',:name=> 'Before Dinner', :data=> [3, 2.67, 3, 6.33, 3.33,2.9])
	  f.series(:type=> 'column',:name=> 'After Dinner', :data=> [4, 3.67, 2, 6.433, 3.133,9.8])
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
 	  f.options[:xAxis][:categories] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
 	  f.options[:yAxis][:title][:text] = '(in mg)'
	  #f.labels(:items=>[:html=>"Diabetes Value", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ]) 
	  f.series(:type=> 'spline',:name=> 'Before Breakfast',:data=> [3, 2, 1, 3, 4,6])
	  f.series(:type=> 'spline',:name=> 'After Breakfast',:data=> [2, 3, 5, 7, 6,8])
	  f.series(:type=> 'spline',:name=> 'Before Lunch',:data=> [4, 3, 3, 9, 0,1])
	  f.series(:type=> 'spline',:name=> 'After Lunch',:data=> [4, 3, 3, 9, 0,7])
	  f.series(:type=> 'spline',:name=> 'Before Dinner', :data=> [3, 2.67, 3, 6.33, 3.33,2.9])
	  f.series(:type=> 'spline',:name=> 'After Dinner', :data=> [4, 3.67, 2, 6.433, 3.133,9.8])
  end
end
  def show
  end
end
