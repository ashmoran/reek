
module Reek

  #
  # Reports a warning that a smell has been found.
  #
  class SmellWarning

    include Comparable

    CONTEXT_KEY = 'context'

    def initialize(class_name, context, lines, message, masked,
        source = '', subclass_name = '', parameters = {})
      @smell = {
        'class' => class_name,
        'subclass' => subclass_name,
        'message' => message,
      }
      @smell.merge!(parameters)
      @is_masked = masked
      @location = {
        CONTEXT_KEY => context,
        'lines' => lines,
        'source' => source
      }
    end

    def hash  # :nodoc:
      sort_key.hash
    end

    def <=>(other)
      sort_key <=> other.sort_key
    end

    def eql?(other)
      (self <=> other) == 0
    end

    def contains_all?(patterns)
      rpt = sort_key.to_s
      return patterns.all? {|patt| patt === rpt}
    end

    def matches?(klass, patterns)
      @smell.values.include?(klass.to_s) and contains_all?(patterns)
    end

    def sort_key
      [@location[CONTEXT_KEY], @smell['message'], smell_name]
    end

    protected :sort_key

    def report(format)
      format.gsub(/\%s/, smell_name).
        gsub(/\%c/, @location[CONTEXT_KEY]).
        gsub(/\%w/, @smell['message']).
        gsub(/\%m/, @is_masked ? '(masked) ' : '')
    end

    def report_on(report)
      if @is_masked
        report.found_masked_smell(self)
      else
        report.found_smell(self)
      end
    end

    def smell_name
      @smell['class'].gsub(/([a-z])([A-Z])/) { |sub| "#{$1} #{$2}"}.split.join(' ')
    end
  end
end
