require 'spec_helper'

describe Comment do
  
  context "is invalid" do
    [:guest_name, :content].each do |attr|
      it "when #{attr} is blank." do
        subject.valid?
        expect(subject.errors[attr]).to include "can't be blank"
      end
    end
  end
end
