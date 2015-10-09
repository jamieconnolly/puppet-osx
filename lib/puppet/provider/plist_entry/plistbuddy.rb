Puppet::Type.type(:plist_entry).provide(:plistbuddy) do
  commands :plistbuddy => '/usr/libexec/PlistBuddy'

  def create
    begin
      plistbuddy('-c', "Set :#{@resource[:entry]} #{@resource[:value]}", @resource[:path])
    rescue Exception => e
      false
    end
  end

  def destroy
    begin
      plistbuddy('-c', "Delete :#{@resource[:entry]}", @resource[:path])
    rescue Exception => e
      false
    end
  end

  def exists?
    begin
      @resource[:value].to_s == plistbuddy('-c', "Print :#{@resource[:entry]}", @resource[:path]).strip
      # @resource[:value].to_i == plistbuddy('-c', "Print :#{@resource[:entry]}", @resource[:path]).strip
    rescue Exception => e
      # A bad return value from plistbuddy indicates that the key does not exist.
      false
    end
  end
end
