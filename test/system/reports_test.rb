# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:first_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url

    click_on '新規作成'

    fill_in 'タイトル', with: '今日のタイトル'
    fill_in '内容', with: '今日の内容'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '今日のタイトル'
    assert_text '今日の内容'
  end

  test 'updating a Report' do
    visit edit_report_url(@report)

    fill_in 'タイトル', with: '1日目!!'
    fill_in '内容', with: '今日は楽しくコードを書いた！'
    click_on '更新する'

    assert_text '日報が更新されました。'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
