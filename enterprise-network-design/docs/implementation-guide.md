# Implementation Guide

## 1. Pre-Deployment Setup
Before configuring hardware, ensure all connections match the physical topology diagram.

- Console cables ready
- Terminal emulator (Putty/TeraTerm) installed
- IOS Images: c7200-adventerprisek9 (Routers), vios_l2 (Switches)

## 2. Configuration Steps

### Step 1: Core Layer Configuration
1. Configure Hostnames and IP Addresses on interfaces.
2. Enable OSPF Process 1.
3. Configure OSPF Area 0 on links connecting to Distribution layer.

### Step 2: Distribution Layer Configuration
1. configure inter-VLAN routing (Router-on-a-Stick or SVI).
2. Configure HSRP for gateway redundancy.
   ```cisco
   interface vlan 20
    ip address 10.1.20.2 255.255.255.0
    standby 1 ip 10.1.20.1
    standby 1 priority 105
    standby 1 preempt
   ```
3. Configure Route Redistribution.

### Step 3: Access Layer Configuration
1. Create VLANs (10, 20, 30, 40).
2. Configure Trunk ports to Distribution layer.
3. Configure Access ports for end users.
4. Enable Port Security.

### Step 4: Verification
1. Ping from PC in HR to PC in Sales (Should fail if restricted, or pass if allowed).
2. Ping Gateway IPs.
3. Show `ip route` to verify OSPF routes.

## 3. Common Issues & Troubleshooting

- **VLAN Mismatch**: Ensure allowed VLANs match on both sides of the trunk.
- **OSPF Adjacency Internal**: Check Hello/Dead timers and Area IDs.
- **HSRP Flapping**: Check multicast reachability between routers.
