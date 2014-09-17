module HippoXmlParser
  class Body < Node
    def content
      fetch('hippostd:content')
    end

    def to_s
      content
    end
  end
end