# Based on https://github.com/evolvingweb/redmine_google_docs
require "redmine"

require File.join(File.dirname(__FILE__), "lib", "google_drive.rb")

Redmine::Plugin.register :redmine_google_drive do
  name "Google Drive Plugin"
  author "e-Legion"
  description "Allows you to embed documents in your wiki pages."
  version "0.0.1"

  Redmine::WikiFormatting::Macros.register do
    desc "Embed file from Google Drive"
    macro :google_drive_file do |_, args|
      GoogleDrive::Macros.embed_file(args)
    end
  end
end
