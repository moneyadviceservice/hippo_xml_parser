module HippoXmlParser
  class Article < Document
    def body
      Body.new(find_node('contentauthoringwebsite:body').doc).to_s
    end

    def meta_description
      fetch('contentauthoringwebsite:meta_description')
    end

    def created_at
      Time.parse(fetch('hippostdpubwf:creationDate'))
    end

    def created_by
      fetch('hippostdpubwf:createdBy')
    end

    def updated_at
      Time.parse(fetch('hippostdpubwf:lastModificationDate'))
    end

    def updated_by
      fetch('hippostdpubwf:lastModifiedBy')
    end

    def state
      fetch('hippostd:state')
    end

    def title
      fetch('contentauthoringwebsite:title')
    end

    def title_tag
      fetch('contentauthoringwebsite:title_tag')
    end

    def preview
      fetch('contentauthoringwebsite:preview')
    end

    def id
      doc['sv:name']
    end

    def locale
      fetch('hippotranslation:locale')
    end

    def inspect
      "#<Article id=#{id} state=#{state} length=#{body.length}>"
    end
  end
end