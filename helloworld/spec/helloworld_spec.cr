require "./spec_helper"

describe Helloworld do
  # TODO: Write tests

  it "works" do
    output = Helloworld.say_hello
    output.should eq("Hello World!")
  end
end
