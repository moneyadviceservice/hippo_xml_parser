require 'spec_helper'

describe HippoXmlParser do
  describe 'parsing' do
    let(:xml) { File.read('spec/fixtures/example.xml') }
    let(:parsed) { HippoXmlParser.parse(xml) }
    let(:body)   { %q(&lt;html&gt;&lt;body&gt;&lt;p class="intro"&gt;&lt;img src="/borrowing/do-you-need-to-borrow-money.jpg/do-you-need-to-borrow-money.jpg/hippogallery:original"/&gt;Before
you sign up for a credit card, bank loan or store card, or add to an existing
card or loan it makes sense to think about whether you really need to borrow
money.&lt;/body&gt;&lt;/html&gt;) }

    subject   { parsed.first }
    it 'parses the example' do
      expect(parsed.size).to eql(1)
    end

    it 'has all the right attributes' do
      expect(subject.id).to               eql('do-you-need-to-borrow-money')
      expect(subject.title).to            eql('Do you need to borrow money?')
      expect(subject.preview).to          eql('Planning a big purchase or need some extra cash? Borrowing might seem like the obvious solution but there could be a better option')
      expect(subject.state).to            eql('published')
      expect(subject.created_at.to_s).to  eql('2012-05-31 10:14:35 UTC')
      expect(subject.created_by).to       eql('julian')
      expect(subject.updated_at.to_s).to  eql('2014-05-27 11:16:32 UTC')
      expect(subject.updated_by).to       eql('jlaney')
      expect(subject.locale).to           eql('en')
      expect(subject.body).to             eql(body)
      expect(subject.meta_description).to eql(nil)
      expect(subject.title_tag).to        eql(nil)
      expect(subject.translation_id).to   eql('7aa69e4e-1033-4e33-a625-bffadedfda64')
    end
  end
end
