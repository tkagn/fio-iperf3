# fio-iperf3
## Dockerfile

Used to build a ubi8 container with fio and iperf3 installed
## ss-fio-iperf3

Used to deploy an OpenShift statefulset that instantiate one pod per compute node.

The pod will request an 3GiB RBD PVC and a 3GiB CephFS PVC. The PVCs will be mounted in `/mnt/rbd` and `/mnt/cephfs` respectively. All `fio` test should be run based on one of those mountpoints.

## Examples

**FIO Throughput Test**
```bash
# Sequential write throughput (write bandwidth) (1024 KB for single I/O):
sync ; fio --name=writethroughput-test --filename=/mnt/rbd/throughput-test.fio --ioengine=libaio --direct=1 --rw=write --bs=1024k --size=1Gi --iodepth=64 --numjobs=1 --group_reporting --runtime=120 --time_based

# Sequential read throughput (read bandwidth) (1024 KB for single I/O):
sync ; fio --name=readthroughput-test --filename=/mnt/rbd/throughput-test.fio --ioengine=libaio --direct=1 --rw=read --bs=1024k --size=1Gi --iodepth=64 --numjobs=1 --group_reporting --runtime=120 --time_based
```

**FIO IOPS Test**
```bash
#  Random write IOPS (4 KB for single I/O):
sync ; fio --name=writeIOPS-test --filename=/mnt/rbd/iops-test.fio --ioengine=libaio --direct=1 --rw=randwrite --bs=4k --size=1Gi --iodepth=128 --numjobs=1 --group_reporting --runtime=120 --time_based

#  Random read IOPS (4KB for single I/O):
sync ; fio --name=readIOPS-test --filename=/mnt/rbd/iops-test.fio --ioengine=libaio --direct=1 --rw=randread --bs=4k --size=1Gi --iodepth=128 --numjobs=1 --group_reporting --runtime=120 --time_based
```

**FIO Latency Test**
```bash
#  Random write latency (4 KB for single I/O):
sync ; fio --name=randwriteLatency-test --filename=/mnt/rbd/latency-test.fio --ioengine=libaio --direct=1 --rw=randwrite --bs=4k --size=1Gi --iodepth=1 --numjobs=1 --group_reporting --runtime=120 --time_based

#  Random read latency (4KB for single I/O):
sync ; fio --name=randwriteLatency-test --filename=/mnt/rbd/latency-test.fio --ioengine=libaio --direct=1 --rw=randread --bs=4k --size=1Gi --iodepth=1 --numjobs=1 --group_reporting --runtime=120 --time_based
```

