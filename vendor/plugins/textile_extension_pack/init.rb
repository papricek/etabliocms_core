require 'textile_extension_pack'
RedCloth.send(:include, TextileExtensionPack::RegularExpressions)
RedCloth::Formatters::HTML.send(:include, TextileExtensionPack::Tags)
