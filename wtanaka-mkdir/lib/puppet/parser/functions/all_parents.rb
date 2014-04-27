# Copyright 2014 Wesley Tanaka <http://wtanaka.com/>
# Custom function to work around lack of recurive directory creation
# in early versions of Puppet
module Puppet::Parser::Functions
   newfunction(:all_parents, :type => :rvalue) do |args|
      output = []
      path = args[0]
      if path == '/' or path == '' or path == '.'
         return output
      end
      path = File.dirname(path)
      until path == '/' or path == '' or path == '.'
         output.push(path)
         path = File.dirname(path)
      end
      return output.reverse
   end
end
