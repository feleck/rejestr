require 'spec_helper'

describe Section do
  before { @section = Section.new(long_name: 'Administracji', short_name: 'ad') }

  subject { @section }

  it { should respond_to(:long_name) }
  it { should respond_to(:short_name) }

  it { should be_valid }

  describe 'when long_name is not present' do
    before { @section.long_name = "" }
    it { should_not be_valid }
  end

  describe 'when short_name is not present' do
    before { @section.short_name = "" }
    it { should_not be_valid }
  end

  describe 'when short_name is too short or too long' do
    before { @section.short_name = "a" || @section.short_name = "a" * 4 } 
    it { should_not be_valid }
  end

  describe 'when long_name is too long' do
    before { @section.long_name = "a" * 31 }
    it { should_not be_valid }
  end

 describe "when long_name is already taken" do
    before do
      section_dup = @section.dup
      section_dup.long_name = @section.long_name.upcase      
      section_dup.save
    end

    it { should_not be_valid }
  end

  describe "when short_name is already taken" do
    before do
      section_dup = @section.dup
      section_dup.short_name = @section.short_name.upcase
      section_dup.save
    end

    it { should_not be_valid }
  end

end


