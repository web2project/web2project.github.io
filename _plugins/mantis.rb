module Jekyll
  module MantisFilter
    def mantis(input)
      output = ""
      unless input.nil?
          output = output + '<a href="http://bugs.web2project.net/view.php?id=' + input.to_s + '" target="_new">' + input.to_s + '</a>'
      end

      output
    end
  end
end

Liquid::Template.register_filter(Jekyll::MantisFilter)