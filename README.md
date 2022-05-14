# FrixionOS
Small operating system I have made, I will try to update it frequently

## Dependencies
- nasm 
- build-essentials
- qemu (Optional)

## Installations
Warning: At the moment, you can't compile for windows. So I suggest you to use WSL2 if you are on windows

You need to install some packages to make it work

debian:

```bash
apt-get install build-essentials
apt-get install nasm
```

Arch Linux:

```bash
pacman -S base-devel
pacman -S nasm
```

Clone the repo:

```bash
git clone https://github.com/Ficelloo/FrixionOS.git
```

Now you can compile with this command:

```bash
make
```

If you want to test the OS run this command (need to install qemu):

```bash
make run
```
