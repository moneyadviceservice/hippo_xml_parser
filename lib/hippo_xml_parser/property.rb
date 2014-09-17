module HippoXmlParser
  class Property
    attr_accessor :namespace, :name, :value, :doc
    def initialize(doc)
      @doc = doc
      @namespace, @name = doc["sv:name"].split(':')
      @value = doc.children.detect {|x| x.name == "value" }.children.to_s rescue nil
    end

    def [](key)
      doc[key]
    end

    def inspect
      "#<Property name=#{name.inspect} value=#{value.inspect}>"
    end
  end
end