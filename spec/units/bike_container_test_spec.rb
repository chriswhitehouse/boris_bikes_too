require File.dirname(__FILE__) + '/../support/shared_examples_for_bike_container.rb'

class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  it_behaves_like BikeContainer
end
