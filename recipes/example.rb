


thread  "one stuff" do
  block do
    execute "ping once" do
      command "ping -c 5 8.8.8.8"
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

thread_join "join them all" do
  action :run
end

