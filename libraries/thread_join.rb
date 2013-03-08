
class Chef
  class Resource
    class ThreadJoin < Chef::Resource
      
      identity_attr :lock_name

      def initialize(name, run_context=nil)
        super
        @resource_name = :thread_join
        @action = "run"
        @allowed_actions <<  :run
        @thread_name = name
      end

      def thread_join(arg=nil)
        set_or_return(
          :thread_join,
          arg,
          :kind_of => String
        )
      end
    end
  end
end

class Chef
  class Provider
    class ThreadJoin < Chef::Provider

      def whyrun_supported?
        true
      end

      def load_current_resource
        true
      end

      def action_run
        converge_by("execute the thread join #{@new_resource.name}") do 
          Chef::Provider::Thread.pool.shutdown
        end
      end
    end
  end
end


