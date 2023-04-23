# SDR

```bash
# SCAN
rtl_433 -R0 -f 433814000 -S all -s 1e6
rtl_fm -g 44 -d0 -f106100000 -s 250000 -F -U | baudline -stdin -samplerate 250000 -channels 1 -session rtlsdr1chUSB0 -basefrequency 10610000
```

```bash
dump1090 --interactive
docker run --rm -d --device /dev/bus/usb --name dump1090 -p 8080:8080 jraviles/dump1090:latest
```
