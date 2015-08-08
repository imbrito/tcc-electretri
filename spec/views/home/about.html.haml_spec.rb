require 'rails_helper'

RSpec.describe "home/about.html.haml", type: :view do
  it "visit home#about" do
  	render
  	expect(rendered).to have_content ("O objetivo principal deste trabalho é modelar e desenvolver um sistema web implementando o algoritmo ELECTRE TRI, um dos principais algoritmos de análise multicritério baseado no conceito da classificação. Nele há critérios de avaliação que permitem definir alternativas que estarão em comparação, permitindo assim, estabelecer preferências entre as alternativas em análise, possibilitando atender as reais necessidades dos usuários que desejem classificar e ordenar alternativas no ambiente decisório multicritério, potencializar o custo benefício nas tomadas de decisão, onde dentro de uma escala e regra, o usuário poderá informar seus critérios e pesos, recebendo do sistema o indicativo da melhor opção ou classificação mediante os dados fornecidos.")
  end
end
