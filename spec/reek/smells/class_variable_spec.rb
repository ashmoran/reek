require File.join(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__)))), 'spec_helper')
require File.join(File.dirname(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__))))), 'lib', 'reek', 'smells', 'class_variable')
require File.join(File.dirname(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__))))), 'lib', 'reek', 'core', 'class_context')
require File.join(File.dirname(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__))))), 'lib', 'reek', 'core', 'module_context')
require File.join(File.dirname(File.expand_path(__FILE__)), 'smell_detector_shared')

include Reek::Core
include Reek::Smells

describe ClassVariable do
  before :each do
    @detector = ClassVariable.new('raffles')
  end

  context 'with no class variables' do
    it 'records nothing in the class' do
      ctx = ClassContext.from_s('class Fred; end')
      @detector.class_variables_in(ctx).should be_empty
    end
    it 'records nothing in the module' do
      ctx = ModuleContext.from_s('module Fred; end')
      @detector.class_variables_in(ctx).should be_empty
    end
  end

  context 'with one class variable' do
    shared_examples_for 'one variable found' do
      it 'records the class variable' do
        @detector.class_variables_in(@ctx).should include(:@@tools)
      end
      it 'records only that class variable' do
        @detector.class_variables_in(@ctx).length.should == 1
      end
      it 'records the variable in the YAML report' do
        @detector.examine_context(@ctx)
        @detector.smells_found.each do |warning|
          warning.to_yaml.should match(/variable:[\s]*"@@tools"/)
        end
      end
    end

    context 'declared in a class' do
      before :each do
        @ctx = ClassContext.from_s('class Fred; @@tools = {}; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'used in a class' do
      before :each do
        @ctx = ClassContext.from_s('class Fred; def jim() @@tools = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'indexed in a class' do
      before :each do
        @ctx = ClassContext.from_s('class Fred; def jim() @@tools[mash] = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'declared and used in a class' do
      before :each do
        @ctx = ClassContext.from_s('class Fred; @@tools = {}; def jim() @@tools = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'used twice in a class' do
      before :each do
        @ctx = ClassContext.from_s('class Fred; def jeff() @@tools = {}; end; def jim() @@tools = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'declared in a module' do
      before :each do
        @ctx = ClassContext.from_s('module Fred; @@tools = {}; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'used in a module' do
      before :each do
        @ctx = ClassContext.from_s('module Fred; def jim() @@tools = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'indexed in a module' do
      before :each do
        @ctx = ClassContext.from_s('module Fred; def jim() @@tools[mash] = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'declared and used in a module' do
      before :each do
        @ctx = ClassContext.from_s('module Fred; @@tools = {}; def jim() @@tools = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end

    context 'used twice in a module' do
      before :each do
        @ctx = ClassContext.from_s('module Fred; def jeff() @@tools = {}; end; def jim() @@tools = {}; end; end')
      end

      it_should_behave_like 'one variable found'
    end
  end

  it_should_behave_like 'SmellDetector'
end
