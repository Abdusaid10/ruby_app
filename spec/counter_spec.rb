# frozen_string_literal: true

require_relative '../lib/counter'

describe Counter do
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

  it 'should return most pages views' do
    expect(Counter.most_page_views(parsed)).to eql(msv)
  end
end
