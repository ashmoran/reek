require 'set'
require File.join( File.dirname( File.expand_path(__FILE__)), 'smell_detector')
require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))), 'smell_warning')

module Reek
  module Smells

    #
    # Class variables form part of the global runtime state, and as such make
    # it easy for one part of the system to accidentally or inadvertently
    # depend on another part of the system. So the system becomes more prone to
    # problems where changing something over here breaks something over there.
    # In particular, class variables can make it hard to set up tests (because
    # the context of the test includes all global state).
    #
    class ClassVariable < SmellDetector

      def self.contexts      # :nodoc:
        [:class, :module]
      end

      #
      # Checks whether the given class or module declares any class variables.
      # Remembers any smells found.
      #
      def examine_context(ctx)
        class_variables_in(ctx).each do |cvar_name|
          found(ctx, "declares the class variable #{cvar_name}", '', {'variable' => cvar_name.to_s})
        end
      end

      #
      # Collects the names of the class variables declared and/or used
      # in the given module.
      #
      def class_variables_in(ctx)
        result = Set.new
        collector = proc { |cvar_node| result << cvar_node.name }
        [:cvar, :cvasgn, :cvdecl].each do |stmt_type|
          ctx.local_nodes(stmt_type, &collector)
        end
        result
      end
    end
  end
end
