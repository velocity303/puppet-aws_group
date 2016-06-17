Puppet::Type.newtype :awsgroup, :is_capability => true do
  newparam :name, :is_namevar => true
end
