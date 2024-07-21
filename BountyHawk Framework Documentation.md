### BountyHawk Framework Documentation

---

### 2. Data Flow Diagram

#### Level 0: Context Diagram
```
+----------------+        +----------------+         +-----------------+
|                |        |                |         |                 |
|    User        |        |    Wildfire    |         |     MongoDB     |
|                |        |                |         |                 |
+-------+--------+        +-------+--------+         +--------+--------+
        |                         |                           |
        |                         v                           |
        |                +--------+--------+                  |
        |                |  Sub-Modules    |                  |
        |                | (Amass, Sublist3r|                  |
        |                |  etc.)          |                  |
        |                +--------+--------+                  |
        |                         |                           |
        |                         v                           |
        +----------------------->+-------------------------->+
```

#### Level 1: Detailed Data Flow
```
+----------------+        +------------------+         +-----------------+
|                |        |                  |         |                 |
|    User        |        |     Wildfire     |         |     MongoDB     |
|                |        |                  |         |                 |
+-------+--------+        +--------+---------+         +--------+--------+
        |                         |                           |
        |        Add Root Domains |                           |
        +-----------------------> +                           |
        |                         v                           |
        |                +--------+---------+                 |
        |                | Sort Domains by  |                 |
        |                | Last Scan Date   |                 |
        |                +--------+---------+                 |
        |                         |                           |
        |                         v                           |
        |                +--------+---------+                 |
        |                |   Scan Domains   |                 |
        |                | (Sub-Modules)    |                 |
        |                +--------+---------+                 |
        |                         |                           |
        |                         v                           |
        |                +--------+---------+                 |
        |                | Parse & Store    |                 |
        |                | Results          |                 |
        |                +--------+---------+                 |
        |                         |                           |
        +-----------------------> +-------------------------->+
```

---

### 3. E-R Model

```
Entities:
1. User
2. Domain
3. Subdomain
4. URL
5. Vulnerability

Relationships:
- User adds Domain
- Domain has Subdomains
- Subdomain contains URLs
- URL has Vulnerabilities

Attributes:
- User: UserID, Username, Email
- Domain: DomainID, DomainName, LastScanned
- Subdomain: SubdomainID, SubdomainName, DomainID
- URL: URLID, URL, SubdomainID
- Vulnerability: VulnID, Description, Severity, URLID

E-R Diagram:
  +---------+                +--------+                 +----------+
  |  User   |                | Domain |                 |Subdomain |
  +----+----+                +----+---+                 +----+-----+
       |                          |                           |
       |                          |                           |
       v                          v                           v
  +----+-----+   has       +------+-----+   has        +------+-----+
  |  Domain  +-------------+ Subdomain  +--------------+    URL      |
  +----+-----+             +------+-----+              +----+-------+
       |                          |                           |
       |                          |                           |
       v                          v                           v
  +----+------+   contains   +----+-----+                 +---+-------+
  |  Subdomain+------------- +   URL    +---------------+  Vulnerability|
  +-----------+              +----------+               +---------------+
```

---

### 4. Architecture Diagram

```
+---------------------------------+
|          User Interface         |
|       (GUI & CLI Options)       |
+---------------------------------+
                 |
                 v
+---------------------------------+
|          Wildfire Module        |
+---------------------------------+
                 |
                 v
+---------------------------------+
|          Sub-Modules            |
| Amass, Sublist3r, Assetfinder,  |
| GetAllUrls, crt.sh, Subfinder,  |
| ShuffleDNS, GoSpider, Nuclei    |
+---------------------------------+
                 |
                 v
+---------------------------------+
|          Local Storage          |
|           (MongoDB)             |
+---------------------------------+
```

---

### 5. Module Description

#### Core Modules

**Wildfire:**

- **Purpose:** Scans multiple target domains to discover hidden subdomains.
- **Process:** 
  1. User adds domains via GUI or CLI.
  2. Domains are sorted by last scan date.
  3. Wildfire runs various sub-modules to scan each domain.
  4. Outputs are stored in MongoDB.
  5. Results are displayed in the GUI once scans are complete.

**Slowburn:**

- **Purpose:** Automatically identifies target domains to scan.
- **Process:** 
  1. Communicates with bug bounty platform APIs to gather target domains.
  2. Populates target list and scans domains using sub-modules.
  3. Outputs are stored in MongoDB.

#### Sub-Modules

**Amass:**

- **Function:** Collects subdomain information.
- **Process:** Runs passive and active enumeration to generate subdomain lists.

**Sublist 3 r:**

- **Function:** Aggregates subdomain information from search engines.
- **Process:** Queries multiple search engines to find subdomains.

**Assetfinder:**

- **Function:** Searches for subdomains using APIs.
- **Process:** Uses various APIs to collect subdomain data.

**GetAllUrls (GAU):**

- **Function:** Collects URLs from historical data sources.
- **Process:** Queries sources like Common Crawl to retrieve URLs.

**GoSpider:**

- **Function:** Crawls target domains to find links and JS files.
- **Process:** Scans domains to uncover internal links and scripts.

**SubDomainizer:**

- **Function:** Scans web pages for subdomains and secrets.
- **Process:** Analyzes web pages and JS files for hidden data.

**crt. Sh:**

- **Function:** Finds subdomains listed in SSL certificates.
- **Process:** Queries Certificate Transparency logs for relevant certificates.

**Subfinder:**

- **Function:** Performs passive subdomain enumeration.
- **Process:** Uses multiple sources to find subdomains.

