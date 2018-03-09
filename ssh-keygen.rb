require 'json'

params = JSON.parse(STDIN.read)
hosts = JSON.parse(params["hosts"])

for host in hosts do
  `ssh-keygen -R #{host}`
end

result = {
  mustreturn: "something"
}

puts result.to_json
