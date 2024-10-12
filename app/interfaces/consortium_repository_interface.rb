# app/interfaces/consortium_repository_interface.rb
module ConsortiumRepositoryInterface
  def get_all_consortiums
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def get_consortium(id)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_consortium(consortium_entity)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def update_consortium(consortium, consortium_entity)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def delete_consortium(consortium)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
