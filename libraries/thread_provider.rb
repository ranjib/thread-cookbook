class Chef
  class Provider
    class Thread < Chef::Provider

      def whyrun_supported?
        true
      end

      def load_current_resource
        true
      end

      def action_run
        converge_by("execute the thread test #{@new_resource.name}") do 
          cached_new_resource = new_resource
          cached_current_resource = current_resource

          sub_run_context = @run_context.dup
          sub_run_context.resource_collection = Chef::ResourceCollection.new

          begin
            original_run_context, @run_context = @run_context, sub_run_context
            instance_eval(&@new_resource.block)
          ensure
            @run_context = original_run_context
          end

          begin
           set_pool(node['thread']['pool'])
           self.class.pool.schedule do
             Chef::Runner.new(sub_run_context).converge
            end
          ensure
            if sub_run_context.resource_collection.any?(&:updated?)
              new_resource.updated_by_last_action(true)
            end
          end
        end
      end

      def self.pool
        @@pool 
      end

      def set_pool(num)
        @@pool = ThreadPool.new(num)
      end
    end
  end
end

