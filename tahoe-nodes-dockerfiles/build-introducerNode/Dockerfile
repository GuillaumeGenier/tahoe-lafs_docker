FROM derkades/tahoe-lafs:dev 
RUN tahoe create-introducer --hostname=dummy_hostname /data
RUN timeout --preserve-status 3 tahoe run /data | echo test