# Testing Results

## 1. Connectivity Tests

| Source | Destination | Protocol | Expected | Result |
| :--- | :--- | :--- | :--- | :--- |
| HR PC | Sales PC | ICMP | Allow | Pass |
| HR PC | Management SVI | SSH | Deny | Pass (ACL Blocked) |
| IT PC | Management SVI | SSH | Allow | Pass |

## 2. Failover Testing (HSRP)

**Scenario**: Administratively down the primary interface on Dist-Router-1 for VLAN 20.

- **Before Failover**:
  - Active Router: Dist-Router-1
  - Standby Router: Dist-Router-2
- **Action**: `shutdown` interface VLAN 20 on Dist-Router-1.
- **Result**:
  - HSRP State Change noticed in logs.
  - Dist-Router-2 becomes Active.
  - **Ping Loss**: 1 packet lost during transition.
  - **Failover Time**: ~2.5 seconds.

## 3. Routing Convergence

- **Scenario**: Link failure between Core and Distribution.
- **Protocol**: OSPF.
- **Result**: Traffic rerouted via redundant link immediately. Traceroute confirmed new path.

## 4. Throughput Analysis
(Simulated using iPerf)
- Average Access Bandwidth: 940 Mbps
- Core Aggregated Throughput: 8.5 Gbps

## 5. Conclusion
The network meets all design requirements for availability and performance.
