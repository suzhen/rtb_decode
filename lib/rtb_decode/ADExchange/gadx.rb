module Rtbdecode
  module ADExchange 
    class Gadx < Base

      def initialize(*args)
        config = args.shift
        @encryption_key = config.gadx[:e_key].unpack("m")[0]
      end

      def decode_price(final_message)

        decoded = final_message.tr("-_", "+/").unpack("m")[0]

        # split message into 3 parts: initialization vector, encrypted price and signature
        iv, p, sig = split_src decoded

        # generate padding (use first 8 bytes only)
        pad = price_padding iv

        # p XOR pad, then convert to 64-bit integer
        price = price_xor_pads(p, pad)

        price
      end

      def split_src(src)
        iv = src[0,16]
        enc_price = src[16,8]
        signature = src[24,4]
        [iv,enc_price,signature]
      end
    
      def price_xor_pads(p1, p2)
        p1s = p1.unpack("NN")
        p2s = p2.unpack("NN")
        (p1s[0] ^ p2s[0]) * 4294967296 + (p1s[1] ^ p2s[1])
      end

    end # class Gadx
  end #module ADExchange
end #module Rtbdecode
