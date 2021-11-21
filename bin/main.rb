# frozen_string_literal: true

require_relative '../lib/parser'
require_relative '../lib/counter'

class Main
  class EmptyFile < StandardError; end

  class NotExist < StandardError; end

  def main
    puts '********** Page view count **********\n'
    puts 'Enter the path to the log file:'

    file = gets.chomp
    arr = read_file(file)
    parsed_hash = Parser.new.parse(arr)

    puts "Press 'm' to get most pages views"
    puts "Press 'u' to get uniques pages views"
    input = gets.chomp
    views_h = get_views(input, parsed_hash)

    views_arr = Parser.new.parse_to_str(views_h)

    display_views(views_arr, input)
  end

  private

  def display_views(arr, input)
    0..arr.length.times { |i| input == 'm' ? (puts "#{arr[i]} visits") : (puts "#{arr[i]} unique views") }
  end

  def read_file(file)
    arr = []
    begin
      raise NotExist.new, "File #{file} not found!" unless File.exist?(file)
      raise EmptyFile.new, "File #{file} is empty!" if File.zero?(file)
      File.open(file.to_s, 'r').each { |line| arr.push(line) }
      arr
    rescue NotExist => e
      puts e.message
      raise
    rescue EmptyFile => e
      puts e.message
      raise
    end
  end

  def get_views(input, parsed_hash)
    case input
    when 'm'
      Counter.most_page_views(parsed_hash)
    when 'u'
      Counter.unique_most_page_views(parsed_hash)
    end
  end
end

Main.new.main
