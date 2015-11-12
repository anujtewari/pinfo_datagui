class GraphsController < ApplicationController

  def index

  	@passedid = params[:id]


    path = File.expand_path("../../../public" + @passedid, __FILE__)

    map = parseCSV(path)
    

  @keysMap=Hash.new
  map.each do |key, array|  	
  	@keysMap[key]=map[key][0].keys
  end

  end

  def new
  	#This controller will be contain the parser code 
  	# and the logic for displaying different types of tables
    
    #logic of getting X Y axis rows and columns 

    id = params[:id]
    path = File.expand_path("../../../public" + id, __FILE__) 

    map = parseCSV(path)     
    
    graphName = params[:graph];
    yAxis = Array.new
    xaxisName = "initialized" 
    varname = "initialized"
    
    if map.has_key?(graphName) then
      fieldsList = map[graphName][0].keys      
      fieldsList.each do |field|       
        varname = "y_"+"#{field}" +"_"+graphName
        
        flash[:notice]=params[varname]
        if params[varname] == "1" then          
          yAxis.push(field)
        end

        varname = "x_" + "#{field}"  + "_" + graphName
        if params[varname] == "1" then
          xaxisName = field          
        end       
      end
    end   
    
    #logic of getting X Y axis ends here
    # X axis is in xaxisName
    # Y axis is in yAxis array
    # graph name is in graphName 

		parseResult = parseCSV(path)
		graphCategory = graphName
		xAxis = xaxisName
		yAxis = yAxis
		# yAxis = ['BeforeBreakfast','AfterBreakfast', 'BeforeLunch', 'AfterLunch', 'BeforeDinner', 'AfterDinner' ]


		xAxisCategories = []
		for i in 0..parseResult[graphCategory].length-1
			xAxisCategories.push(parseResult[graphCategory][i][xAxis])
		end

		yAxisData = {}
		for i in 0..yAxis.length-1
			for j in 0..parseResult[graphCategory].length - 1
				if yAxisData.has_key?(yAxis[i])
					yAxisData[yAxis[i]].push(parseResult[graphCategory][j][yAxis[i]].to_i)
				else
					yAxisData[yAxis[i]] = []
					yAxisData[yAxis[i]].push(parseResult[graphCategory][j][yAxis[i]].to_i)
				end
			end

		end

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
			f.title({ :text=>"Diabetes Results"})
			f.options[:xAxis][:categories] = xAxisCategories
			f.options[:yAxis][:title][:text] = '(in mg/dl)'
			#f.labels(:items=>[:html=>"Diabetes Value", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
			for i in 0..yAxis.length-1
				f.series(:type=> 'column',:name=> yAxis[i],:data=> yAxisData[yAxis[i]])
			end
			#f.series(:type=> 'line',:name=> 'Average', :data=> average)


		end


	@line_chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title({ :text=>"Diabetes Results"})
 	  f.options[:xAxis][:categories] = xAxisCategories
 	  f.options[:yAxis][:title][:text] = '(in mg/dl)'
		f.labels(:items=>[:html=>"Diabetes Value", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
		for i in 0..yAxis.length-1
			f.series(:type=> 'line',:name=> yAxis[i],:data=> yAxisData[yAxis[i]])
		end
  end

end
def show
end

private
def parseCSV(path)
	
	data = CSV.read(path);
	flagMultiple = FALSE
	if data[0].length != data[1].length and data[0].length == 1
		flagMultiple = TRUE
	end
	header = []
	result = []
	charts = {}

	if flagMultiple
		k = 1
	else
		k = 0
	end

	while TRUE
		for i in k..data.length - 1
			if data[i].length == 0 or i == data.length
				if flagMultiple
					charts[data[k-1][0]] = result
				else
					charts["default"] = result
				end
				result = []
				header = []
				k = i+2
				break
			end
			temp = {}
			for j in 0..data[i].length - 1
				if i == k
					header.push(data[i][j])
				else
					temp[header[j]] = data[i][j]
				end
			end
			if i != k
				result.push(temp)
			end
		end

		if k >= data.length
			break
		end

		if  i >= data.length-1
			if flagMultiple
				charts[data[k-1][0]] = result
			else
				charts["default"] = result
			end
			break
		end
	end
	return charts
end
end
