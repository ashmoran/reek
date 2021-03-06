@samples
Feature: Basic smell detection
  In order to write better software
  As a developer
  I want to detect the smels in my Ruby code

  @inline
  Scenario: Correct smells from inline.rb
    When I run reek spec/samples/inline.rb
    Then the exit status indicates smells
    And it reports:
    """
    spec/samples/inline.rb -- 41 warnings (+1 masked):
      File has no descriptive comment (Irresponsible Module)
      Inline declares the class variable @@directory (Class Variable)
      Inline declares the class variable @@rootdir (Class Variable)
      Inline#self.rootdir calls env.nil? twice (Duplication)
      Inline#self.rootdir has approx 8 statements (Long Method)
      Inline::C declares the class variable @@type_map (Class Variable)
      Inline::C has at least 13 instance variables (Large Class)
      Inline::C takes parameters [options, src] to 5 methods (Data Clump)
      Inline::C tests $DEBUG at least 7 times (Simulated Polymorphism)
      Inline::C tests $TESTING at least 4 times (Simulated Polymorphism)
      Inline::C tests @@type_map.has_key?(type) at least 3 times (Simulated Polymorphism)
      Inline::C#build calls ($? == 0) twice (Duplication)
      Inline::C#build calls Inline.directory 5 times (Duplication)
      Inline::C#build calls io.puts 6 times (Duplication)
      Inline::C#build calls io.puts("#endif") twice (Duplication)
      Inline::C#build calls io.puts("#ifdef __cplusplus") twice (Duplication)
      Inline::C#build calls module_name twice (Duplication)
      Inline::C#build calls warn("Output:\n#{result}") twice (Duplication)
      Inline::C#build contains iterators nested 2 deep (Nested Iterators)
      Inline::C#build has approx 60 statements (Long Method)
      Inline::C#build has the variable name 'n' (Uncommunicative Name)
      Inline::C#build has the variable name 't' (Uncommunicative Name)
      Inline::C#c has the name 'c' (Uncommunicative Name)
      Inline::C#crap_for_windoze calls Config::CONFIG["libdir"] twice (Duplication)
      Inline::C#generate calls result.sub!(/\A\n/, "") twice (Duplication)
      Inline::C#generate calls signature["args"] twice (Duplication)
      Inline::C#generate calls signature["args"].map twice (Duplication)
      Inline::C#generate has approx 32 statements (Long Method)
      Inline::C#initialize calls stack.empty? twice (Duplication)
      Inline::C#load calls so_name twice (Duplication)
      Inline::C#module_name has the variable name 'm' (Uncommunicative Name)
      Inline::C#module_name has the variable name 'x' (Uncommunicative Name)
      Inline::C#parse_signature has approx 15 statements (Long Method)
      Inline::C#parse_signature has boolean parameter 'raw' (Control Couple)
      Inline::C#parse_signature has the variable name 'x' (Uncommunicative Name)
      Inline::C#parse_signature is controlled by argument raw (Control Couple)
      Inline::C#strip_comments doesn't depend on instance state (Low Cohesion)
      Inline::C#strip_comments refers to src more than self (Low Cohesion)
      Module#inline calls Inline.const_get(lang) twice (Duplication)
      Module#inline has approx 11 statements (Long Method)
      Module#inline is controlled by argument options (Control Couple)

    """

  Scenario: Correct smells from optparse.rb
    When I run reek spec/samples/optparse.rb
    Then the exit status indicates smells
    And it reports:
    """
    spec/samples/optparse.rb -- 109 warnings:
      OptionParser has at least 42 methods (Large Class)
      OptionParser has the variable name 'f' (Uncommunicative Name)
      OptionParser has the variable name 'k' (Uncommunicative Name)
      OptionParser has the variable name 'o' (Uncommunicative Name)
      OptionParser has the variable name 's' (Uncommunicative Name)
      OptionParser has the variable name 'v' (Uncommunicative Name)
      OptionParser tests ((argv.size == 1) and Array.===(argv[0])) at least 3 times (Simulated Polymorphism)
      OptionParser tests a at least 7 times (Simulated Polymorphism)
      OptionParser tests default_pattern at least 7 times (Simulated Polymorphism)
      OptionParser tests not_style at least 3 times (Simulated Polymorphism)
      OptionParser tests s at least 7 times (Simulated Polymorphism)
      OptionParser#complete contains iterators nested 2 deep (Nested Iterators)
      OptionParser#complete has 4 parameters (Long Parameter List)
      OptionParser#complete has boolean parameter 'icase' (Control Couple)
      OptionParser#getopts calls result[opt] = false twice (Duplication)
      OptionParser#getopts has approx 17 statements (Long Method)
      OptionParser#load has the variable name 's' (Uncommunicative Name)
      OptionParser#make_switch calls (long << o = q.downcase) twice (Duplication)
      OptionParser#make_switch calls (sdesc << "-#{q}") twice (Duplication)
      OptionParser#make_switch calls default_style.guess(arg = a) 4 times (Duplication)
      OptionParser#make_switch calls notwice(NilClass, klass, "type") twice (Duplication)
      OptionParser#make_switch calls notwice(a ? (Object) : (TrueClass), klass, "type") twice (Duplication)
      OptionParser#make_switch calls pattern.method(:convert) twice (Duplication)
      OptionParser#make_switch calls pattern.method(:convert).to_proc twice (Duplication)
      OptionParser#make_switch calls pattern.respond_to?(:convert) twice (Duplication)
      OptionParser#make_switch calls q.downcase 3 times (Duplication)
      OptionParser#make_switch calls search(:atype, FalseClass) twice (Duplication)
      OptionParser#make_switch calls search(:atype, o) 6 times (Duplication)
      OptionParser#make_switch contains iterators nested 2 deep (Nested Iterators)
      OptionParser#make_switch contains iterators nested 3 deep (Nested Iterators)
      OptionParser#make_switch has approx 68 statements (Long Method)
      OptionParser#make_switch has the variable name 'a' (Uncommunicative Name)
      OptionParser#make_switch has the variable name 'c' (Uncommunicative Name)
      OptionParser#make_switch has the variable name 'n' (Uncommunicative Name)
      OptionParser#make_switch has the variable name 'o' (Uncommunicative Name)
      OptionParser#make_switch has the variable name 'q' (Uncommunicative Name)
      OptionParser#make_switch has the variable name 's' (Uncommunicative Name)
      OptionParser#make_switch has the variable name 'v' (Uncommunicative Name)
      OptionParser#order calls argv[0] twice (Duplication)
      OptionParser#order refers to argv more than self (Low Cohesion)
      OptionParser#parse calls argv[0] twice (Duplication)
      OptionParser#parse refers to argv more than self (Low Cohesion)
      OptionParser#parse_in_order calls $!.set_option(arg, true) twice (Duplication)
      OptionParser#parse_in_order calls cb.call(val) twice (Duplication)
      OptionParser#parse_in_order calls raise($!.set_option(arg, true)) twice (Duplication)
      OptionParser#parse_in_order calls raise(*exc) twice (Duplication)
      OptionParser#parse_in_order calls setter.call(sw.switch_name, val) twice (Duplication)
      OptionParser#parse_in_order calls sw.block twice (Duplication)
      OptionParser#parse_in_order calls sw.switch_name twice (Duplication)
      OptionParser#parse_in_order contains iterators nested 2 deep (Nested Iterators)
      OptionParser#parse_in_order contains iterators nested 3 deep (Nested Iterators)
      OptionParser#parse_in_order has approx 28 statements (Long Method)
      OptionParser#parse_in_order is controlled by argument setter (Control Couple)
      OptionParser#permute calls argv[0] twice (Duplication)
      OptionParser#permute refers to argv more than self (Low Cohesion)
      OptionParser#search has the variable name 'k' (Uncommunicative Name)
      OptionParser#summarize has 4 parameters (Long Parameter List)
      OptionParser#summarize has the variable name 'l' (Uncommunicative Name)
      OptionParser#ver has the variable name 'v' (Uncommunicative Name)
      OptionParser::CompletingHash#match contains iterators nested 2 deep (Nested Iterators)
      OptionParser::Completion#complete calls candidates.size twice (Duplication)
      OptionParser::Completion#complete calls k.id2name twice (Duplication)
      OptionParser::Completion#complete has approx 22 statements (Long Method)
      OptionParser::Completion#complete has boolean parameter 'icase' (Control Couple)
      OptionParser::Completion#complete has the variable name 'k' (Uncommunicative Name)
      OptionParser::Completion#complete has the variable name 'v' (Uncommunicative Name)
      OptionParser::Completion#complete refers to candidates more than self (Low Cohesion)
      OptionParser::List#accept has the parameter name 't' (Uncommunicative Name)
      OptionParser::List#accept is controlled by argument pat (Control Couple)
      OptionParser::List#accept refers to pat more than self (Low Cohesion)
      OptionParser::List#add_banner refers to opt more than self (Low Cohesion)
      OptionParser::List#complete has 4 parameters (Long Parameter List)
      OptionParser::List#complete has boolean parameter 'icase' (Control Couple)
      OptionParser::List#reject has the parameter name 't' (Uncommunicative Name)
      OptionParser::List#summarize refers to opt more than self (Low Cohesion)
      OptionParser::List#update has 5 parameters (Long Parameter List)
      OptionParser::List#update has approx 6 statements (Long Method)
      OptionParser::List#update has the variable name 'o' (Uncommunicative Name)
      OptionParser::List#update is controlled by argument lopts (Control Couple)
      OptionParser::List#update is controlled by argument sopts (Control Couple)
      OptionParser::ParseError#set_option is controlled by argument eq (Control Couple)
      OptionParser::Switch#add_banner has the variable name 's' (Uncommunicative Name)
      OptionParser::Switch#conv_arg calls conv twice (Duplication)
      OptionParser::Switch#initialize has 7 parameters (Long Parameter List)
      OptionParser::Switch#parse_arg calls pattern twice (Duplication)
      OptionParser::Switch#parse_arg calls s.length twice (Duplication)
      OptionParser::Switch#parse_arg has approx 11 statements (Long Method)
      OptionParser::Switch#parse_arg has the variable name 'm' (Uncommunicative Name)
      OptionParser::Switch#parse_arg has the variable name 's' (Uncommunicative Name)
      OptionParser::Switch#self.guess has the variable name 't' (Uncommunicative Name)
      OptionParser::Switch#self.incompatible_argument_styles has the parameter name 't' (Uncommunicative Name)
      OptionParser::Switch#summarize calls (indent + l) twice (Duplication)
      OptionParser::Switch#summarize calls arg 4 times (Duplication)
      OptionParser::Switch#summarize calls left.collect twice (Duplication)
      OptionParser::Switch#summarize calls left.collect { |s| s.length }.max twice (Duplication)
      OptionParser::Switch#summarize calls left.collect { |s| s.length }.max.to_i twice (Duplication)
      OptionParser::Switch#summarize calls left.shift twice (Duplication)
      OptionParser::Switch#summarize calls left[-1] 3 times (Duplication)
      OptionParser::Switch#summarize calls s.length 3 times (Duplication)
      OptionParser::Switch#summarize contains iterators nested 2 deep (Nested Iterators)
      OptionParser::Switch#summarize has 5 parameters (Long Parameter List)
      OptionParser::Switch#summarize has approx 25 statements (Long Method)
      OptionParser::Switch#summarize has the variable name 'l' (Uncommunicative Name)
      OptionParser::Switch#summarize has the variable name 'r' (Uncommunicative Name)
      OptionParser::Switch#summarize has the variable name 's' (Uncommunicative Name)
      OptionParser::Switch::NoArgument#parse is controlled by argument arg (Control Couple)
      OptionParser::Switch::OptionalArgument#parse is controlled by argument arg (Control Couple)
      OptionParser::Switch::PlacedArgument#parse has approx 6 statements (Long Method)
      OptionParser::Switch::RequiredArgument#parse is controlled by argument arg (Control Couple)

    """

  Scenario: Correct smells from redcloth.rb
    When I run reek spec/samples/redcloth.rb
    Then the exit status indicates smells
    And it reports:
    """
    spec/samples/redcloth.rb -- 94 warnings:
      RedCloth has at least 44 methods (Large Class)
      RedCloth has the variable name 'a' (Uncommunicative Name)
      RedCloth has the variable name 'b' (Uncommunicative Name)
      RedCloth takes parameters [atts, cite, content, tag] to 3 methods (Data Clump)
      RedCloth tests atts at least 6 times (Simulated Polymorphism)
      RedCloth tests codepre.zero? at least 3 times (Simulated Polymorphism)
      RedCloth tests href at least 3 times (Simulated Polymorphism)
      RedCloth tests title at least 4 times (Simulated Polymorphism)
      RedCloth#block_markdown_atx refers to text more than self (Low Cohesion)
      RedCloth#block_markdown_bq has approx 6 statements (Long Method)
      RedCloth#block_markdown_rule refers to text more than self (Low Cohesion)
      RedCloth#block_markdown_setext refers to text more than self (Low Cohesion)
      RedCloth#block_textile_lists calls (line_id - 1) twice (Duplication)
      RedCloth#block_textile_lists calls depth.last 5 times (Duplication)
      RedCloth#block_textile_lists calls depth.last.length twice (Duplication)
      RedCloth#block_textile_lists calls depth[i] twice (Duplication)
      RedCloth#block_textile_lists calls lines[(line_id - 1)] twice (Duplication)
      RedCloth#block_textile_lists calls tl.length 3 times (Duplication)
      RedCloth#block_textile_lists contains iterators nested 3 deep (Nested Iterators)
      RedCloth#block_textile_lists has approx 20 statements (Long Method)
      RedCloth#block_textile_lists has the variable name 'i' (Uncommunicative Name)
      RedCloth#block_textile_lists has the variable name 'v' (Uncommunicative Name)
      RedCloth#block_textile_lists refers to depth more than self (Low Cohesion)
      RedCloth#block_textile_table contains iterators nested 2 deep (Nested Iterators)
      RedCloth#block_textile_table contains iterators nested 3 deep (Nested Iterators)
      RedCloth#block_textile_table has approx 18 statements (Long Method)
      RedCloth#block_textile_table has the variable name 'x' (Uncommunicative Name)
      RedCloth#blocks contains iterators nested 2 deep (Nested Iterators)
      RedCloth#blocks has approx 18 statements (Long Method)
      RedCloth#blocks has boolean parameter 'deep_code' (Control Couple)
      RedCloth#blocks is controlled by argument deep_code (Control Couple)
      RedCloth#check_refs is controlled by argument text (Control Couple)
      RedCloth#clean_html calls tags[tag] twice (Duplication)
      RedCloth#clean_html contains iterators nested 3 deep (Nested Iterators)
      RedCloth#clean_html doesn't depend on instance state (Low Cohesion)
      RedCloth#clean_html has approx 14 statements (Long Method)
      RedCloth#clean_html has the variable name 'q' (Uncommunicative Name)
      RedCloth#clean_html has the variable name 'q2' (Uncommunicative Name)
      RedCloth#clean_html refers to raw more than self (Low Cohesion)
      RedCloth#clean_html refers to tags more than self (Low Cohesion)
      RedCloth#clean_white_space has approx 7 statements (Long Method)
      RedCloth#clean_white_space refers to text more than self (Low Cohesion)
      RedCloth#flush_left doesn't depend on instance state (Low Cohesion)
      RedCloth#flush_left refers to indt more than self (Low Cohesion)
      RedCloth#flush_left refers to text more than self (Low Cohesion)
      RedCloth#footnote_ref refers to text more than self (Low Cohesion)
      RedCloth#glyphs_textile has approx 10 statements (Long Method)
      RedCloth#htmlesc doesn't depend on instance state (Low Cohesion)
      RedCloth#htmlesc refers to str more than self (Low Cohesion)
      RedCloth#incoming_entities refers to text more than self (Low Cohesion)
      RedCloth#initialize has the variable name 'r' (Uncommunicative Name)
      RedCloth#inline contains iterators nested 2 deep (Nested Iterators)
      RedCloth#inline_markdown_link has approx 6 statements (Long Method)
      RedCloth#inline_markdown_link has the variable name 'm' (Uncommunicative Name)
      RedCloth#inline_markdown_reflink has approx 8 statements (Long Method)
      RedCloth#inline_markdown_reflink has the variable name 'm' (Uncommunicative Name)
      RedCloth#inline_textile_code has the variable name 'm' (Uncommunicative Name)
      RedCloth#inline_textile_image has approx 17 statements (Long Method)
      RedCloth#inline_textile_image has the variable name 'href_a1' (Uncommunicative Name)
      RedCloth#inline_textile_image has the variable name 'href_a2' (Uncommunicative Name)
      RedCloth#inline_textile_image has the variable name 'm' (Uncommunicative Name)
      RedCloth#inline_textile_link has approx 9 statements (Long Method)
      RedCloth#inline_textile_link has the variable name 'm' (Uncommunicative Name)
      RedCloth#inline_textile_span contains iterators nested 2 deep (Nested Iterators)
      RedCloth#inline_textile_span has approx 8 statements (Long Method)
      RedCloth#inline_textile_span has the variable name 'm' (Uncommunicative Name)
      RedCloth#no_textile doesn't depend on instance state (Low Cohesion)
      RedCloth#no_textile refers to text more than self (Low Cohesion)
      RedCloth#pba calls $1.length twice (Duplication)
      RedCloth#pba has approx 21 statements (Long Method)
      RedCloth#pba is controlled by argument text_in (Control Couple)
      RedCloth#pba refers to style more than self (Low Cohesion)
      RedCloth#pba refers to text more than self (Low Cohesion)
      RedCloth#refs_markdown has the variable name 'm' (Uncommunicative Name)
      RedCloth#refs_textile has the variable name 'm' (Uncommunicative Name)
      RedCloth#retrieve has the variable name 'i' (Uncommunicative Name)
      RedCloth#retrieve has the variable name 'r' (Uncommunicative Name)
      RedCloth#rip_offtags calls ((codepre - used_offtags.length) > 0) twice (Duplication)
      RedCloth#rip_offtags calls (@pre_list.last << line) twice (Duplication)
      RedCloth#rip_offtags calls (codepre - used_offtags.length) twice (Duplication)
      RedCloth#rip_offtags calls @pre_list.last twice (Duplication)
      RedCloth#rip_offtags calls codepre.zero? twice (Duplication)
      RedCloth#rip_offtags calls htmlesc(line, :NoQuotes) twice (Duplication)
      RedCloth#rip_offtags calls used_offtags.length twice (Duplication)
      RedCloth#rip_offtags calls used_offtags["notextile"] 3 times (Duplication)
      RedCloth#rip_offtags has approx 18 statements (Long Method)
      RedCloth#textile_bq has 4 parameters (Long Parameter List)
      RedCloth#textile_bq is controlled by argument atts (Control Couple)
      RedCloth#textile_bq is controlled by argument cite (Control Couple)
      RedCloth#textile_fn_ has 5 parameters (Long Parameter List)
      RedCloth#textile_fn_ is controlled by argument atts (Control Couple)
      RedCloth#textile_p has 4 parameters (Long Parameter List)
      RedCloth#textile_p is controlled by argument atts (Control Couple)
      RedCloth#to_html has approx 24 statements (Long Method)

    """
