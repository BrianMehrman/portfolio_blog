require 'spec_helper'

describe Category do
  context "is invalid" do
    [:name].each do |attr|
      it "when #{attr} is blank." do
        subject.valid?
        expect(subject.errors[attr]).to include "can't be blank"
      end
    end
  end
end
