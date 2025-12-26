# Network Design Document

## 1. Executive Summary
This document outlines the architecture for the Enterprise Network Design project. The network is designed to support 500+ users across multiple departments, ensuring high availability, security, and scalability. The design utilizes a hierarchical three-tier model consisting of Core, Distribution, and Access layers.

## 2. Architecture Overview

### 2.1 Hierarchical Model
- **Core Layer (Backbone)**: High-speed switching, routing aggregation. No policies performed here to maximize speed.
- **Distribution Layer**: Routing, filtering (ACLs), WAN access, policy implementation. HSRP/VRRP implemented here.
- **Access Layer**: End-user connectivity, port security, VLAN tagging.

### 2.2 Device Roles
- **Core Switches**: Redundant Layer 3 switches running OSPF.
- **Distribution Routers**: Layer 3 forwarding, inter-VLAN routing, redundant gateways.
- **Access Switches**: Layer 2 connectivity, 802.1Q trunks to distribution.

## 3. Logical Design

### 3.1 VLAN & IP Addressing
| VLAN ID | Name | Subnet | Gateway | Usage |
| :--- | :--- | :--- | :--- | :--- |
| 10 | Management | 10.1.10.0/24 | 10.1.10.1 | Network Devices |
| 20 | HR | 10.1.20.0/24 | 10.1.20.1 | Human Resources |
| 30 | Sales | 10.1.30.0/24 | 10.1.30.1 | Sales Department |
| 40 | IT | 10.1.40.0/24 | 10.1.40.1 | IT Operations |
| 99 | Native | N/A | N/A | Trunk Native VLAN |

### 3.2 Routing Protocols
- **OSPF (Open Shortest Path First)**:
  - Used in the Core and Distribution layers.
  - Area 0 (Backbone) for high-speed transit.
  - MD5 Authentication enabled for security.
- **EIGRP (Enhanced Interior Gateway Routing Protocol)**:
  - Used for edge connectivity to legacy systems or WAN.
- **Redistribution**:
  - Mutual redistribution between OSPF and EIGRP configured at the Distribution layer.

## 4. Redundancy & High Availability

### 4.1 First Hop Redundancy
- **HSRP (Hot Standby Router Protocol)** is configured on Distribution routers.
- **Active/Standby** pairs per VLAN to load balance traffic (VLANs 10,20 on Router A, VLANs 30,40 on Router B).

### 4.2 Link Redundancy
- **EtherChannel (LACP)** configured between Access and Distribution layers to increase bandwidth and provide link failover.

## 5. Security Strategy

- **Port Security**: Max 2 MAC addresses per port, sticky learning enabled.
- **ACLs**:
  - Deny access to HR subnet from Sales.
  - Permit only IT management traffic to Management VLAN.
- **DHCP Snooping**: Prevent rogue DHCP servers on Access ports.
