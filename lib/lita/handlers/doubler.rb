module Lita
  module Handlers
    class Doubler < Handler
      route(
      /^double\s+(\d+)$/i,
      :respond_with_double,
      command: true,
      help: {'double N'=>'prints N + N'}
      )
      def respond_with_double(response)
         #read up on the Ruby match
         n = response.match_data.captures.first
         n = Integer(n)
         
         response.reply"#{n} + #{n} = #{double_number n}"
      end
      
      def double_number(n)
         n + n
      end
       
      Lita.register_handler(self)
    end
  end
end
