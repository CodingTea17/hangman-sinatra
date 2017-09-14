require('rspec')
require('hangman')

describe(Game)
  describe("") do
    it("take user input of first name") do
      test_contact = Contact.new({:first_name=>"Karla",:last_name=>"Buckner",:company=>"Epicodus",:job_title=>"Student",:contact_type=>"Professional"})
      expect(test_contact.first_name).to(eq("Karla"))
    end
  end
