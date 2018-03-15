
overclocking_override(){
	echo "Overclocking override for $hostname (has to be run as sudo)"
	echo ""

	sudo nvidia-smi -pm ENABLED

	nvidia-settings -c :0 -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=1000'
	nvidia-settings -c :0 -a '[gpu:1]/GPUMemoryTransferRateOffset[3]=1000'
	nvidia-settings -c :0 -a '[gpu:2]/GPUMemoryTransferRateOffset[3]=1000'
	nvidia-settings -c :0 -a '[gpu:3]/GPUMemoryTransferRateOffset[3]=1000'
	nvidia-settings -c :0 -a '[gpu:4]/GPUMemoryTransferRateOffset[3]=1000'
	nvidia-settings -c :0 -a '[gpu:5]/GPUMemoryTransferRateOffset[3]=1000'
	nvidia-settings -c :0 -a '[gpu:0]/GPUGraphicsClockOffset[3]=60'
	nvidia-settings -c :0 -a '[gpu:1]/GPUGraphicsClockOffset[3]=60'
	nvidia-settings -c :0 -a '[gpu:2]/GPUGraphicsClockOffset[3]=60'
	nvidia-settings -c :0 -a '[gpu:3]/GPUGraphicsClockOffset[3]=60'
	nvidia-settings -c :0 -a '[gpu:4]/GPUGraphicsClockOffset[3]=60'
	nvidia-settings -c :0 -a '[gpu:5]/GPUGraphicsClockOffset[3]=60'

	nvidia-smi -pl 100
	nvidia-smi
}

