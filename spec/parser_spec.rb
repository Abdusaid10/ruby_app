# frozen_string_literal: true

require_relative '../lib/parser'

describe Parser do # rubocop:disable Metrics/BlockLength
  p = Parser.new
  subject { p }

  let(:arr) do
    [
      "/help_page/1 126.318.035.038\n",
      "/contact 184.123.665.067\n",
      "/home 184.123.665.067\n",
      "/about/2 444.701.448.104\n",
      "/help_page/1 929.398.951.889\n",
      "/index 444.701.448.104\n",
      "/help_page/1 722.247.931.582\n",
      "/about 061.945.150.735\n",
      "/help_page/1 646.865.545.408\n",
      "/home 235.313.352.950\n",
      "/contact 184.123.665.067\n",
      "/help_page/1 543.910.244.929\n"
    ]
  end
  let(:parsed) do
    {
      'help_page_1' => [
        '126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408', '543.910.244.929'
      ],
      'contact' => ['184.123.665.067', '184.123.665.067'],
      'home' => ['184.123.665.067', '235.313.352.950'],
      'about_2' => ['444.701.448.104'],
      'index' => ['444.701.448.104'],
      'about' => ['061.945.150.735']
    }
  end
  let(:msv) { { 'help_page_1' => 5, 'home' => 2, 'contact' => 2, 'about' => 1, 'index' => 1, 'about_2' => 1 } }

  describe '#extraction' do
    str = '/help_page/1 126.318.035.038'

    it 'should extract page name and replace slashes with underscore' do
      expect(p.send(:extract_page, str)).to eql('help_page_1')
    end

    it 'should extract ip address' do
      expect(p.send(:extract_ip_address, str)).to eql('126.318.035.038')
    end
  end

  it 'should parse to hash' do
    expect(p.parse(arr)).to eql(parsed)
  end

  it 'should return an array of strings with the most viewed pages' do
    views_h = { 'help_page_1' => 5, 'home' => 2, 'contact' => 2, 'about' => 1, 'index' => 1, 'about_2' => 1 }
    views_a = ['/help/page/1 5', '/home 2', '/contact 2', '/about 1', '/index 1', '/about/2 1']
    expect(p.parse_to_str(views_h)).to eql(views_a)
  end
end
