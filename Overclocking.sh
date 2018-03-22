
overclocking(){
	echo "Overclocking is being to be applied (has to be run as sudo)"
	echo "==========================================================="

	sudo nvidia-smi -pm ENABLED

	nvidia-settings -c :0 -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=$memoryGPU1'
	nvidia-settings -c :0 -a '[gpu:1]/GPUMemoryTransferRateOffset[3]=$memoryGPU2'
	nvidia-settings -c :0 -a '[gpu:2]/GPUMemoryTransferRateOffset[3]=$memoryGPU3'
	nvidia-settings -c :0 -a '[gpu:3]/GPUMemoryTransferRateOffset[3]=$memoryGPU4'
	nvidia-settings -c :0 -a '[gpu:4]/GPUMemoryTransferRateOffset[3]=$memoryGPU5'
	nvidia-settings -c :0 -a '[gpu:5]/GPUMemoryTransferRateOffset[3]=$memoryGPU6'
	nvidia-settings -c :0 -a '[gpu:0]/GPUGraphicsClockOffset[3]=$clockGPU1'
	nvidia-settings -c :0 -a '[gpu:1]/GPUGraphicsClockOffset[3]=$clockGPU2'
	nvidia-settings -c :0 -a '[gpu:2]/GPUGraphicsClockOffset[3]=$clockGPU3'
	nvidia-settings -c :0 -a '[gpu:3]/GPUGraphicsClockOffset[3]=$clockGPU4'
	nvidia-settings -c :0 -a '[gpu:4]/GPUGraphicsClockOffset[3]=$clockGPU5'
	nvidia-settings -c :0 -a '[gpu:5]/GPUGraphicsClockOffset[3]=$clockGPU6'

	nvidia-smi -pl "$voltageLimit"
	nvidia-smi
}

