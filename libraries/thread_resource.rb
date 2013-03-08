
class Chef
  class Resource
    class Thread < Chef::Resource

      identity_attr :thread_name

      def initialize(name, run_context=nil)
        super
        @resource_name = :thread_test
        @action = "run"
        @allowed_actions <<  :run
        @thread_name = name
      end

      def block(&block)
        if block_given? and block
          @block = block
        else
          @block
        end
      end

      def thread_name(arg=nil)
        set_or_return(
          :thread_name,
          arg,
          :kind_of => String
        )
      end
    end
  end
end

