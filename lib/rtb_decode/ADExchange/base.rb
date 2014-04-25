module Rtbdecode
  module ADExchange 
    class Base
      attr_reader :encryption_key

      #encryption 加密
      #src 原始密文
      def enc_to_src(origin_code)
        base_str = URI.unescape(origin_code)
        return Base64.decode64(base_str)
      end

      def price_padding(vector)
        OpenSSL::HMAC.digest("SHA1", encryption_key, vector)[0, 8]
      end

      def str_to_ascii(str)
        hexarr = Array.new 
        str.chars().each_slice(2) { |tmp| hexarr<<(tmp[0]+tmp[1]).hex.chr }
        hexarr.join()
      end

    end # class Base
  end #module ADExchange
end #module Rtbdecode