require "issa_wrap/version"

module IssaWrap
  class Error < StandardError; end
  class Wrapper
    def self.wrap(string, column)
      return "" if string.nil? || string.empty?
      return string if string.length <= column

      where_to_break = string[0...column].index(" ") || column
      wrapped = string[0...where_to_break]
      remainder = string[where_to_break..-1] || ""
      (wrapped + "\n" + wrap(remainder.strip, column)).strip
    end
  end
end
