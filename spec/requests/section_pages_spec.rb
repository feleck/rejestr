require 'spec_helper'

describe "Section Pages" do
  
  subject { page }

  describe 'section index page' do
    before { visit sections_path }

    it { should have_content('Sections') }
    it { should have_title('Sections') }

  end

  describe 'section page' do
    let(:section) { FactoryGirl.create(:section) }
    before { visit section_path(section) }

    it { should have_content(section.long_name) }
    it { should have_content(section.short_name) }    
  end
end
