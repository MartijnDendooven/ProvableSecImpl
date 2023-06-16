# ProvableSecImpl
Towards provable implementation of security features on small microcontrollers

## Repo structure
The code is divided in multiple branches.

> [openMSP430](https://github.com/MartijnDendooven/ProvableSecImpl/tree/openMSP430) is the source code of the unmodified openMSP430 core (revision 228).
> > [log_mac_dev](https://github.com/MartijnDendooven/ProvableSecImpl/tree/log_mac_dev) contains the memory access control protection using logical addresses. This version has been evaluated in the master's thesis.
> > > [log_mac](https://github.com/MartijnDendooven/ProvableSecImpl/tree/log_mac) solves the know issues that were discovered in [log_mac_dev](https://github.com/MartijnDendooven/ProvableSecImpl/tree/log_mac_dev).
> > 
> > [phy_mac_dev](https://github.com/MartijnDendooven/ProvableSecImpl/tree/phy_mac_dev) contains the memory access control protection using logical addresses. This version has been evaluated in the master's thesis.
> > > [phy_mac](https://github.com/MartijnDendooven/ProvableSecImpl/tree/phy_mac) solves the know issues that were discovered in [phy_mac_dev](https://github.com/MartijnDendooven/ProvableSecImpl/tree/phy_mac_dev).
> > 
> > [irq_dev](https://github.com/MartijnDendooven/ProvableSecImpl/tree/irq_dev) contains the interrupt protection. This version has been evaluated in the master's thesis.
> > > [irq_rtl](https://github.com/MartijnDendooven/ProvableSecImpl/tree/irq_rtl)  allows to simulate the issue regarding RTL verifiction.

## Setup
To run the verification and simulation several tools are required, which can be easily installed.
  ```bash
  $ cd verification-tools/
  verification-tools$ make
  ```
When the tools are ready to use verification and simulation scripts can run from the script folder.
  ```bash
  $ cd scripts/
  ```

This table provides an overview of which scripts are available and how these can be used.
| Script | Usage | Description | Availability |
|------------------|---------------|:-------------:|-------------|
| sim              | `sim <test name> [-v]` |  |  |
| sim_all          | `sim_all` |  |  |
| verif_mac        | `verif_mac [-v]` |  |  |
| verif_sancus_mac | `verif_sancus_mac <branch> [-v]` |  |  |
| verif_irq            |  |  |  |
