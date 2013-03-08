


thread  "one stuff" do
  block do
    execute "ping once" do
      command "ping -c 15 8.8.8.8"
    end
  end 
end  

thread "some other stuff" do
  block do
    execute "ping twice" do
      command "ping -c 5 8.8.8.8"
    end
  end 
end  

ruby_block "log 1" do
  block do
    Chef::Log.info('This will be printed before the earlier command finishes')
  end
end

thread_join "join them all" do
  action :run
end

ruby_block "log 1" do
  block do
    Chef::Log.info('This will be printed afer the threads have finished')
  end
end
