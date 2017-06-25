module RandomCalcUploaderable
  extend ActiveSupport::Concern

  def random_string(mode, size)
    case mode
    when :alpha
      out = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    when :numeric
      out = [(0..9)].map(&:to_a).flatten
    when :uniqid
      out = [('a'..'z'), (0..9)].map(&:to_a).flatten
    end
    prng = Random.new(secure_token.delete('-').to_i(16))
    Array.new(size) { out[prng.rand(out.length)] }.join
  end

  # ランダムのseedを作る
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
