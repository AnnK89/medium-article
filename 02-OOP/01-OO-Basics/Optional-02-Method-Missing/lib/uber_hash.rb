class UberHash
  def method_missing(method_sym, *args, &block)
    if method_sym[-1] == "="
      instance_variable_set("@#{method_sym[0..-2]}", args[0])
    else
      instance_variable_get("@#{method_sym}")
    end
  end
end
