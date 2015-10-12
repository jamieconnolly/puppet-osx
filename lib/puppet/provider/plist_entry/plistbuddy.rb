Puppet::Type.type(:plist_entry).provide(:plistbuddy) do
  commands :plistbuddy => '/usr/libexec/PlistBuddy'

  def create
    begin
      plistbuddy('-c', "Set :#{@resource[:key]} #{@resource[:type]} #{@resource[:value]}", @resource[:path])
    rescue Exception => e
      false
    end
  end

  def destroy
    begin
      plistbuddy('-c', "Delete :#{@resource[:key]}", @resource[:path])
    rescue Exception => e
      false
    end
  end

  def exists?
    begin
      value = plistbuddy('-c', "Print :#{@resource[:key]}", @resource[:path]).strip

      case resource[:type]
      when :bool, :boolean
        case value
        when true, 'true'
          [true, 'true'].include?(value.to_s) ? true : false
        when false, 'false'
          [false, 'false'].include?(value.to_s) ? true : false
        end
      when :float
        @resource[:value].to_f == value.to_f
      when :int, :integer
        @resource[:value].to_i == value.to_i
      when :string
        @resource[:value].to_s == value.to_s
      end
    rescue Exception => e
      # A bad return value from plistbuddy indicates that the key does not exist.
      false
    end
  end
end
