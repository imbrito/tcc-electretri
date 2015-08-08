require 'rails_helper'

RSpec.describe "home/team.html.haml", type: :view do
  it"visit home#team" do
    render
  	expect(rendered).to have_content("Kíssila da Silva Ventura
    Bacharelanda em Sistemas de Informação
  	Ismael Moreira de Brito
    Bacharelando em Sistemas de Informação
  	Vinicius Barcelos da Silva
    Tecnólogo em Análise e Desenvolvimento de Sistemas
    Bacharel em Sistemas de Informação
    Mestre em Engenharia de Produção")
  end
end
