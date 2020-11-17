class LoginPage

  include PageObject
  include DataMagic

  #Page Objects
  text_field(:txt_username, id:'signInFormUsername', visible:true, index: -1)
  text_field(:txt_password, id:'signInFormPassword', visible:true, index: -1)
  button(:btn_signIn, name:'signInSubmitButton', visible:true, index: -1)
  a(:anchor_SingUp, text:/Sign up/,visible:true,index: -1)



  def initialize_page
    txt_username_element.wait_until_present(5)
    DataMagic.load('userlogins.yml')
  end

  def login_as_user(_user)
    populate_page_with data_for(_user)
    btn_signIn_element.click
  end

end