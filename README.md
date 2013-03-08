thread Cookbook
===============
Provides an lwrp to execute start in parallel (via threads).

Requirements
------------
Chef 10.18 or higher


Attributes
----------
#### thread::pool
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['thread']['pool']</tt></td>
    <td>Integer</td>
    <td>Number of thread in the pool</td>
    <td><tt>10</tt></td>
  </tr>
</table>

Usage
-----
#### thread::default


```ruby
thread 'something time consuming' do
  block do
    execute "ping -c 8.8.8.8" 
  end
end

thread 'something time consuming' do
  block do
    execute "ping -c 8.8.8.8" 
  end
end

thread_join "wait till finish"

```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Ranjib Dey (dey.ranjib@gmail.com)
