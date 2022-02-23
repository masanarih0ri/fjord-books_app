# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'テスト駆動開発'
    fill_in 'メモ', with: '読みたい'
    fill_in '著者', with: '和田卓人'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'テスト駆動開発'
    assert_text '読みたい'
    assert_text '和田卓人'
  end

  test 'updating a Book' do
    visit edit_book_path(@book)

    fill_in 'タイトル', with: 'プロを目指す人のためのRuby入門!!'
    fill_in 'メモ', with: 'とてもためになります！'
    click_on '更新する'

    assert_text '本が更新されました。'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
