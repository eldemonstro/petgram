require 'rails_helper'

feature 'hashtags' do
  describe 'posts create' do
    scenario 'sucessfully' do
      visit root_path
      click_on 'Criar um post'

      fill_in 'Texto', with: '#newhashtag'
      fill_in 'Seu nome', with: 'Rodrigo'
      click_on 'Enviar post'

      expect(Hashtag.last).not_to eq nil
    end

    scenario 'a lot of hashtags' do
      visit new_post_path

      fill_in 'Texto', with: '#newhashtag #oldhashtag'
      fill_in 'Seu nome', with: 'Rodrigo'
      click_on 'Enviar post'

      expect(Hashtag.all.count).to eq 2
    end

    scenario 'and use existing hashtags' do
      create(:hashtag, name: 'newhashtag')

      visit new_post_path

      fill_in 'Texto', with: '#newhashtag #oldhashtag'
      fill_in 'Seu nome', with: 'Rodrigo'
      click_on 'Enviar post'

      expect(Hashtag.all.count).to eq 2
    end
  end

  describe 'user can see' do
    scenario 'posts by hashtag' do
      post_one = create(:post, text: '#newhashtag nice')
      post_two = create(:post, text: '#newhashtag also nice')

      visit post_path(post_one)
      click_on '#newhashtag'

      expect(page).to have_content(post_one.text)
      expect(page).to have_content(post_two.text)
    end
  end
end
