class NumberSerializer < ActiveModel::Serializer
  attributes :value, :fizz_buzz, :favourite

  def favourite
    object.favourite?
  end
end
