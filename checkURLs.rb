require "net/http"
def url_exist?(url_string)
  url = URI.parse(url_string)
  req = Net::HTTP.new(url.host, url.port)
  req.use_ssl = (url.scheme == 'https')
#  path = url.path if url.path.present?
  path = url.path
  res = req.request_head(path || '/')
  if res.kind_of?(Net::HTTPRedirection)
    url_exist?(res['location']) # Go after any redirect and make sure you can access the redirected URL
  else
    ! %W(4 5).include?(res.code[0]) # Not from 4xx or 5xx families
  end
rescue Errno::ENOENT
  false #false if can't find the server
end
re = Regexp.new("\.html$") # asciidoc source file

dir = Dir.new('.')
dir.each  {|fn|
    if ( fn =~ re ) then
        print "----------------------------------\n"
        print "asciidoc source : " + fn + "\n"
        paths = []
        # find all urls anywhere
        File.open(fn) { |f|
            content = f.read
            paths = content.scan(/http[s]:\/\/[^\["\n]*/)
#            paths = content.scan(/image::?([^\[ ]+)\[/)
        }
        paths.flatten.each {|path|
            print "Checking " + path  + "\n"
            print (url_exist?(path) ? " OK " : " NOK ") + path + "\n"
        }
    end
}
