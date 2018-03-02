require 'rails_helper'

feature 'User can see homepage' do
  context 'with posts' do
    scenario 'sucessfully' do
      post = create(:post)

      visit root_path

      expect(page).to have_css("#post_#{post.id} p", text: post.text)
      expect(page).to have_css("#post_#{post.id} p", text: post.name)
    end

    scenario 'but no' do
      visit root_path

      expect(page).to have_css('p.lead', text: 'Nenhum post feito!')
    end
  end

  context 'new post link' do
    scenario 'there is one' do
      visit root_path

      expect(page).to have_link('Criar um post', href: new_post_path)
    end
  end
end
