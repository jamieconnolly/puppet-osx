Puppet::Type.newtype(:plist_entry) do
  ensurable

  newparam(:entry, :namevar => true)
  newparam(:path)
  newparam(:value)
end
