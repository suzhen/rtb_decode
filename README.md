# RtbDecode

TODO: 国内各RTB平台，价格解密。

## Installation

Add this line to your application's Gemfile:

    gem 'rtb_decode'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rtb_decode

## Usage

require "rtb_decode"

#allyes(好耶) gadx(google) tanx(淘宝)
config = Rtbdecode::Config.new :allyes=>{:e_key=>"831ebf0215521168da8022925b4ffa9e"},
                               :gadx=>{:e_key=>"1usin5bwZLBY8OZt/dtLUMTYa+JO+JtbuPwPYatkfh4="},
                               :tanx=>{:e_key=>"f7dbeb735b7a07f1cfca79cc1dfe4fa4"}

rtb0 = Rtbdecode::ADExchange::Allyes.new config
  
rtb0.decode_price("N0gm69cnsMkeRa7UMTM5MjM2MjQwMTE3ODkwOTQ2OTEyNjAxMDE2NjQw!")

rtb1 = Rtbdecode::ADExchange::Gadx.new config
  
rtb1.decode_price("T0ypIgALCQQK4qYHWmBPUjOzcMHUuumeVIPa8Q")

rtb2 = Rtbdecode::ADExchange::Tanx.new config
  
rtb2.decode_price("AbuI6wqbQlBm2UUAAAEAAADaQPIFMFCbeQ%3D%3D")

## Contributing

1. Fork it ( http://github.com/suzhen/rtb_decode/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
