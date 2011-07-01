module Lokka
  module Plusone
    def self.registered(app)
      app.get '/admin/plugins/plusone' do
        haml :"plugin/lokka-plusone/views/index", :layout => :"admin/layout"
      end 

      app.put '/admin/plugins/plusone' do
        params.each_pair do |key, value|
          eval("Option.#{key}='#{value}'") if key != '_method'
        end
        flash[:notice] = t.plusone_updated
        redirect '/admin/plugins/plusone'
      end 
    end 
  end

  module Helpers
    def plusone_js
      code = %Q(<script type="text/javascript" src="https://apis.google.com/js/plusone.js">)
      if Option.plusone_parsetags == "explicit"
        code += "{parsetags: 'explicit'}"
      end
      code += "</script>"
    end

    def plusone(href = nil)
      opts = {'size' => Option.plusone_size.blank? ? 'standard' : Option.plusone_size}
      opts['count'] = Option.plusone_lang.blank? ? 'true' : Option.plusone_counter
      opts['lang'] = Option.plusone_lang.blank? ? 'en-US' : Option.plusone_lang
      opts['href'] = href unless href.nil?
      opts['callback'] = Option.plusone_callback_js unless Option.pluseone_callback_js.blank?

      data = []
      opts.each {|opt| data << opt.join('="') + '"'}
      code = "<g:plusone " + data.join(' ') + "></g:plusone>"
    end
  end
end
