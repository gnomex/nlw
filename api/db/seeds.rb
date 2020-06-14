root = Rails.root.join('storage')

[
  { title: 'Lâmpadas', image: 'lampadas.svg' },
  { title: 'Pilhas e Baterias', image: 'baterias.svg' },
  { title: 'Papéis e Papelão', image: 'papeis-papelao.svg' },
  { title: 'Resíduos Eletrônicos', image: 'eletronicos.svg' },
  { title: 'Resíduos Orgânicos', image: 'organicos.svg' },
  { title: 'Óleo de Cozinha', image: 'oleo.svg' }
].each do |item|
  r = Item.new(item)
  r.image.attach(
    io: File.open("#{root}/#{item[:image]}"), 
    filename: item[:image]
  )
  r.save!
end
