require "rspec"
require_relative "../lib/PasswordChecker"



describe PasswordChecker do

  subject {PasswordChecker.new}

  describe "#check_password" do
    it "requires length of 7 or more" do
      expect(subject.check_password("john@ironhack.com","1234")).to eq(false)
    end

    it "requires length of 7 or more" do
      expect(subject.check_password("john@ironhack.com", "12345678@%^&*eE")).to eq(true)
    end

    it "requires that at least 1 letter, 1 number and 1 symbol (e.g. #, %, etc)" do
      expect(subject.check_password("john@ironhack.com", "Hhello1234567")).to eq(false)
    end

    it "requires that at least 1 letter, 1 number and 1 symbol (e.g. #, %, etc)" do
      expect(subject.check_password("john@ironhack.com", "Hello1234567@%&")).to eq(true)
    end

    it "at least 1 uppercase and 1 lowercase letter" do
      expect(subject.check_password("john@ironhack.com", "hello1234567$@}")).to eq(false)
    end

    it "at least 1 uppercase and 1 lowercase letter" do
      expect(subject.check_password("john@ironhack.com", "hello1234567$@}H")).to eq(true)
    end

    it "NOT contain neither the name nor the domain of the email" do
      expect(subject.check_password("john@ironhack.com", "Hhello1234567%ironhack")).to eq(false)
    end

  end
end
