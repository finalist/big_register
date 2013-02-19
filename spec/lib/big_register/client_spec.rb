require 'spec_helper'

module BIGRegister

  describe Client do


    before(:each) do
      @client = Client.new
    end

    context "#list_hcp" do
      it "should return a list of healthcare practitioners", :vcr => true do
        # http://nl.wikipedia.org/wiki/Robert_Schoemacher
        result = @client.list_hcp("R.", "Schoemacher", "M","")
        result.size.should be > 0
      end

      it "should return an empty list", :vcr => true do
        # http://www.bigregister.nl/ernstjansensteur.aspx
        result = @client.list_hcp("E.N.H.", "Jansen", "M", "")
        result.size.should be(0)
      end

      it "returns an array when size == 1", :vcr => true do
        result = @client.list_hcp("R.", "Schoemacher", "M", "")
        result.size.should be(1)
        result.class.should eql Array
      end

      it "only returns doctors in the category 'Artsen' (code: 01)", :vcr => true do
        result = @client.list_hcp("J.", "Janssen", "M", "")
        result.each do |doctor|
          doctor[:article_registration][:article_registration_ext_app][:professional_group_code].should eql "01"
        end
      end
    end

    context "#find_by_big_number", :vcr => true do
      it "returns a health care practitioner with an existing big number (29021600101)" do
        result = @client.find_by_big_number("29021600101")
        result[:mailing_name].should eql "A.M. den Hollander"
      end
    end

  end
end
