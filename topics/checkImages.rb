
re = Regexp.new("\.adoc$") # asciidoc source file

dir = Dir.new('.')
dir.each  {|fn|
    if ( fn =~ re ) then
        print "----------------------------------\n"
        print "asciidoc source : " + fn + "\n"
        paths = []
        imagesDirs = [] # can be many by error => we take the last only
        imagesDir = ""
        # find all image: or image:: asciidoc macros
        File.open(fn) { |f|
            content = f.read
            imagesDirs = content.scan(/:images: (.*)/)
            paths = content.scan(/image::?([^\[ ]+)\[/)
        }
        imagesDir="images"
        # test that path is a file
        paths.flatten.each {|path|
          if (data = /({images}).*/.match(path))
            oldpath=path
            path=path.gsub("{images}",imagesDir)
            print (File.file?("images/"+path) ? " OK " : " NOK ") + oldpath + "\n"
          else
            print (File.file?("images/"+path) ? " OK " : " NOK ") + path + "\n"
          end
        }
    end
}
