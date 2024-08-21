# GrapheneOS - A High-level Overview 

This is the second iteration of the original GrapheneOS.md

### Table of Contents
---

**Introduction**
#### 1. Hardware
- The Titan M Series Chip
#### 2. Resisting Persistence
- Boot Flow
- Attestation
#### 3. Security Hardening
- GrapheneOS Security Practices
- Defense in Depth
- The Android Framework
- Basic Android Security Features
- Application Sandbox
- Security hardening of the Android Operating System
- Permissions
- Memory Allocation

### Introduction
---
The rabbit hole that is GrapheneOS, can  lead one down many other tangents.
Therefore in this write-up,  so as to not get lost in the minutia, the author, when mentioning a feature, or specific technology, that is not specifically GrapheneOS, will provide a concise yet through explanation of it, then move on.
 
This approach however, will not come at the expense of an incomplete review. Adequate explanation for an overall high-level understanding is the intent. And the reader will find embedded links to the  official documentation in the text, and a through list of referencese.

### Part 1 - Hardware
---

**[The Titan M Series Chip](https://www.androidauthority.com/titan-m2-google-3261547/)**
Graphene OS Security begins at the hardware level, it utilizes the Titan M Series Chip.
The Titan M2 is a dedicated security chip included in Pixel 6 and 7 series smartphones.
This chip was developed in-house and is based on the RISC-V CPU [architecture](https://www.androidauthority.com/arm-vs-x86-key-differences-explained-568718/).
It contains its own memory, RAM, and cryptographic accelerator.

![Google_M-series-chip-scaled](https://github.com/LinuxUser255/BashAndLinux/assets/46334926/15ee5c49-d1c1-4dbd-8089-27ff2f7689e2)

This design adds another layer of protection on top of Android's default security.
One such security feature is full-disk encryption, which depends on the Trusted Execution Environment (TEE). The TEE is considered the secure area of a processor, and is where Android devices store their encryption keys. This is protected by your pattern, PIN, or passcode.

It isolates cryptographic keys, and is never revealed to the user or the Operation System.
As of the Pixel 3, Google separated the Trusted Execution Environment from the chipset, and implemented a separate security module in its place. The Titan M Series can almost be considered a standalone processor. Additionally, it possesses flash memory which is used for storing sensitive data, as well as running it's own micro kernel.

![Google_Tensor](https://github.com/LinuxUser255/BashAndLinux/assets/46334926/25381b74-d4a9-499e-998e-900f180982b7)

"The Titan M2 supports Android StrongBox, which is a safe storage space for cryptographic keys used by third-party apps. The Titan M communicates with the main application processor but does not reveal the Secret keys to the app processor. It is tamper-resistant because no known manipulation of the chip will result in successful extraction.

**Some Primary Features**
- Verified Boot
- Protected Boot loader
- Secure Flash Storage
- Insider Attack Resistance
- Generating and Storing Private Keys

**Elaboration on some of these features**

**Rate limitation**
When you boot up a Pixel, the data remains encrypted until the lock screen is cleared.
The Titan M series has a brute-force rate-limiting feature, which is implemented at the hardware level.
This rate-limit feature, hardcodes delay periods upon unsuccessful unlock attempts.

It works like this:
- 0 to 4 failed attempts: no delay
- 5 failed attempts: 30-second delay
- 6 to 9 failed attempts: no delay
- 10 to 29 failed attempts: 30-second delay
- 30 to 139 failed attempts: 30 × 2⌊(n - 30) ÷ 10⌋ where n is the number of failed attempts. 
 
The delay doubles after every 10 attempts. There's a 30 second delay after 30 failed attempts, 60 seconds after 40, 120 seconds after 50, 240 seconds after 60, 480 seconds after 70, 960 seconds after 80, 1,920 seconds after 90, 3,840 seconds after 100, 7,680 seconds after 110, 15,360 seconds after 120, and 30,720 seconds after 130 failed attempts.
Finally, after 140 or more failed attempts: There is 86,400 second delay (1 day).

Essentially, the delay doubles after every 10 attempts until the 139th failed attempt.
After which, you get only one attempt every 24 hours.

The M2 is hardened against physical tampering too. The chip's firmware cannot be changed or updated without the device's pattern or PIN.

**Insider attack resistance**
In order to load firmware to the Titan M, the phone must be unlocked.
This makes it more difficult for the creation of custom firmware that could be used to unlock your phone. This resistance to an insider attack,  means only the user's authentication can unlock it. Not until you clear the lock screen prompt will the phone's storage be decrypted.

### Part Two: Resisting Persistence
---

### [Verified Boot](https://source.android.com/docs/security/features/verifiedboot/boot-flow)

**Android's Boot Flow: There are four different states of integrity**

- **Green**: No issues found and the system fully boots.
- **Yellow**: The Bootloader is locked and signed with a user-defined key.
- **Orange**: Indicates that the bootloader has been unlocked, and the system's security is compromised.
- **Red**: Either no valid system was found, or the device has been corrupted

![Android_Boot_Flow](https://github.com/LinuxUser255/BashAndLinux/assets/46334926/76022685-5657-4c04-857c-53706afcb1ae)

GrapheneOS utilizes the yellow stage of verified boot. This is accomplished by using its own custom signing key, while simultaniously keeping the bootloader locked, thus maintaining full verified boot.

**Graphene's Improvements to Android's Verified Boot**
The stock pixel has chained verified boot. This means that Google could swap one partition for a newer one deployed by the OEM to the device.  
This however, introduces another attack surface.  
Therefore, GrapheneOS disables chained verified boot to reduce that attack surface.
They eliminate some ways that the OS could store a persistence state. This makes it 
more difficult for an adversary to persist on your device.

**[Attestation](https://attestation.app/about)**
A very unique security feature of GrapheneOS is that it uses a hardware-based attestation service, in order to validate the identity of a device, as well as the authenticity and integrity of the Operating System. This is accomplished via the [auditor app](https://play.google.com/store/apps/details?id=app.attestation.auditor.play).

This serves as a backup to the verified boot process.  For example,  in the event an attacker was able to downgrade or tamper with the Operating System, it is the Auditor App, that would detect such a compromise. This requires two devices to complete. And, is another reason that Graphene uses The Titan M.. The attestation keys are stored in it.

It works like this. It generates a persistent key in the [hardware-backed keystore](https://source.android.com/docs/security/features/keystore)
This verifies the ID of the device, and assures no tampering or downgrading has occurred.
This implements a Trust On First Use Model. This is accomplished via the device performing the verification, the Auditor. And, the device being verified, the auditee. 

### Part 3: Security Hardening of the Android Operating System
---

**GrapheneOS Security Practice Philosophy**

**The developers of GrapheneOS have a unique security paradigm for The security of AOS .
Here are a few quotes taken from their page on exploit protection features.**

> "The first line of defense is attack surface reduction. Removing unnecessary code or exposed attack surface eliminates many vulnerabilities completely."

> "An example we landed upstream in Android is disallowing using the kernel's profiling support by default, since it was and still is a major source of Linux kernel vulnerabilities."

> "The next line of defense is preventing an attacker from exploiting a vulnerability, either by making it impossible, unreliable, or at least meaningfully harder to develop."

> "In many cases, vulnerability classes can be completely wiped out while in many others they can at least be made meaningfully harder to exploit."

> "We offer toggles for users to choose the compromises they prefer instead of forcing it on them."

> "The final line of defense is containment through sandboxing at various levels: fine-grained sandboxes around a specific context like per-site browser renderering, sandboxes around a specific component like Android's media codec sandbox, and app/workspace sandboxes like the Android app sandbox used to sandbox each app which is also the basis for user/work profiles. GrapheneOS improves all of these sandboxes through fortifying the kernel and other base OS components along with improving the sandboxing"



### [Defense in Depth ](https://csrc.nist.gov/glossary/term/defense_in_depth) 
This is at the core of [GrapheneOS Security](https://grapheneos.org/features#exploit-protection)
 for defending against Zero Day Exploits.  First, let's take a high-level overview of The Android Operating System and see what the developers at GrapheneOS do differently.
#### The Android Software Stack and  Platform architecture

![Android_Arcnitecture_Overview](https://github.com/LinuxUser255/BashAndLinux/assets/46334926/50e39637-e2b7-4ce4-8fd3-c79a48081039)



#### Contents of each layer
Take note of the purple section - _Native C/C++ Libraries_, this will come up later in this review.


![Android_Platform_Arch](https://github.com/LinuxUser255/BashAndLinux/assets/46334926/b849e420-99ae-4a1c-8b7e-5e91c7bbec8a)

![[SadnboxingLayers-Android 1.png]]


## [Android's Application Sandbox](https://source.android.com/docs/security/app-sandbox) and the three permission mechanisms that enforce it.

**Android's sandbox, via implementation of the [SELinux](https://source.android.com/docs/security/features/selinux/concepts) policy.**

1. **[Discretionary Access Control (DAC):](https://source.android.com/docs/core/permissions/filesystem)**
According to [The Android Platform Security Model's official documentation](https://source.android.com/docs/security/app-sandbox)
Every app is assigned a UID, this allows the system to identify and separate apps into isolated processes.
This serves as the first security control each app runs with its own user ID
(UID) on UNIX-based systems. Apps can decide who can access their resources by
changing permissions on those resources. 
Apps run in their own instance in a [Dalvik Virtual Machine](https://source.android.com/docs/core/runtime) embedded in
Android Runtime.They are granted a dedicated separate space to store their data that
other apps cannot access by default. Therefore, [If app A, needs to communicate with app B,then both apps must consent to the action](https://source.android.com/docs/security/app-sandbox). This consent enforcement is done by the Linux Kernel. Apps can also share access to their resources with other apps by passing a handle to the resource through Inter Process Communication (IPC). However, if an app is running with root user privileges, it can bypass these
permissions, although there may still be some restrictions imposed by Mandatory Access Control (MAC) policies.

2. **[Mandatory Access Control (MAC):](https://source.android.com/docs/security/features/selinux/concepts)**
This is the second layer of sandboxing. 
Mandatory Access Control (MAC) means that there are strict rules about what
actions can be taken on the system. Only actions that are specifically allowed
by these rules are allowed to occur. On Android devices, this is managed using
[SELinux](https://source.android.com/docs/security/features/selinux/concepts) which uses **default denial**. Meaning, anything not explicitly
granted access is denied.  This feature is built into the core of the operating
system. SELinux is heavily used on Android to protect different parts of the
system, and ensure that it meets certain security standards. With SELinux, even
processes that have the same user ID (UID) are kept separate, providing a more
detailed level of security.  This makes it more difficult for remote exploits to take 
advantage of system process or access user data. This is because it would have to 
bypass SELinux in the Kernel.

3. **[Android permissions](https://source.android.com/docs/core/permissions)**
Android permissions are like special permissions that control what different apps on your phone can do. These permissions include things like accessing your location or using your camera. Each permission is assigned to a unique ID (UID), and apps can grant access to specific pieces of data they manage. The enforcement of these permissions is mostly handled by the app or service providing the data, although there are some exceptions, like internet access, which is handled differently. These permissions are set up in an app's settings file called AndroidManifest.xml and are the main way users see and control what their apps can do.

### Grapene's Security hardening of SELinux

**In what way does GrapheneOS enhance the security of SELinux?**
They split the [trusted, and untrusted app domains](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/README.apps.md)

An `appdomain` is an attribute of an app. "You can think of `appdomain` as any 
app started by [Zygote](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/private/zygote.te), (creation of a fresh process via [exec spawning](https://grapheneos.org/usage#exec-spawning)). The macro `app_domain()` should be used to define a type that is considered an app. See [public/te_macros](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/public/te_macros) for more."

By default, the base operating system, and all the apps you install, are running
in the, "`untrusted_app` `domain`". But, in GrapheneOS, they are split into two separate categories: **"untrusted_app"**, and **"untrusted base-app."** Examples of [untrusted_apps](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/README.apps.md#untrusted_app) 
are third-party apps installed from the Play Store.

The **untrusted_base_app**, is the SELinux domain, used for all apps that come
with the operating system. Such as [Vanadium](https://github.com/GrapheneOS/Vanadium), [Auditor](https://github.com/GrapheneOS/Auditor), etc. 

A significant change Graphene makes to  the untrusted base-app, is:  
**Removal the ability for applications to have writable and executable memory.** 

Code examples of `domains`, `untrusted_app` & `untrusted_base_app`
[Trusted, and Untrusted appdomains](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/private/domain.te)

[untrusted_app.te](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/public/untrusted_app.te)

[untrusted_app-all](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/private/untrusted_app_all.te)

Code snippets: `untrusted_app.te` from the `platform_system_policy` repository

 ![untrusted_app_full-01](https://github.com/user-attachments/assets/43fddb5d-778c-4dbf-b729-9fc0b0adc5d6)



#### [Android Permissions categories](https://arxiv.org/pdf/1904.05572 ) and Graphene's improvements
Android permissions's five categories of consent: pg 20
1.  Audit-only / Install time permissions
2.  Runtime permissions 
3.  Special Access permissions
4.  Privileged permissions
5.  Signature permissions

Graphnene forces all apps to submit to the same sandbox policy. Privileged apps that 
would normally run with extensive access on Android, will be restricted on GrapheneOS.
This means, that you could install [Google Apps](https://grapheneos.org/features#sandboxed-google-play) on your phone, and they would not have
access to your [device identifiers](https://grapheneos.org/faq#hardware-identifiers), or data from other apps.

Also, Graphnene introduced toggles that were not available on any other operating system.
These toggles allow you to disable an apps' access to various parts of your device. 
This includes:
- [Network permission](https://grapheneos.org/features#network-permission-toggle). Disable direct and indirect access to all cellular and WiFi networks.
- [Sensor permissions](https://grapheneos.org/features#sensors-permission-toggle), enables you to zero out all values for the gyroscope, accelerator and more.

One such example is when granting [network permissions](https://grapheneos.org/features#network-permission-toggle) to an app. The toggles let you select: grant zero permissions, only while in use, or one-time only.
And now, some features such as these, are finding their way into other mobile operating systems, Graphene was first to offer this and is completely opensource, and regularly audited. 

Remember, that a large part of GrapheneOS's security model is reducing the attack surface.
They're able to mitigate entire classes of vulnerabilities, such as memory corruption,
which leads to the third part of this review.

**App Permissions Toggles**
![[app-permissions-03.png]]
Permissions menu: example of allowing network permissions to an app.

### What about memory unsafe languages? C/C++
#### [Hardened Malloc](https://github.com/GrapheneOS/hardened_malloc)
**Synopsis**
Hardened malloc is Graphene's custom memory allocator. And is one of the most significant security features offered. The aim of which is preventing memory corruption vulnerabilities.  One of Hardened Malloc's main features is protection against heap corruption vulnerabilities. Another benefit of Hardened Malloc,  is  efficient memory management. It is scale-able by way of a configurable number of independent areas, and the internal locking is within areas that are further divided up in a per size class.

It currently supports [Bionic (Android)](https://android.googlesource.com/platform/bionic/), [musl libc](https://musl.libc.org/) and [GNU libc](https://www.gnu.org/savannah-checkouts/gnu/libc/index.html). 

**Let's first examine a basic example of memory allocation in C**
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    // Allocate memory for an array of 10 integers
    int *arr = (int *)malloc(10 * sizeof(int));
    
    // Check if the memory allocation was successful
    if (arr == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    // Initialize and Use the allocated memory
    for (int i = 0; i < 10; ++i) {
        arr[i] = i * i; // Storing squares of indices in the array
    }

    // Print the values stored in the array
    printf("Array elements:\n");
    for (int i = 0; i < 10; ++i) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    // Deallocate, or "free" the memory
    free(arr);

    return 0;
}
```

### Introduction
-----------------

The **[Hardened Malloc project](https://github.com/GrapheneOS/hardened_malloc/tree/main)** is inspired by, and began as a fresh implementation of OpenBSD malloc. It is based on extending OpenBSD malloc, with various additional security features.

**Goals of Hardened Malloc:**

1. A Security-focused, general purpose memory allocator, that provides the
   malloc API and various extensions.

2. Provide significant hardening against heap corruption vulnerabilities.

3. Create less metadata overhead, and memory waste that would otherwise result from fragmentation than a more traditional allocator design.

4. A Focus on long-term performance and memory usage rather than allocator
   micro-benchmarks.

5. Scalability via a configurable number of completely independent arenas.
   The internal locking occurs within arenas further divided up by a per size class.

6. Currenly supports Bionic (Android),  [musl libc](https://musl.libc.org/) and [GNU libc](https://www.gnu.org/savannah-checkouts/gnu/libc/index.html). 

There are more custom integration and other hardening features in the works.
The glibc support will be limited to replacing the malloc implementation.
musl is a much more robust and cleaner base to build on and can cover the same use cases.

This allocator is intended as a successor to a previous implementation, which was
based on extending OpenBSD malloc, with various additional security features.

####  Harden Malloc and OS integration
On Android-based operating systems, GrapheneOS's hardened_malloc is integrated into the standard C library as the standard malloc implementation. The integration code is able to be used by other Android-based operating systems too. If desired, [jemalloc](https://jemalloc.net/) can be left as a runtime configuration option only. 

### Core Design
-------------------
**Security. Minimalism. Simplicity.**

* Hardened Malloc is Exclusive to 64-bit platforms.

* This enables taking full advantage of the abundant address space, thus eliminating
   the design constraints of 32-bit architecture.

* The mutable allocator state is located solely within a dedicated metadata region.
   This design approach is for slab allocation, both large and small.

* The result is reliable, deterministic protections against invalid free.
   Including: double frees, and  metadata protection from attackers.

* Traditional allocator exploit techniques do not work with the implementation
   of hardened_malloc

*  Small allocations are always located in a large memory regions.

* Once the memory is freed, it is possible to determine that an allocation is one of the
   small size classes from the address range.

* If arenas are enabled, the arena is also determined from the address range, as each
   arena has a dedicated sub-region in the slab allocation.

* Arenas provide complete independent slab allocators with their own allocator state.
   There is no coordination between them.

* Regarding the base region and its relation to the size class.
   This is the part of the allocated slab that has no enabled arenas.
   The address range determines both the base region, and size class.
   The base region is determined first, then the size class.
   Each size class is then divided into a per-sub-region.

* There's a top level slab allocation region, divided up into arenas,
   with each of those divided up into size class regions.

* The size class regions each have a random base within a large guard region.

* Once the size class is determined, the slab size is known, and the index of the slab
   is calculated and used to obtain the slab metadata for the slab from the
   slab metadata array.

* Finally, the index of the slot within the slab provides the index of the bit tracking
   the slot in the bitmap.

* Every slab allocation slot has a dedicated bit in a bitmap tracking
   whether it's free, along with a separate bitmap for tracking allocations in the
   quarantine.

* The slab metadata entries, in the array have intrusive lists threaded throughout
   them. This is to track partial, empty, and free slabs.

* Empty slabs have a limited amount of cached free memory.
   Free slabs are purged / memory protected.

* Large allocations are tracked via a global hash table mapping their address to
   their size and random guard size.

* These are memory mappings that are eventually mapped on allocation, then
   unmapped on free.

* Slab allocations are statically reserved. and thus, large allocations are the
   only dynamic memory mappings made by the allocator.
   This also applies to the allocation of large and small metadata.

* With regards to software development, this memory allocator is intented for
   production use. And not for aiding with finding and fixing of
   memory corruption bugs.

* It does find many latent bugs.
   However, it does not include features such as:
   the option of generating and storing stack traces per allocation, the allocation site
   or their related error messages.

* As mentioned in the introduction, The design choices are based around minimizing overhead and and maximizing security. This often leads to designs that do not include a debugging tool.

* For example, zero-based sanitization on free are used,
   It doe not minimize slack space from size class rounding between the end of an
   allocation, and the canary / guard region.

* While Zero-based filling has the least chance of uncovering latent bugs,
   it does have the best chance of mitigating vulnerabilities.

* The canary feature is primarily intended to act as padding.
   Meaning, it absorbs small overflows,  rendering them harmless.
   Therefore, slack space is helpful, despite not detecting the corruption on free.

* The canary needs detection on free in order to have any hope of stopping other kinds of
   issues like a sequential overflow, which is why it's included.

* It's assumed that an attacker can figure out the allocator is in use,
  so the focus is explicitly not on detecting bugs that are impossible to exploit with it in use
  like an 8 byte overflow.
  

Code snippet from `h_malloc.c`, defining Slab Quarantine
![malloc-slab-01](https://github.com/user-attachments/assets/c4b4abf5-1435-4837-a519-c1615ede3d0e)


`canary` and memory arenas management configuration
![hmalloc-canary-01](https://github.com/user-attachments/assets/c20bf243-2975-4dbd-b8e2-0838a2570230)



`alloc_metadata` function. Managing the allocation of metadata
![hmalloc-02](https://github.com/user-attachments/assets/756f6639-7076-442a-a21a-952fb1b168b2)



### Sources:
---

#### Hardware
- [Titan M2](https://www.androidauthority.com/titan-m2-google-3261547/)
- [Google Pixel](https://safety.google/intl/en_us/pixel/)
#### Android
- [Android Open Source Project](https://source.android.com/)
- [Security Overview](https://source.android.com/docs/security/overview)
- [OS Platform](https://developer.android.com/guide/platform)
- [OS Architecture](https://source.android.com/docs/core/architecture)
- [Security Features](https://source.android.com/docs/security/features)
- [App Sandbox](https://source.android.com/docs/security/app-sandbox)
- [The Android Platform Security Model 2023 pdf](https://arxiv.org/pdf/1904.05572.pdf)  *
- [Verified Boot](https://source.android.com/docs/security/features/verifiedboot)
- [File System Permissions](https://source.android.com/docs/core/permissions/filesystem)
- [SELinux](https://source.android.com/docs/security/features/selinux)
- [Authentication](https://source.android.com/docs/security/features/authentication)
- [Boot-Flow](https://source.android.com/docs/security/features/verifiedboot/boot-flow)
- [SELinux Concepts](https://source.android.com/docs/security/features/selinux/concepts)
#### GrapheneOS
- [GrapheneOS Home Page](https://grapheneos.org/)
- [FAQ](https://grapheneos.org/faq)
- [Source Code](https://github.com/GrapheneOS)
- [Features](https://grapheneos.org/features)
- [Sandboxed Google Play](https://grapheneos.org/usage#sandboxed-google-play)
- [Attestation](https://attestation.app/about)
- [Auditor](https://grapheneos.org/features#auditor)
- [App Domains: Trusted & Untrusted](https://github.com/GrapheneOS/platform_system_sepolicy/blob/14/README.apps.md)
- [Exploit Mitigation](https://grapheneos.org/features#exploit-mitigations)
- [Hardened Malloc: Source Code](https://github.com/GrapheneOS/hardened_malloc)
- [The glibc(GNU C Library) manual](https://sourceware.org/glibc/manual/)
- [Official Documentation: musl libc](https://musl.libc.org/)
- [musl source code](https://github.com/bminor/musl)
### Noteworthy Android apps
- [F-Droid](https://f-droid.org/)
- [Aurora Store](https://github.com/ArielOSProject/AuroraStore)
- [New Pipe](https://github.com/TeamNewPipe/NewPipe/)

#### References from The Android Platform Security Model *
https://arxiv.org/pdf/1904.05572 
pg 17, 4.3
pg 18, 4.3.1
pg 19, 4.3.2
pg 20 & 21, 4.3.1
