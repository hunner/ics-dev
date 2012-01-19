ENV.each do |k, v|
  Facter.add("env_" + k) do
    setcode do
      v
    end
  end
end
