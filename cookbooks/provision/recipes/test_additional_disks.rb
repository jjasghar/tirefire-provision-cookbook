ruby_block 'Check additional disks' do
  block do
    require 'pp'
    puts nil, nil
    virtual_disks = node['block_device'].select { |_k, v| v['model'] == 'Virtual disk' }
    virtual_disks.each do |id, details|
      puts "Device: #{id}", nil
      pp details
      puts
    end

    raise "Expected 3 disks. Got #{virtual_disks}." if virtual_disks.length != 3
  end
  action :run
end
