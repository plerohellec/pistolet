class Membre < ActiveRecord::Base
  def full_name
    "#{prenom} #{nom}"
  end
end
