#!/usr/bin/env ruby

while true do
  temp = `/usr/sbin/hddtemp -n /dev/sdc`.strip.to_f
 `/usr/bin/gmetric --name=Samsung_SSD_840_temp --type=float --group=hddtemp --value=#{temp} --units=C --tmax=90 --dmax=600`
  sleep 5.0

  temp = `/usr/sbin/hddtemp -n /dev/sda`.strip.to_f
 `/usr/bin/gmetric --name=WD30EFRX_T13732_temp --type=float --group=hddtemp --value=#{temp} --units=C --tmax=90 --dmax=600`
  sleep 5.0
  
  temp = `/usr/sbin/hddtemp -n /dev/sdb`.strip.to_f
 `/usr/bin/gmetric --name=WD30EFRX_T03584_temp --type=float --group=hddtemp --value=#{temp} --units=C --tmax=90 --dmax=600`
  sleep 5.0
end
