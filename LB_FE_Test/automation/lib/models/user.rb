
class User
  attr_accessor :firstName, :middleName, :lastName, :email, :url, :company, :bio

  def self.generate_from_response(_response)
    _user = User.new
    _user.firstName = _response['firstName']
    _user.middleName = _response['middleName']
    _user.lastName = _response['lastName']
    _user.email = _response['email']
    _user.url = _response['url']
    _user.company = _response['company']
    _user.bio = _response['bio']
    _user
  end
end
