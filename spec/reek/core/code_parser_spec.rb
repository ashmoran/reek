require File.join(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__)))), 'spec_helper')
require File.join(File.dirname(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__))))), 'lib', 'reek', 'core', 'code_parser')

include Reek::Core

describe CodeParser, "with no method definitions" do
  it 'reports no problems for empty source code' do
    ''.should_not reek
  end
  it 'reports no problems for empty class' do
    '# clean class for testing purposes
class Fred; end'.should_not reek
  end
end

describe CodeParser, 'with a global method definition' do
  it 'reports no problems for simple method' do
    'def Outermost::fred() true; end'.should_not reek
  end
end

describe CodeParser, 'when a yield is the receiver' do
  it 'reports no problems' do
    src = <<EOS
def values(*args)
  @to_sql += case
    when block_given? then yield.to_sql
    else args.to_sql
  end
  self
end
EOS
    src.should_not reek
  end
end

describe CodeParser do
  it 'copes with a yield to an ivar' do
    'def options() ozz.on { |@list| @prompt = !@list } end'.should_not reek
  end
end
