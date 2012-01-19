Facter.add(:has_yum) do
  setcode do
    `which yum 2>&1`
    $?.success?
  end
end
