* https://gemini.google.com/app/a7e9cf3394ce80ad

## My external monitor is giving a black screen
This is a common "side effect" when updating NVIDIA drivers on Ubuntu laptops. Your `nvidia-smi` output shows that the driver is working for the GPU, but the "Display" (Disp.A) is currently set to **On** for the internal screen, while the external port (HDMI) likely lost its "handshake" during the driver switch.

Since you are using a **GTX 1650 Mobile**, the HDMI port is usually physically wired directly to the NVIDIA card (unlike the internal screen which often goes through the Intel chip).

Here is the "emergency" checklist to get your screen back:

### 1. The "Soft Reset" (Try this first)

Sometimes the display manager just needs a nudge to re-scan the ports.

* **Unplug the HDMI cable**, wait 5 seconds, and **plug it back in**.
* If that fails, press `Alt + F2`, type `r`, and hit `Enter`. This restarts the GNOME shell without closing your apps.

### 2. Check the "Prime" Select

Your laptop might have defaulted to "On-Demand" mode during the update, which sometimes disables external ports to save power.

* Open your terminal and run:
```bash
sudo prime-select nvidia

```


* After it finishes, you **must reboot**: `sudo reboot`.
* This forces the NVIDIA card to stay active and "own" the display outputs.

### 3. Disable "Wayland" (Common 2026 Conflict)

The new 580 drivers can sometimes clash with Wayland (the default display protocol) on older GTX cards.

1. Open the GDM configuration:
```bash
sudo nano /etc/gdm3/custom.conf

```


2. Find the line `#WaylandEnable=false`.
3. **Uncomment it** (remove the `#`) so it looks like: `WaylandEnable=false`.
4. Press `Ctrl + O`, `Enter`, then `Ctrl + X`.
5. Restart your display manager: `sudo systemctl restart gdm3`.

### 4. Check for a "Ghost" Config File

If you ever ran `nvidia-xconfig` in the past, it created a file that tells Ubuntu to ignore certain monitors.

* Check if this file exists:
```bash
ls /etc/X11/xorg.conf

```


* If it does, **rename it** (don't delete it yet) and reboot:
```bash
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.bak
sudo reboot

```



### 5. Last Resort: The "Modeset" fix

If your screen is still black, the "Kernel Mode Setting" might be stuck.

* Open your Grub config: `sudo nano /etc/default/grub`
* Find the line starting with `GRUB_CMDLINE_LINUX_DEFAULT`.
* Add `nvidia-drm.modeset=1` inside the quotes, e.g.:
`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia-drm.modeset=1"`
* Save, then run: `sudo update-grub` and reboot.

**Is the monitor showing up in your "Settings > Displays" now, or is it still completely missing from the menu?**

## Unable to find installation candidates for torch (2.5.1+cu121)
This `RuntimeError` is a common headache when using **Poetry** with **PyTorch**. It happens because Poetry's resolver sometimes struggles with the "local version" suffix (like `+cu121`) when searching a custom source.

Since your `nvidia-smi` showed **CUDA 13.0**, you actually have a lot of flexibility, but let's stick to the stable **cu121** or **cu124** wheels which are the current industry standards for the GTX 1650.

Here is the fix to get your environment running:

### 1. The Clean Setup (Try this first)

Poetry needs to know exactly which source to look at for the *specific* version. Instead of just adding it, try explicitly defining the version in your `pyproject.toml` or using this command:

```bash
# First, ensure the source is correctly set with 'priority = "explicit"'
poetry source add --priority=explicit pytorch_gpu https://download.pytorch.org/whl/cu121

# Now, add torch by specifying the source directly
# We use quotes around the version to handle the '+' character
poetry add torch=="2.5.1+cu121" --source pytorch_gpu

```

### 2. If it still fails: The "Direct URL" Workaround

If Poetry continues to be stubborn about the candidate search (a known bug in some Poetry versions), you can point it directly to the wheel. This is the "bulletproof" method for researchers:

Open your `pyproject.toml` and edit the `[tool.poetry.dependencies]` section like this:

```toml
[tool.poetry.dependencies]
python = "^3.10"  # or your version
torch = { url = "https://download.pytorch.org/whl/cu121/torch-2.5.1%2Bcu121-cp310-cp310-linux_x86_64.whl" }
# Note: Ensure 'cp310' matches your python version (e.g., cp311 for Python 3.11)

```

Then run:

```bash
poetry lock
poetry install

```

---

### 🖥️ About your Black Screen

Since you are likely still dealing with the external monitor issue while trying to code:

* **The Culprit:** When you ran `nvidia-smi`, it showed your display as "On" but your memory usage was very low. This usually means your laptop is in **Hybrid/On-Demand** mode.
* **Quick Fix:** Run `sudo prime-select nvidia` and **reboot**. This forces the HDMI port to wake up.

### Why is this happening?

Your **GTX 1650** is a "Turing" architecture mobile chip. In 2026, these chips require a very specific handshake between the Linux kernel and the Nvidia Power Management service. If the driver version mismatches (as you saw earlier), the first thing to die is the external display output.

**Once you get the monitor back and Torch is installed, would you like me to help you verify the installation by running a small script that checks if your GPU can perform a matrix multiplication?**
