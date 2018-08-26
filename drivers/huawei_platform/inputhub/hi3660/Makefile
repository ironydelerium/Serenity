#ifdef CONFIG_CONTEXTHUB_SHMEM
ccflags-y  += -I$(srctree)/drivers/contexthub/
#endif

# InputHub Driver
obj-$(CONFIG_INPUTHUB)		+= inputhub_bridge.o
obj-$(CONFIG_INPUTHUB)		+= inputhub_route.o
obj-$(CONFIG_INPUTHUB)		+= sensor_info.o
obj-$(CONFIG_INPUTHUB)       += sensorhub_logbuff.o
obj-$(CONFIG_INPUTHUB)       += sensor_debug.o
obj-$(CONFIG_INPUTHUB)       += iomcu_power.o
obj-$(CONFIG_INPUTHUB)	+= sensorhub_channel.o
obj-$(CONFIG_INPUTHUB)  += motionhub_channel.o
obj-$(CONFIG_INPUTHUB)  += sensor_detect.o
#obj-$(CONFIG_INPUTHUB)	+= touch_events_channel.o

obj-$(CONFIG_INPUTHUB)  += cahub_channel.o
obj-$(CONFIG_INPUTHUB)  += fingerprinthub_channel.o
obj-$(CONFIG_INPUTHUB)  += sensor_sys_info.o

hi3660-y =
hi3660-m =
hi3660-n =

hi3660-$(CONFIG_HISI_BB) += rdr_sensorhub.o 

obj-$(CONFIG_INPUTHUB) += kbhub_channel.o
obj-$(CONFIG_INPUTHUB) += $(hi3660-y)

