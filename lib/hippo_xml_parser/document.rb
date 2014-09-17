module HippoXmlParser
  class Document
    attr_reader :doc, :namespace, :name
    def initialize(doc)
      @namespace, @name = doc["sv:name"].split(':')
      @doc = doc
    end

    def [](key)
      doc[key]
    end

    def type
      el.children.map do |e|
        if  e.name == "property" && e["sv:name"] == "jcr:primaryType"
          e if e.children.select {|x| x.name == "value" && x.children.to_s == name }.any?
        end
      end.flatten.compact.first
    end

    def properties
      @_properties ||= doc.children.map {|e| Property.new(e) if e.name == "property" }.compact.flatten
    end

    def nodes
      @_nodes ||= doc.children.map {|e| Node.new(e) if e.name == "node" }.compact.flatten
    end

    def find_node(name)
      nodes.find {|e| e['sv:name'] == name }
    end

    def find_property(name)
      properties.find {|e| e['sv:name'] == name }
    end

    def fetch(name)
      prop = find_property(name)
      prop ? prop.value : nil
    end
  end
end