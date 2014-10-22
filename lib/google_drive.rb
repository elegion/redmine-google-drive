require "redmine"

# Google Drive plugin module.
module GoogleDrive
  unloadable

  # Google Drive plugin macros.
  class Macros
    def self.base_url
      "https://drive.google.com"
    end

    def self.embed_file(args)
      key = args[0]
      domain = args.length == 2 ? args[1].strip : nil
      height = args.length == 3 ? args[2].to_i : 600
      url = "#{base_url}/#{domain_part(domain)}/file/d/#{key}/view"
      style = "width: 100%; height: #{height}px;"
      %(<iframe src="#{url}" style="#{style}"></iframe>).html_safe
    end

    def self.domain_part(domain)
      if domain.nil? || domain == "nil"
        ""
      else
        "a/#{domain}"
      end
    end
  end
end
