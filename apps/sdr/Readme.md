# SDR

## Applications

- SDR
  - Hardware
    - dump1090
    - kalibrate-rtl # kal
    - rtl_433
    - rtl-sdr
  - Software
    - cubicsdr
    - gqrx
    - qradiolink
    - sdr++(sdrpp)
    - sdrangel
    - sigdigger
- Signal Analyzer
    audacity
    inspectrum
    urh
- CW / Morse
  - aldo
  - fldigi
- DAB
  - dablin
  - dabtools
  - guglielmo
  - welle-io
- Tetra
  - tetrapol-kit

## SDR Activation

add in you `hardware-configuration.nix` this line

```conf
hardware.rtl-sdr.enable = true;
```

## Remote SDR (rtl_tcp)

```bash
rtl_tcp -a 0.0.0.0 -P 7
```

equivalent to manual command

```bash
export RTLSDR="RTL2838"
sudo rmmod -f dvb_usb_rtl28xxu dvb_usb_v2 e4000 rtl2832 > /dev/null 2>&1
sudo chmod 666 $(lsusb  | grep -i ${RTLSDR} | awk '{print "/dev/bus/usb/" $2 "/" $4}' | sed 's/\://g')
```

## Find SDR Serial Number (SN)

```bash
rtl_test
```

## SDR ppm calibration

```bash
kal -s DCS
kal -b DCS -c <previous channel>
```

## Scan

```console
tmux
rtl_power -p 7 -g 25 -f 20M:1000M:200k -i 120s all_bands.csv
rtl_power -p 7 -g 25 -f 108M:138M:5k -i 60s airport.csv
```

## Misc

```bash
# SCAN
rtl_433 -R0 -f 433814000 -S all -s 1e6
rtl_fm -g 44 -d0 -f106100000 -s 250000 -F -U | baudline -stdin -samplerate 250000 -channels 1 -session rtlsdr1chUSB0 -basefrequency 10610000
```

```bash
dump1090 --interactive
docker run --rm -d --device /dev/bus/usb --name dump1090 -p 8080:8080 jraviles/dump1090:latest
```
