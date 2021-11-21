# frozen_string_literal: true

class Parser
  def parse(data)
    hash = {}

    data.collect do |i|
      key = extract_page(i)
      value = extract_ip_address(i)

      if hash.key?(key)
        hash[key].push(value)
      else
        hash[key] = [value]
      end
    end

    hash
  end

  def parse_to_str(data)
    arr = []
    data.collect do |k, v|
      arr.push("/#{replace_underscore(k)} #{v}")
    end
    arr
  end

  private

  def replace_underscore(str)
    str.gsub('__', '_') if str.include?('__')
    str.gsub('_', '/')
  end

  def extract_page(str)
    regex_page = %r{\b((\w\w+)((/))?)*(\d)?}
    page = regex_page.match(str)
    replace_slash(page[0])
  end

  def replace_slash(str)
    str.gsub('_', '__') if str.include?('_')
    str.gsub('/', '_')
  end

  def extract_ip_address(str)
    regex = /\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/
    str[regex, 0]
  end
end
