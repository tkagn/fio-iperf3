FROM registry.access.redhat.com/ubi8/ubi

# Install fio and iperf3 then update container and cleanup
RUN dnf -y install fio iperf3 \
&& dnf -y update \
&& dnf clean all \
&& rm -rf /var/cache/yum 

# Expose port 5201 for iperf3 server mode
expose 5201

# Start shell on instantiation
CMD [ "/bin/bash" ]

