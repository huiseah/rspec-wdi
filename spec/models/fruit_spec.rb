# == Schema Information
#
# Table name: fruits
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  type       :string(255)
#  stair_id   :integer
#

require 'spec_helper'

describe Fruit do

	it { should belong_to :stair }

	it "should be quite delicious" do
		fruit = Fruit.new(:name => 'cranberry')
		fruit.deliciousness.should == 0.9
	end

	it "should loosen your poopen" do
		fruit = Fruit.new(:name => 'prune')
		fruit.dietary_fibre.should == 0.7
	end

  describe "An apple" do
  	before do
  		@apple = Apple.create(:name => 'Apple')
  	end

  	it "should not be squishy" do
  		#these are all equivalent, use as you prefer
  		@apple.squishy?.should == false
  		@apple.squishy?.should be_false
  		@apple.squishy?.should eq(false)
  	end

  	it "should remember what class it is using Single Table Inheritance (STI)" do
  		apple = Fruit.find(@apple.id)

  		#Test if we can find our apple
  		apple.should_not be_nil
  		apple.should_not == nil
  		apple.should_not eq(nil)

  		#test if it's the right kind of fruit using the type column
  		apple.class.should == Apple
  		apple.class.should eq(Apple)

  		#test if it is actually our apple
  		apple.should == @apple
  		apple.should eq(@apple)

  		#test inheritance
  		apple.is_a?(Fruit).should be_true
  		apple.class.ancestors.should include Fruit

  	end
  end

  describe "A pear" do
  	before do
  		@pear = Pear.create(:name => 'Pear')
  	end

  	it "should be kind of squishy" do
  		@pear.squishy?.should == true
  		@pear.squishy?.should be_true
  		@pear.squishy?.should eq(true)
  	end

  	it "should remember what class it is using Single Table Inheritance (STI)" do
  		pear = Fruit.find(@pear.id)

  		#Test if we can find our pear
  		pear.should_not be_nil
  		pear.should_not == nil
  		pear.should_not eq(nil)

  		#test if it's the right kind of fruit using the type column
  		pear.class.should == Pear
  		pear.class.should eq(Pear)

  		#test if it is actually our pear
  		pear.should == @pear
  		pear.should eq(@pear)

  		#test inheritance
  		pear.is_a?(Fruit).should be_true
  		pear.class.ancestors.should include Fruit
  	end
  end
end
