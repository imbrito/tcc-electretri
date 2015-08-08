require 'rails_helper'

RSpec.describe "home/index.html.haml", type: :view do
  it "visit home#index" do 
  	render
  	expect(rendered).to have_content ("Sistema Web de Apoio à Decisão Multicritério, Baseado no Algoritmo ELECTRE TRI")
  end
end
