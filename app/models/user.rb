class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def first_name
    self.name.split.first.oops
  end


  def last_name
    self.name.split.last
  end

def get_facebook_messages
  contacts_fb
  @messages = retrieve_messages
  rescue => e
    flash[:error] = "Error Occurred Contacting Facebook: #{e}"
end
end