require 'spec_helper'

describe CategorizedPost do
  context "is invalid" do
    [:category_id, :post_id].each do |attr|
      it "when #{attr} is blank." do
        subject.valid?
        expect(subject.errors[attr]).to include "can't be blank"
      end
    end
  end
end