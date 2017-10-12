from bluetooth import *
nearby = discover_devices(lookup_names = True)
print ("Found %d devices"%len(nearby))
for name,addr in nearby:
 print("%s - %s"%(addr,name))
