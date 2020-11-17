class UserInfo
  include PageObject
  include DataMagic
  include ::RSpec::Matchers

  #pageobjects
  label(:lbl_firstName, text: 'First Name')
  label(:lbl_middleName, text: 'Middle Name')
  label(:lbl_lastName, text: 'Last Name')
  label(:lbl_userName, text: 'Username')
  label(:lbl_emailAddress, text: 'Email Address')
  label(:lbl_url, text: 'URL')
  label(:lbl_company, text: 'Company')
  label(:lbl_bio, text: 'Bio')
  button(:btn_updateProfile, class: 'mat-focus-indicator mat-raised-button mat-button-base mat-primary')

  def initialize_page
    DataMagic.load('userInfo.yml')
    assign_textboxes
  end

  def perform_user_action_on_field(_user, _action, _fields)
    wait_for_page_load
    case _action
    when 'Edits'
      update_user_info(_user, _fields)
    end
    _is_button_disabled = false
    @browser.wait_until(10, _is_button_disabled) do
      _is_button_disabled = evaluate_if_button_is_enabled
    end
    btn_updateProfile_element.click
  end

  def update_user_info(_user, _fields)
    @@_user_info = data_for(_user)
    case _fields
    when 'all'
      @firstName_element.clear
      @middleName_element.clear
      @lastName_element.clear
      @url_element.clear
      @company_element.clear
      @bio_element.clear

      @firstName_element.send_keys(@@_user_info['txt_firtstName'])
      @middleName_element.send_keys(@@_user_info['txt_middleName'])
      @lastName_element.send_keys(@@_user_info['txt_lastName'])
      @url_element.send_keys(@@_user_info['txt_url'])
      @company_element.send_keys(@@_user_info['txt_company'])
      @bio_element.send_keys(@@_user_info['txt_bio'])
    end
  end

  def verify_information_is_updated
    assign_textboxes
    wait_until(10, btn_updateProfile_element.attribute('disabled'))
    expect(@firstName_element.value).to eq @@_user_info['txt_firtstName']
    expect(@middleName_element.value).to eq @@_user_info['txt_middleName']
    expect(@lastName_element.value).to eq @@_user_info['txt_lastName']
    expect(@url_element.value).to eq @@_user_info['txt_url']
    expect(@company_element.value).to eq @@_user_info['txt_company']
  end

  def assign_textboxes
    @firstName_element = browser.text_field(id: lbl_firstName_element.for)
    @middleName_element = browser.text_field(id: lbl_middleName_element.for)
    @lastName_element = browser.text_field(id: lbl_lastName_element.for)
    @userName_element = browser.text_field(id: lbl_userName_element.for)
    @emailAddress_element = browser.text_field(id: lbl_emailAddress_element.for)
    @url_element = browser.text_field(id: lbl_url_element.for)
    @company_element = browser.text_field(id: lbl_company_element.for)
    @bio_element = browser.textarea(id: lbl_bio_element.for)

  end

  def evaluate_if_button_is_enabled
    btn_updateProfile_element.focus
    _is_button_disabled = btn_updateProfile_element.attribute('disabled')
    sleep 1
    case _is_button_disabled
    when nil
      return true
    when true
      return false
    end

  end

  def wait_for_page_load
    btn_updateProfile_element.wait_until_present(5)
  end

  def toggle_show_tooltips
    div_showToolTip_element.click
  end

end