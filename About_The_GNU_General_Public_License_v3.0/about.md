# General overview of the **GNU General Public License version 3.0 (GPLv3)**:

<br>

---

### 🛠️ **Purpose**
The GNU GPLv3 is a **free software license** that ensures users have four essential freedoms:
1. **Freedom to run** the program for any purpose.
2. **Freedom to study** how the program works and change it.
3. **Freedom to redistribute** copies.
4. **Freedom to distribute** copies of modified versions.

It’s designed to **protect users' freedom** and prevent proprietary hijacking of open-source software.

---

### 📜 **Key Features of GPLv3**

#### 1. **Stronger Copyleft**
- If you distribute software licensed under GPLv3 (modified or unmodified), you **must release it under the same license**.
- Derivative works must also be open source and licensed under GPLv3.

#### 2. **Patent Protection**
- GPLv3 includes an **explicit patent license** from contributors to users.
- Prevents contributors from suing users for patent infringement.

#### 3. **Tivoization Prevention**
- Addresses the issue of "Tivoization" (when hardware prevents users from running modified versions of GPL software).
- GPLv3 requires that users can **install and run modified versions**, even on hardware.

#### 4. **Anti-DRM**
- GPLv3 makes it clear that **Digital Rights Management (DRM)** can’t be used to restrict users’ rights to modify or share the software.

#### 5. **Internationalization**
- Better language and legal compatibility with laws in **multiple countries**.

#### 6. **Compatibility with Other Licenses**
- More flexible when combining with other **free software licenses**, compared to GPLv2.

---

### 🔄 Differences from GPLv2
- **Stronger language on patents and user freedoms**
- **Explicit anti-DRM measures**
- **Compatibility improvements**
- **Clearer terms for contributors and distributors**

---

### 🔒 Summary of Responsibilities for Users and Developers
- **You can:** use, study, share, and modify the software.
- **You must:** provide source code (if distributing binaries), include license terms, and preserve GPLv3 status.
- **You cannot:** add restrictions that contradict the GPLv3, make it proprietary, or deny users the rights it guarantees.

---

<br>

# Well known open-source projects that use the GPLv2 and open-source projects that use GPLv3
Here’s a quick tour of prominent projects under each license family.  
(I’m focusing on headline‑level projects that most developers recognize or run into.)

---

## Well‑known projects under **GPL v2 only**

| Project | What it is | Notes |
|---------|------------|-------|
| **Linux kernel** | The operating‑system kernel powering Android, ChromeOS, servers, IoT, etc. | Linus Torvalds has deliberately kept it on “GPL v2‑only” since 1992. |
| **Git** | The distributed version‑control system used on virtually every code host. | GPL v2 only (chosen by Linus when he wrote Git in 2005). |
| **BusyBox** | A single‑binary toolbox of Unix utilities used in embedded systems (routers, initramfs, containers). | Nicknamed “the Swiss‑army knife of embedded Linux.” |
| **MPlayer** | Classic cross‑platform video player/decoder. | Stuck at GPL v2 because of compatibility worries with codecs. |
| **Audacity (≤ v2.4.x)** | Popular audio editor/recorder. | Stayed GPL v2 until the Muse Group acquisition; later switched to GPL v3+. |
| **MySQL (community edition)** | Widely‑used relational database. | Oracle continues to release it as GPL v2 with commercial dual‑licensing. |

---

<br>

## Projects that have **migrated to—or launched with—GPL v3 (“GPL v3 or later”)**

| Project | What it is | License stance |
|---------|------------|----------------|
| **GNU Compiler Collection (GCC)** | C/C++/Fortran/Go/… compiler suite. | Moved from GPL v2 to GPL v3 in version 4.2 (2007). |
| **GNU Emacs** | Legendary extensible text editor. | Switched on its first post‑2007 release; now “GPL v3 or later.” |
| **GnuPG** | Core OpenPGP encryption/​signing toolchain. | Adopted GPL v3 to leverage its stronger anti‑patent language. |
| **FreeCAD** | Parametric 3‑D CAD modeler. | Ships as GPL v3+ to ensure user freedom on hardware that embeds it. |
| **OpenFOAM** | High‑performance computational‑fluid‑dynamics platform. | Relicensed to GPL v3 in 2011 for patent‑&‑tivoization protection. |
| **Audacity (≥ v2.4.2)** | The same audio editor after relicensing. | New code base is “GPL v3 or later.” |
| **VeraCrypt** | Disk‑encryption successor to TrueCrypt. | Went straight to GPL v3 for anti‑DRM clauses. |
| **KiCad** | PCB design & schematic suite. | Uses GPL v3 to keep hardware vendors from locking down builds. |
| **Darktable** | Raw photo workflow and editor. | GPL v3+ since its first public release. |

---

<br>

### Why many core projects remain on GPL v2

- **License compatibility:** GPL v2 isn’t automatically compatible with GPL v3; kernel developers feared “lock‑out” with v3‑only libraries.
- **Patent retaliation language:** Some organizations dislike GPL v3’s broader patent clauses.
- **“Tivoization” hardware requirements:** Device makers sometimes prefer v2 because it imposes no obligation to let end‑users flash modified firmware.

<br>

### Why others embraced GPL v3

- **Stronger protections** against DRM and patent aggression.
- **Explicit patent grant** makes corporate contributors (and their customers) safer.
- **Clarity for international law** and modern use cases (embedded, cloud).

---

<br>


