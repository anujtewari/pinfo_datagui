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
    xaxisName = params[:xaxis]; 
    varname = "initialized"
    
    if map.has_key?(graphName) then
      fieldsList = map[graphName][0].keys      
      fieldsList.each do |field|       
        varname = "y_"+"#{field}" +"_"+graphName

        if params[varname] == "1" then          
          yAxis.push(field)
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
					yAxisData[yAxis[i]].push(parseResult[graphCategory][j][yAxis[i]].to_f)
				else
					yAxisData[yAxis[i]] = []
					yAxisData[yAxis[i]].push(parseResult[graphCategory][j][yAxis[i]].to_f)
				end
			end

		end

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
			f.title({ :text=>"Bar Chart"})
			f.options[:xAxis][:categories] = xAxisCategories
			f.options[:yAxis][:title][:text] = '(in mg/dl)'
			#f.labels(:items=>[:html=>"Diabetes Value", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
      f.options[:tooltip] = {
          headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
          pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
              '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
          footerFormat: '</table>',
          shared: true,
          useHTML: true
      }
      f.options[:plotOptions] =  {
          column: {
              pointPadding: 0.1,
              borderWidth: 0
          }
      }
      if xAxisCategories.length > 7
					f.options[:xAxis][:labels] = { rotation: -45}
			end
			for i in 0..yAxis.length-1
				f.series(:type=> 'column',:name=> yAxis[i],:data=> yAxisData[yAxis[i]])
			end
			#f.series(:type=> 'line',:name=> 'Average', :data=> average)


		end


	@line_chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title({ :text=>"Line Chart"})
 	  f.options[:xAxis][:categories] = xAxisCategories
 	  f.options[:yAxis][:title][:text] = '(in mg/dl)'
    f.options[:plotOptions]= {
        line: {
            dataLabels: {
                enabled: true
            }
        }
    }
    if xAxisCategories.length > 7
      f.options[:xAxis][:labels] = { rotation: -45}
    end
		for i in 0..yAxis.length-1
			f.series(:type=> 'line',:name=> yAxis[i],:data=> yAxisData[yAxis[i]])
		end
  end

end
def show
end

private
def parseCSV(path)
 #data stores the CSV information in the form of a 2D array, each line as an array
 data = CSV.read(path);
 multipleCSVData = FALSE
 # multipleCSV is true if the CSV contains multiple table of data.
 if data[0].length != data[1].length and data[0].length == 1
   multipleCSVData = TRUE
 end
 header = []
 result = []
 charts = {}

 if multipleCSVData
   headerLine = 1
 else
   headerLine = 0
 end

 while TRUE
   for lineNo in headerLine..data.length - 1
     # break condition when we reach end of the table of data and add 'result' as value and table category as key in 'charts'
     if data[lineNo].length == 0 or lineNo == data.length
       if multipleCSVData
         charts[data[headerLine-1][0]] = result
       else
         # if CSV is a single table then, make key as 'default'
         charts['default'] = result
       end
       result = []
       header = []
       # move header line to next header of table
       headerLine = lineNo + 2
       break
     end
     temp = {}
     # traverse through each column of a table
     for columnNo in 0..data[lineNo].length - 1
       # if the line is header then push header column value one by one.
       if lineNo == headerLine
         header.push(data[lineNo][columnNo])
       else
         temp[header[columnNo]] = data[lineNo][columnNo]
       end
     end
     if lineNo != headerLine
       result.push(temp)
     end
   end

   if headerLine >= data.length
     break
   end
   # if we reach the end data
   if  lineNo >= data.length-1
     if multipleCSVData
       charts[data[headerLine-1][0]] = result
     else
       # if CSV is a single table then, make key as 'default'
       charts['default'] = result
     end
     break
   end
 end

 return charts
end
end
