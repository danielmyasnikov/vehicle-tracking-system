class User < ActiveRecord::Base
  rolify
  
  has_many :subscribtions, through: :subscribers
  has_many :subscribers
  belongs_to :truck_fleet
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :approved, :subscribtion_ids, :truck_fleet_id, :admin, :role,
                  :encrypted_password, 
                  :reset_password_token, :reset_password_sent_at, :remember_created_at,
                  :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip,
                  

  def active_for_authentication? 
    super && approved? 
  end
  
  def show_alerts
    subscribtions = []
    self.subscribtion_ids.each do |s|
      subscribtions.push(Subscribtion.find(s))
    end
  end
  
  def find_subscribtions
    subscribtions = []
    self.subscribtion_ids.each do |s|
      subscribtions.push(Subscribtion.find(s))
    end
    subscribtions
  end
  
  def to_approve
    self.approved = true
    self.save!
  end

  def inactive_message 
    if !approved? 
      puts 'NOT APPROVED' 
    else 
      super # Use whatever other message 
    end 
  end

end
