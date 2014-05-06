#!/usr/bin/env ruby 

while true do
  out = `/usr/bin/sensors`.split[5]
  out = out[0..-2]
 `/usr/bin/gmetric --name=cpu_temp --type=float --group=cpu --value=#{out.to_f} --units=C --tmax=90 --dmax=600`
  puts "/usr/bin/gmetric --name=cpu_temp --type=float --group=cpu --value=#{out.to_f} --units=C --tmax=90 --dmax=600"
  sleep 15.0
end
