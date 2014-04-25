module Rtbdecode
  module ADExchange 
    class Tanx < Base
 
      def initialize(*args)
        config = args.shift
        @encryption_key = str_to_ascii config.tanx[:e_key]
      end

      def decode_price(final_message)
         dec_message = enc_to_src(final_message)

         version,bidid,enc_price,crc = split_src dec_message

         md5  = str_to_ascii price_padding(bidid+encryption_key)

         price = price_xor_pads enc_price,md5

         to_int("%032d" % price.to_s(2))
      end
 
      def split_src(src)
        version = src[0]
        bidid = src[1,16]
        enc_price = src[17,4]
        crc = src[21,4]
        [version,bidid,enc_price,crc]
      end

      def price_padding(p_settle)
        Digest::MD5.hexdigest(p_settle)
      end

      def price_xor_pads(p1, p2)
        p1.unpack("b*").first.to_i(2) ^ p2[0..3].unpack("b*").first.to_i(2)
      end

      def to_int(bit_32)
        bit_32 = bit_32.reverse
        bit_32.to_i(2)
      end
      
    end # class Tanx
  end #module ADExchange
end #module Rtbdecode