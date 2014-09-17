module HippoXmlParser
  class Crawler
    TYPES = [
      'contentauthoringwebsite:Guide',
      'contentauthoringwebsite:ActionPlan',
      'contentauthoringwebsite:ToolPage',
      'contentauthoringwebsite:StaticPage',
      'contentauthoringwebsite:News'
    ]

    attr_reader :types

    def initialize(doc, types=TYPES)
      @doc = doc
      @types = types
    end

    def nodes(doc)
      doc.children.select {|e| e.name == "node" }
    end

    def type?(el, names)
      el.children.map do |e|
        if  e.name == "property" && e["sv:name"] == "jcr:primaryType"

          e if e.children.select {|x| x.name == "value" && Array(names).include?(x.children.to_s) }.any?
        end
      end.flatten.compact.first
    end


    def crawl(doc)
      if type?(doc, types)
        Article.new(doc)
      else
        doc.children.map {|e| crawl(e) }
      end
    end

    def all
      crawl( nodes(@doc).first ).flatten
    end
  end
end