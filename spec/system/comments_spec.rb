require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @tweet = FactoryBot.create(:tweets)
    @comment = Faker::Lolem.sentence
  end

  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email' , wirh: @tweet.user.email
    fill_in 'Password', with: @tweett.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # ツイート詳細ページに遷移する
    visit tweet_path(@tweet)
    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentsモデルのカウントが1上がる事を確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Commnt.count} .by(1)
    # 詳細ページにリダイレクトされる事を確認する
    expect(current_path).to eq tweet_path(@tweet)
    # 詳細ページ上に先程のコメント内容が含まれている事を確認する
    expect(page).to have_content @comment
  end
  
end
