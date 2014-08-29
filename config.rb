if File.exists?('user-data') && ARGV[0].eql?('up')
 require 'open-uri'
 require 'yaml'

 token = open('https://discovery.etcd.io/new').read

 data = YAML.load(IO.readlines('user-data')[1..-1].join)
 data['coreos']['etcd']['discovery'] = token

 lines = YAML.dump(data).split("\n")
 lines[0] = '#cloud-config'

 open('user-data', 'r+') do |f|
   f.puts(lines.join("\n"))
 end
end

$update_channel='beta'

$expose_docker_tcp=2375

$expose_etcd_tcp=4001
