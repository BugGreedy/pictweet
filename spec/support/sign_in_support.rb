module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email' , with: user.Email
    fill_in 'Password', with: user.Password
    find('input[name="commit"]') .click
    expect(current_path).to eq root_path
  end
end

