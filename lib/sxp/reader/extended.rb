module SXP; class Reader
  ##
  # An extended S-expression parser.
  class Extended < Basic
    LPARENS  = [?(, ?[].freeze
    RPARENS  = [?), ?]].freeze
    ATOM     = /^[^\s()\[\]]+/.freeze

    ##
    # @return [Object]
    def read_token
      case peek_char
        when ?[, ?] then [:list, read_char]
        else super
      end
    end

    ##
    # @return [void]
    def skip_comments
      until eof?
        case (char = peek_char).chr
          when /\s+/ then skip_char
          when /;/   then skip_line
          else break
        end
      end
    end
  end # class Extended
end; end # class SXP::Reader
