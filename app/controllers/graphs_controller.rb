class GraphsController < ApplicationController

  def index
    begin
    if(params.has_key?(:id) and (params[:id].length > 0))
    	@passedid = params[:id]
      path = File.expand_path("../../../public" + @passedid, __FILE__)
      dataArray = parseCSV(path)
    else
      dataArray = parseData()
    end

    @keysMap=Array.new
    @keysMap=dataArray[0].keys
    if dataArray.length > 5
      @rows = dataArray[0,4]
    else
      @rows = dataArray
    end
    rescue Exception => exc
    flash[:notice] = "Survey has not yet been taken by any user."
    redirect_to url_for(:controller => :surveys, :action => :index)
  end
  end
  
  def new
  	#This controller will be contain the parser code 
  	# and the logic for displaying different types of tables
    if(params.has_key?(:id) and (params[:id].length > 0))
      id = params[:id]
      path = File.expand_path("../../../public" + id, __FILE__) 
      parsedResult = parseCSV(path)
    else
      parsedResult = parseData()
    end

    xAxisHeadings = params[:xaxis];
    yAxisHeadings = params[:yAxisOptions]
    xAxisLabel    = params[:xUnits]
    yAsixLabel    = params[:yUnits]
    typeOfGraph   = params[:graphType]
    

    #For rows and tableHeadings for displaying table with chart
    @rows = parsedResult
    @tableHeadings = [xAxisHeadings] + yAxisHeadings


    #Getting data for both axis
    xAxisCategories = getXAxisCategories(parsedResult, xAxisHeadings)
    yAxisData = getYAxisData(parsedResult, yAxisHeadings)

    #Creating chart
    if typeOfGraph == 'Bar Graph'
      createBarChart(xAxisCategories, yAxisHeadings, yAxisData, xAxisLabel, yAsixLabel)
    else
      createLineChart(xAxisCategories, yAxisHeadings, yAxisData, xAxisLabel, yAsixLabel)
    end

  end
#Returns YAxis Heading selected on previous page
  def getYAxisHeadings(parsedResult)
    yAxisHeadings = Array.new
    fieldName = "initialized"
    graphName = "default"

    fieldsList = parsedResult[0].keys

    fieldsList.each do |field|
      fieldName = "y_"+"#{field}" +"_"+graphName
      if params[fieldName] == "1" then
        yAxisHeadings.push(field)
      end
    end
    return yAxisHeadings
  end
#To fetch xAxisCategories (XAxisData) from parseResult based on the heading in array: xAxisHeadings
  def getXAxisCategories(parseResult, xAxis)
    xAxisCategories = []
    for i in 0..parseResult.length-1
      xAxisCategories.push(parseResult[i][xAxis])
    end
    xAxisCategories
  end

#To fetch YAxisData from parseResult based on the heading in array: yAxisHeadings
  def getYAxisData(parseResult, yAxis)
    yAxisData = {}
    for i in 0..yAxis.length-1
      for j in 0..parseResult.length - 1
        if yAxisData.has_key?(yAxis[i])
          yAxisData[yAxis[i]].push(parseResult[j][yAxis[i]].to_f)
        else
          yAxisData[yAxis[i]] = []
          yAxisData[yAxis[i]].push(parseResult[j][yAxis[i]].to_f)
        end
      end

    end
    yAxisData
  end
#Method to create line chart
  def createLineChart(xAxisCategories, yAxis, yAxisData, xAxisLabel, yAsixLabel)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({:text => "Line Chart"})
      f.options[:xAxis][:categories] = xAxisCategories
      f.options[:xAxis][:title] = {
          enabled: true,
          text: xAxisLabel
      }
      f.options[:yAxis][:title][:text] = yAsixLabel
      f.options[:plotOptions]= {
          line: {
              dataLabels: {
                  enabled: true
              }
          }
      }
      if xAxisCategories.length > 10
        f.options[:xAxis][:labels] = {rotation: -45}
      end
      for i in 0..yAxis.length-1
        f.series(:type => 'line', :name => yAxis[i], :data => yAxisData[yAxis[i]])
      end
    end
  end

#Method to create bar chart
  def createBarChart(xAxisCategories, yAxis, yAxisData, xAxisLabel, yAsixLabel)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({:text => "Bar Chart"})
      f.options[:xAxis][:categories] = xAxisCategories
      f.options[:xAxis][:title] = {
          enabled: true,
          text: xAxisLabel
      }
      f.options[:yAxis][:title][:text] = yAsixLabel
      f.options[:tooltip] = {
          headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
          pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
              '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
          footerFormat: '</table>',
          shared: true,
          useHTML: true
      }
      f.options[:plotOptions] = {
          column: {
              pointPadding: 0.1,
              borderWidth: 0
          }
      }
      if xAxisCategories.length > 10
        f.options[:xAxis][:labels] = {rotation: -45}
      end
      for i in 0..yAxis.length-1
        f.series(:type => 'column', :name => yAxis[i], :data => yAxisData[yAxis[i]])
      end


    end
  end


  def show
  end

  private
  def parseCSV(path)
    #data stores the CSV information in the form of a 2D array, each line as an array
    data = CSV.read(path);
    header = []
    result = []

    #To loop through all data
    for lineNo in 0..data.length - 1
      temp = {}
      # traverse through each column of a table
      for columnNo in 0..data[lineNo].length - 1
        # if the line is header then push header column value one by one, assuming header is stored at line: 0
        if lineNo == 0
          header.push(data[lineNo][columnNo])
        else
          temp[header[columnNo]] = data[lineNo][columnNo]
        end
      end
      if lineNo != 0
        result.push(temp)
      end
    end
    return result
  end

  private
  def parseData()
    #Read the data from session and return 2d array
    data = session[:surveyObject];
    header = []
    result = []
    #To loop through all data
    for lineNo in 0..data.length - 1
      temp = {}
      # traverse through each column of a table
      for columnNo in 0..data[lineNo].length - 1
        # if the line is header then push header column value one by one, assuming header is stored at line: 0
        if lineNo == 0
          header.push(data[lineNo][columnNo])
        else
          temp[header[columnNo]] = data[lineNo][columnNo]
        end
      end
      if lineNo != 0
        result.push(temp)
      end
    end
    return result
  end

  private
  def parseCSV1(path)
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
