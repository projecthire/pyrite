feature 'Admin login' do
  with_subdomain :admin do
    scenario 'Admin can login' do
      admin = create(:admin)

      visit new_admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'Log in'

      expect(page).to have_text 'projectHire Admin'
    end

    scenario 'Candidate cannot login' do
      candidate = create(:candidate)

      visit new_admin_session_path
      fill_in 'admin[email]', with: candidate.email
      fill_in 'admin[password]', with: candidate.password
      click_button 'Log in'

      expect(page).not_to have_text 'projectHire Admin'
    end
  end
end
