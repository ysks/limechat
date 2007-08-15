# Created by Satoshi Nakagawa.
# You can redistribute it and/or modify it under the Ruby's license or the GPL2.

class SingleLineFormatter < OSX::NSFormatter
  include OSX
  
  def stringForObjectValue(str)
    str.to_s.gsub(/\r\n|\r|\n/, ' ')
  end
  
  #objc_method :getObjectValue_forString_errorDescription, 'c@:^@@^@'
  def getObjectValue_forString_errorDescription(objp, str, err)
    s = str.to_s.gsub(/\r\n|\r|\n/, ' ')
    objp.assign(NSString.stringWithString(s))
    true
  end
  
  #objc_method :isPartialStringValid_newEditingString_errorDescription, 'c@:@^@^@'
  def isPartialStringValid_newEditingString_errorDescription(str, strp, err)
    s = str.to_s
    return true unless s =~ /\r\n|\r|\n/
    s = s.gsub(/\r\n|\r|\n/, ' ')
    strp.assign(NSString.stringWithString(s))
    false
  end
end
