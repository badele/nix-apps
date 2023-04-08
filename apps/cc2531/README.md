# Flashing Zigbee CC2531

## Connecting

3. Connect `CC debugger --> Downloader cable CC2531 --> CC2531 USB sniffer`.
4. Connect **BOTH** the `CC2531 USB sniffer` and the `CC debugger` to your PC using USB.
5. If the light on the CC debugger is RED, press the Reset button on the CC debugger. The light on the CC debugger should now turn GREEN. If not, try to reboot and retry or follow the [CC debugger user guide](http://www.ti.com/lit/ug/swru197h/swru197h.pdf) to troubleshoot your problem.
![How to connect](https://www.zigbee2mqtt.io/assets/img/connected.843d662a.jpg)
7. Flash your firmware with `flash_cc2531` command line

```
flash_cc2531
check_cc2531_revision
```

**Note:** If good firmaware version, the `check_cc2531_revision` command must show `Good revision` message

Source: https://www.zigbee2mqtt.io/guide/adapters/flashing/flashing_the_cc2531.html