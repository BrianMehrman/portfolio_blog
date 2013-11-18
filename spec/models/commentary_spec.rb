require 'spec_helper'

describe Commentary do 
  context "is invalid" do
    [:comment_id, :post_id].each do |attr|
      it "when #{attr} is blank." do
        subject.valid?
        expect(subject.errors[attr]).to include "can't be blank"
      end
    end
  end
end