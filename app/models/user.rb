class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :approved

  def active_for_authentication? 
    super && approved? 
  end

  def inactive_message 
    if !approved? 
      puts 'NOT APPROVED' 
    else 
      super # Use whatever other message 
    end 
  end

end