**ShuffleDNS:**

- **Function:** Brute-forces subdomains using wordlists.
- **Process:** Runs brute-force attacks with massive and custom wordlists.

**Nuclei:**

- **Function:** Scans for vulnerabilities using templates.
- **Process:** Runs predefined templates to identify vulnerabilities.

---

### 6. Pseudo Code

#### Wildfire Module

```python
class Wildfire:
    def __init__(self):
        self.domains = get_domains()
        self.sort_domains_by_last_scan()
    
    def sort_domains_by_last_scan(self):
        self.domains.sort(key=lambda x: x.last_scanned)
    
    def run_scan(self, domain):
        subdomains = self.run_submodules(domain)
        store_in_mongodb(subdomains)
    
    def run_submodules(self, domain):
        submodules = [Amass(), Sublist3r(), Assetfinder(), GAU(), crt.sh(), Subfinder(), ShuffleDNS(), GoSpider(), Nuclei()]
        subdomains = []
        for submodule in submodules:
            subdomains.extend(submodule.run(domain))
        return subdomains
    
    def start(self):
        for domain in self.domains:
            self.run_scan(domain)
```

#### Slowburn Module

```python
class Slowburn:
    def __init__(self):
        self.api_targets = self.fetch_api_targets()
    
    def fetch_api_targets(self):
        return bug_bounty_apis.get_targets()
    
    def run_scan(self):
        while self.api_targets:
            domain = self.api_targets.pop()
            wildfire = Wildfire()
            wildfire.run_scan(domain)

    def initialize(self):
        self.api_targets = self.fetch_api_targets()
        self.run_scan()
```

#### Sub-Modules

**Amass**

```python
class Amass:
    def run(self, domain):
        return run_amass(domain)
    
    def run_amass(domain):
        # Amass command to run
        return parsed_amass_output
```

**Sublist 3 r**

```python
class Sublist3r:
    def run(self, domain):
        return run_sublist3r(domain)
    
    def run_sublist3r(domain):
        # Sublist3r command to run
        return parsed_sublist3r_output
```

**Assetfinder**

```python
class Assetfinder:
    def run(self, domain):
        return run_assetfinder(domain)
    
    def run_assetfinder(domain):
        # Assetfinder command to run
        return parsed_assetfinder_output
```

**GAU**

```python
class GAU:
    def run(self, domain):
        return run_gau(domain)
    
    def run_gau(domain):
        # GAU command to run
        return parsed_gau_output
```

**GoSpider**

```python
class GoSpider:
    def run(self, domain):
        return run_gospider(domain)
    
    def run_gospider(domain):
        # GoSpider command to run
        return parsed_gospider_output
```

**SubDomainizer**

```python
class SubDomainizer:
    def run(self, domain):
        return run_subdomainizer(domain)
    
    def run_subdomainizer(domain):
        # SubDomainizer command to run
        return parsed_subdomainizer_output
```

**crt. Sh**

```python
class Crtsh:
   

 def run(self, domain):
        return run_crtsh(domain)
    
    def run_crtsh(domain):
        # crt.sh command to run
        return parsed_crtsh_output
```

**Subfinder**

```python
class Subfinder:
    def run(self, domain):
        return run_subfinder(domain)
    
    def run_subfinder(domain):
        # Subfinder command to run
        return parsed_subfinder_output
```

**ShuffleDNS**

```python
class ShuffleDNS:
    def run(self, domain):
        return run_shuffledns(domain)
    
    def run_shuffledns(domain):
        # ShuffleDNS command to run
        return parsed_shuffledns_output
```

**Nuclei**

```python
class Nuclei:
    def run(self, domain):
        return run_nuclei(domain)
    
    def run_nuclei(domain):
        # Nuclei command to run
        return parsed_nuclei_output
```

---

### 7. Testing and Implementations

#### Testing Plan

**Unit Testing:**
- Each sub-module will be tested independently to ensure it produces correct and expected results.
- Mock data will be used to simulate API responses and command outputs.

**Integration Testing:**
- Test the integration of sub-modules within Wildfire and Slowburn.
- Verify that the data flows correctly between modules and is stored in MongoDB without data loss or corruption.

**System Testing:**
- Conduct end-to-end tests by running Wildfire and Slowburn on a set of domains.
- Validate that the entire framework works as intended, producing comprehensive reconnaissance data.

**User Acceptance Testing (UAT):**
- Beta testing with a group of security researchers and developers.
- Collect feedback on usability, functionality, and performance.

#### Implementation Steps

1. **Setup MongoDB:**
   - Install and configure MongoDB locally.
   - Create the necessary databases and collections for storing reconnaissance data.

2. **Install Dependencies:**
   - Ensure all required tools (Amass, Sublist 3 r, etc.) are installed and configured.
   - Use a package manager like pip for Python dependencies.

3. **Deploy BountyHawk:**
   - Download the BountyHawk source code.
   - Run the initial setup script to configure the environment.

4. **Run Initial Tests:**
   - Execute unit and integration tests to verify individual module functionality.
   - Perform initial system tests to check overall framework operation.

5. **User Training:**
   - Provide documentation and training materials for users.
   - Conduct training sessions to demonstrate how to use the GUI and CLI.

6. **Feedback and Iteration:**
   - Collect feedback from users during UAT.
   - Implement improvements based on feedback and perform additional testing.

---

This document provides a comprehensive overview of the BountyHawk framework's core modules, including their detailed operations, data collection processes, and testing strategies.