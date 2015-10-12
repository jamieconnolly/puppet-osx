Puppet::Type.newtype(:plist_entry) do
  ensurable

  newparam(:key, :namevar => true) do
    desc "The name of the key for which we're ensuring absent/present"
  end

  newparam(:path) do
    desc "The path of the plist file"
  end

  newparam(:type) do
    desc "The value type for the plist key's value"

    defaultto :string
    newvalues(:string, :int, :integer, :float, :bool, :boolean)
  end

  newparam(:value) do
    desc "The value of the specified key"
  end
end
