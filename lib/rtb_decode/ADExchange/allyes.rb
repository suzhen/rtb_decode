module Rtbdecode
  module ADExchange 
    class Allyes < Base
      
      def initialize(*args)
        config = args.shift
        @encryption_key = config.allyes[:e_key]
      end

      def decode_price(final_message)

          dec_message  = enc_to_src(final_message)
          
          enc_price,signature,impression_id = split_src dec_message

          price_pad = price_padding(impression_id)

          price  = price_xor_pads(enc_price,price_pad)

          price.to_f  
      end

      def split_src(src)
        enc_price = src[0,8]
        signature = src[8,4]
        impression_id = src[12..-1]
        [enc_price,signature,impression_id]
      end


      def price_xor_pads(p1, p2)
        p1.unpack('C*').zip(p2.unpack('C*')).map { |a,b| a^b }.pack('C*')
      end


    end # class Allyes
  end #module ADExchange
end #module Rtbdecode