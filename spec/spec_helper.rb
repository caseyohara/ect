$:.unshift(File.join(File.dirname(__FILE__), '../../lib'))
require 'ect'

def Extend(obj)
  return obj.extend(Etc)
end
