require 'rails_helper'

feature 'User can post' do
  scenario 'sucessfully' do
    visit root_path
    click_on 'Criar um post'

    fill_in 'Texto', with: 'Macaco loco'
    fill_in 'Seu nome', with: 'Roberto'
    click_on 'Enviar post'

    expect(page).to have_css('.alert.alert-success', text: 'Post enviado')
    expect(page).to have_css('p', text: 'Macaco loco')
    expect(page).to have_css('p', text: 'Roberto')
  end

  scenario 'with missing fields' do
    visit new_post_path

    fill_in 'Texto', with: ''
    fill_in 'Seu nome', with: 'Roberto'
    click_on 'Enviar post'

    save_page

    expect(page).to have_css('.help-block', text: 'não pode ficar em branco')
  end
end
