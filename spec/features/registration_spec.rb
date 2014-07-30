require "spec_helper"

feature "Registration and authentication" do
  scenario "A user registers and signs in in" do
    visit "/"

    click_link "Register"

    click_button "Register"

    expect(page).to have_content "Username is required"
    expect(page).to have_content "Password is required"

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "t0p"
    click_button "Register"

    expect(page).to have_content "Password must be at least 4 characters"

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "t0psecret"
    click_button "Register"

    expect(page).to have_content "Thanks for registering"

    click_button "Sign In"

    expect(page).to have_content "Username is required, Password is required"
    fill_in "Username", with: "hoonta"
    click_button "Sign In"

    expect(page).to have_content "Password is required"

    fill_in "Password", with: "hoonta"
    click_button "Sign In"

    expect(page).to have_content "Username is required"

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "t0psecret"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hoonta"

    click_button "Sign Out"

    expect(page).to have_no_content "Welcome"
  end

  scenario "User cannot to register with an existing email" do
    visit "/"

    click_link "Register"

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "t0psecret"
    click_button "Register"

    expect(page).to have_content "Thanks for registering"

    click_link "Register"

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "thepazzword"
    click_button "Register"

    expect(page).to have_content "Username has already been taken"
  end
end
