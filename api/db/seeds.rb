root = Rails.root.join('storage')

item = Item.new({ title: 'Lâmpadas', image: 'lampadas.svg' })
item.image.attach(io: File.open("#{root}/lampadas.svg"), filename: 'lampadas.svg')
item.save!
item = Item.new({ title: 'Pilhas e Baterias', image: 'baterias.svg' })
item.image.attach(io: File.open("#{root}/baterias.svg"), filename: 'baterias.svg')
item.save!
item = Item.new({ title: 'Papéis e Papelão', image: 'papeis-papelao.svg' })
item.image.attach(io: File.open("#{root}/papeis-papelao.svg"), filename: 'papeis-papelao.svg')
item.save!
item = Item.new({ title: 'Resíduos Eletrônicos', image: 'eletronicos.svg' })
item.image.attach(io: File.open("#{root}/eletronicos.svg"), filename: 'eletronicos.svg')
item.save!
item = Item.new({ title: 'Resíduos Orgânicos', image: 'organicos.svg' })
item.image.attach(io: File.open("#{root}/organicos.svg"), filename: 'organicos.svg')
item.save!
item = Item.new({ title: 'Óleo de Cozinha', image: 'oleo.svg' })
item.image.attach(io: File.open("#{root}/oleo.svg"), filename: 'oleo.svg')
item.save!