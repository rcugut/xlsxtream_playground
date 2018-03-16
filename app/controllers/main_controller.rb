class MainController < ApplicationController
  include ActionController::Live

  layout 'application'

  def index
  end



  def download
    response.headers.delete('Content-Length')
    response.headers['Content-Type'] = 'application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    response.headers['Content-Disposition'] = %(attachment; filename="#{'test'}_#{Time.now.strftime('%Y%m%dT%H%M')}.xlsx")
    response.headers['X-Accel-Buffering'] = 'no'
    response.headers['Cache-Control'] = 'no-cache'


#     st = ExcelDownloadIO.new(response.stream)
#     xlsx = Xlsxtream::Workbook.new(st)
#
#     xlsx.write_worksheet 'Sheet1' do |sheet|
#       puts "xlsx> header"
#       sheet << %w(id text status)

#       20.times do |c|
#         puts "xlsx> line: #{c}"
#         sheet << [ c, 'line', 'ok' ]
#         sleep 1
#       end
#
#       puts "xlsx> footer"
#       sheet << [ 'Copyright ...' ]
#     end
#
#     xlsx.close


    20.times do |c|
      response.stream.write("line_#{c}")
    end


  rescue => ex
    logger.error("#download FAILED: #{ex}")
    raise ex
  ensure
    # st.close if st
    response.stream.close
  end









  class ExcelDownloadIO
    def initialize(st)
      @st = st
    end

    def <<(data)
      @st.write(data)
    end

    def close
      @st.close
    end
  end


end
