# 🏢 Enterprise Network Design & Implementation

[![Cisco](https://img.shields.io/badge/Cisco-Packet_Tracer-blue.svg)](https://www.netacad.com/courses/packet-tracer)
[![CCNA](https://img.shields.io/badge/CCNA-Network_Engineering-brightgreen.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📋 Project Overview

A fully functional **enterprise-scale network infrastructure** designed for **500+ users** implementing a hierarchical three-tier architecture. This project demonstrates advanced networking concepts including dynamic routing protocols (OSPF, EIGRP), route redistribution, high availability, and comprehensive security implementations.

**Built and tested in Cisco Packet Tracer** - showcasing real-world enterprise network design, implementation, and troubleshooting skills.

**📅 Project Timeline:** Master's Capstone Project | January - May 2024 | Campbellsville University

---

## 🌟 Key Features Implemented

### Network Architecture
- **Three-Tier Hierarchical Design**: Core, Distribution, and Access layers
- **9 Network Devices**: 2 Core Switches, 2 Distribution Routers, 5 Access Switches
- **Dual Distribution Blocks**: Dist-4 side and Dist-5 side with different subnets
- **Daisy-Chain Topology**: Switch-8 connected via Switch-3 and Switch-4

### Routing Protocols
- **OSPF Area 0**: Core layer backbone routing
- **EIGRP AS 100**: Distribution layer VLAN routing
- **Route Redistribution**: Bidirectional OSPF ↔ EIGRP redistribution

### High Availability & Redundancy
- **Spanning Tree Protocol (STP)**: Loop prevention with redundant paths
- **Dual Uplinks**: Switch-8 has backup path via Switch-4
- **Dynamic Routing**: Automatic failover through OSPF/EIGRP

### Security Features
- **Port Security**: Max 2 MAC addresses, sticky learning, violation restrict
- **DHCP Snooping**: Prevents rogue DHCP servers
- **Access Control Lists (ACLs)**: HR department restricted from Sales/IT
- **SSH Access**: Secure remote management on all devices
- **Native VLAN 99**: Trunk security

### Network Services
- **DHCP Pools**: Automatic IP assignment for all VLANs (8 pools total)
- **Inter-VLAN Routing**: Full Layer 3 connectivity
- **Loopback Interfaces**: Stable router IDs for OSPF

---

## 🗺️ Network Topology

![Network Topology](screenshots/06-network-topology.png)

```
                         ┌─────────────┐
                         │  Core-Sw1   │
                         │ 10.1.100.1  │
                         └──────┬──────┘
                                │ Gi0/2 (10.0.12.0/24)
                    Gi0/1       │       
               (10.0.14.0/24)   │   ┌─────────────┐
                    │           └───┤  Core-Sw2   │
                    │               │ 10.1.100.2  │
                    │               └──────┬──────┘
                    │                      │ Gi0/1 (10.0.25.0/24)
                    ▼                      ▼
             ┌─────────────┐        ┌─────────────┐
             │   Dist-4    │        │   Dist-5    │
             │ 192.168.x.4 │        │192.168.1x0.5│
             └──────┬──────┘        └──────┬──────┘
                    │                      │
          ┌─────────┼─────────┐    ┌───────┼────────┐
          ▼         ▼         │    ▼       ▼        ▼
     ┌────────┐ ┌────────┐    │ ┌────────┐ ┌────────┐
     │Switch-1│ │Switch-2│    │ │Switch-3│ │Switch-4│
     └────────┘ └────────┘    │ └───┬────┘ └───┬────┘
                              │     │          │
                              │     └────┬─────┘
                              │          ▼
                              │     ┌────────┐
                              │     │Switch-8│ (Daisy-chained)
                              │     └────────┘
```

---

## 📊 IP Addressing Scheme

### Core Layer (Point-to-Point Links)

| Link | Subnet | Device A | Device B |
|------|--------|----------|----------|
| Core-Sw1 ↔ Core-Sw2 | 10.0.12.0/24 | .1 | .2 |
| Core-Sw1 ↔ Dist-4 | 10.0.14.0/24 | .1 | .2 |
| Core-Sw2 ↔ Dist-5 | 10.0.25.0/24 | .1 | .2 |

### Loopback Addresses

| Device | Loopback0 | OSPF Router-ID |
|--------|-----------|----------------|
| Core-Sw1 | 10.1.100.1/32 | 1.1.1.1 |
| Core-Sw2 | 10.1.100.2/32 | 1.1.1.2 |

### VLAN Subnets - Dist-4 Side

| VLAN | Name | Subnet | Gateway |
|------|------|--------|---------|
| 10 | Management | 192.168.10.0/24 | 192.168.10.4 |
| 20 | HR | 192.168.20.0/24 | 192.168.20.4 |
| 30 | Sales | 192.168.30.0/24 | 192.168.30.4 |
| 40 | IT | 192.168.40.0/24 | 192.168.40.4 |
| 99 | Native | 192.168.99.0/24 | 192.168.99.4 |

### VLAN Subnets - Dist-5 Side

| VLAN | Name | Subnet | Gateway |
|------|------|--------|---------|
| 10 | Management | 192.168.110.0/24 | 192.168.110.5 |
| 20 | HR | 192.168.120.0/24 | 192.168.120.5 |
| 30 | Sales | 192.168.130.0/24 | 192.168.130.5 |
| 40 | IT | 192.168.140.0/24 | 192.168.140.5 |
| 99 | Native | 192.168.199.0/24 | 192.168.199.5 |

---

## ✅ Verification & Testing Results

### OSPF Neighbor Verification
![OSPF Verification](screenshots/01-core-sw1-ospf-routes.png)

### DHCP Pools & ACL Configuration
![DHCP and ACL](screenshots/03-dist4-dhcp-pools-acl.png)

### Port Security & DHCP Snooping
![Security Features](screenshots/02-switch1-port-security-dhcp-snooping.png)

### Complete Route Table with Redistribution
![Route Table](screenshots/08-core-sw1-full-verification.png)

---

## 🛠️ Technologies & Protocols Used

| Category | Technologies |
|----------|-------------|
| **Routing** | OSPF Area 0, EIGRP AS 100, Route Redistribution |
| **Switching** | VLANs, Trunking (802.1Q), Native VLAN, STP |
| **Security** | Port Security, DHCP Snooping, ACLs, SSH |
| **Services** | DHCP, Inter-VLAN Routing, Loopback Interfaces |
| **Management** | SSH v2, Console Access |

---

## 📁 Project Structure

```
enterprise-network-project/
├── README.md                    # Project documentation
├── configs/                     # Device configurations
│   ├── core/
│   │   ├── core-sw1.txt
│   │   └── core-sw2.txt
│   ├── distribution/
│   │   ├── dist-4.txt
│   │   └── dist-5.txt
│   └── access/
│       ├── switch-1.txt
│       ├── switch-2.txt
│       ├── switch-3.txt
│       ├── switch-4.txt
│       └── switch-8.txt
├── diagrams/
│   └── network-topology.png
├── docs/
│   ├── implementation-checklist.md
│   └── testing-results.md
├── screenshots/                 # Verification screenshots
│   ├── 01-core-sw1-ospf-routes.png
│   ├── 02-switch1-port-security-dhcp-snooping.png
│   ├── 03-dist4-dhcp-pools-acl.png
│   └── ...
└── enterprise-network.pkt       # Packet Tracer file
```

---

## 🚀 Getting Started

### Prerequisites
- Cisco Packet Tracer 8.2 or later
- Basic understanding of networking concepts

### Quick Start
1. Clone this repository
2. Open `enterprise-network.pkt` in Packet Tracer
3. Explore the topology and configurations
4. Run connectivity tests between VLANs

### Verification Commands

```bash
# OSPF Verification
show ip ospf neighbor
show ip route ospf

# EIGRP Verification  
show ip eigrp neighbors
show ip route eigrp

# Security Verification
show port-security
show ip dhcp snooping
show access-lists

# General Verification
show ip route
show vlan brief
show interfaces trunk
```

---

## 📈 Key Achievements

-
-
- ## 🔧 Challenges & Solutions

### Challenge 1: Route Redistribution Complexity
**Problem:** Ensuring seamless communication between OSPF (core) and EIGRP (distribution) domains without routing loops.

**Solution:** Implemented bidirectional redistribution with proper metric configuration and route filtering to prevent suboptimal paths.

### Challenge 2: Spanning Tree Convergence
**Problem:** Switch-8 daisy-chain topology could cause slow convergence during link failures.

**Solution:** Configured STP priorities, PortFast on access ports, and BPDU Guard to optimize convergence time and prevent topology changes from end devices.

### Challenge 3: VLAN Scalability
**Problem:** Managing 8 separate DHCP pools across two distribution blocks while maintaining consistent security policies.

**Solution:** Standardized VLAN numbering scheme and applied template-based configurations with ACLs consistently across both distribution routers.

✅ **100% Connectivity**: Full cross-network communication verified
- ✅ **Dynamic Routing**: OSPF + EIGRP with successful redistribution
- ✅ **Security Hardened**: Port security, DHCP snooping, ACLs implemented
- ✅ **Redundant Design**: STP providing backup paths
- ✅ **Scalable Architecture**: Easy to add new switches/VLANs

---

## 🎓 Skills Demonstrated

- Enterprise Network Design
- Cisco IOS Configuration
- Dynamic Routing Protocols (OSPF, EIGRP)
- Route Redistribution
- VLAN Configuration & Trunking
- Network Security Implementation
- Troubleshooting & Verification

---

## 👤 Author

**Gopi** - Network Engineer

- CCNA Certified
- CompTIA Network+ Certified
- Master's in Computer Science

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
