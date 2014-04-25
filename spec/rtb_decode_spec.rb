require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

config = Rtbdecode::Config.new :allyes=>{:e_key=>"831ebf0215521168da8022925b4ffa9e"},
                               :gadx=>{:e_key=>"1usin5bwZLBY8OZt/dtLUMTYa+JO+JtbuPwPYatkfh4="},
                               :tanx=>{:e_key=>"f7dbeb735b7a07f1cfca79cc1dfe4fa4"}

describe Rtbdecode::ADExchange::Allyes,"#decode_price" do
  
  let(:rtb0){Rtbdecode::ADExchange::Allyes.new config}
  
  it "decode price " do
    rtb0.decode_price("N0gm69cnsMkeRa7UMTM5MjM2MjQwMTE3ODkwOTQ2OTEyNjAxMDE2NjQw!").should == 0.8
  end

end

describe Rtbdecode::ADExchange::Gadx,"#decode_price" do
  
  let(:rtb1){Rtbdecode::ADExchange::Gadx.new config}
  
  it "decode price " do
    rtb1.decode_price("T0ypIgALCQQK4qYHWmBPUjOzcMHUuumeVIPa8Q").should == 470
  end

end

describe Rtbdecode::ADExchange::Tanx,"#decode_price" do
  
  let(:rtb2){Rtbdecode::ADExchange::Tanx.new config}
  
  it "decode price " do
    rtb2.decode_price("AbuI6wqbQlBm2UUAAAEAAADaQPIFMFCbeQ%3D%3D") == 121
  end

end