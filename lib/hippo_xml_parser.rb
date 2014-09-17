require 'nokogiri'
require 'time'

require 'hippo_xml_parser/crawler'
require 'hippo_xml_parser/document'
require 'hippo_xml_parser/node'
require 'hippo_xml_parser/property'
require 'hippo_xml_parser/article'
require 'hippo_xml_parser/body'
require 'hippo_xml_parser/version'

module HippoXmlParser
  def self.parse(doc)
    Crawler.new(Nokogiri::XML(doc)).all
  end
end