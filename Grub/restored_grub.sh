#!/bin/bash
sudo grub-install /dev/sda
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo update-grub
