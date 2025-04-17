<!-- vim-markdown-toc GFM -->

- [Compression and Compaction](#compression-and-compaction)
  - [Explanation](#explanation)
  - [Goals](#goals)
  - [Test Stimulus Compression](#test-stimulus-compression)
    - [Keys](#keys)
    - [Code-Based Schemes](#code-based-schemes)
      - [Explanation](#explanation-1)
      - [Advantages](#advantages)
      - [Disadvantages](#disadvantages)
      - [Dictionary Code (Fixed-to-Fixed)](#dictionary-code-fixed-to-fixed)
        - [Explanation](#explanation-2)
        - [Problems and Solutions](#problems-and-solutions)
        - [Links](#links)
      - [Huffman Code (Fixed-to-Variable)](#huffman-code-fixed-to-variable)
        - [Explanation](#explanation-3)
        - [Problems and Solutions](#problems-and-solutions-1)
        - [Links](#links-1)
      - [Run-Length Code (Variable-to-Fixed)](#run-length-code-variable-to-fixed)
        - [Problems and Solutions](#problems-and-solutions-2)
        - [Links](#links-2)
      - [Golomb Code (Variable-to-Variable)](#golomb-code-variable-to-variable)
        - [Links](#links-3)
    - [Linear-Decompression-Based Schemes](#linear-decompression-based-schemes)
      - [Explanation](#explanation-4)
      - [Problems and Solutions](#problems-and-solutions-3)
      - [Advantages](#advantages-1)
      - [Disadvantages](#disadvantages-1)
      - [Links](#links-4)
      - [Combinational Linear Decompressors](#combinational-linear-decompressors)
        - [Explanation](#explanation-5)
        - [Problems and Solutions](#problems-and-solutions-4)
        - [Links](#links-5)
      - [Fixed-Length Sequential Linear Decompressors](#fixed-length-sequential-linear-decompressors)
        - [Explanation](#explanation-6)
        - [Problems and Solutions](#problems-and-solutions-5)
        - [Links](#links-6)
      - [Variable-Length Sequential Linear Decompressors](#variable-length-sequential-linear-decompressors)
        - [Explanation](#explanation-7)
        - [Problems and Solutions](#problems-and-solutions-6)
        - [Links](#links-7)
      - [Combined Linear and Nonlinear Decompressors](#combined-linear-and-nonlinear-decompressors)
        - [Explanation](#explanation-8)
        - [Problems and Solutions](#problems-and-solutions-7)
        - [Links](#links-8)
    - [Broadcast-Scan-Based Scheme](#broadcast-scan-based-scheme)
      - [Advantages](#advantages-2)
      - [Disadvantages](#disadvantages-2)
      - [Broadcast Scan](#broadcast-scan)
        - [Explanation](#explanation-9)
        - [Links](#links-9)
        - [Problems and Solutions](#problems-and-solutions-8)
      - [Illinois Scan](#illinois-scan)
        - [Explanation](#explanation-10)
        - [Problems and Solutions](#problems-and-solutions-9)
        - [Links](#links-10)
      - [Multiple-Input Broadcast Scan](#multiple-input-broadcast-scan)
        - [Explanation](#explanation-11)
        - [Problems and Solutions](#problems-and-solutions-10)
        - [Links](#links-11)
      - [Reconfigurable Broadcast Scan](#reconfigurable-broadcast-scan)
        - [Explanation](#explanation-12)
        - [Problems and Solutions](#problems-and-solutions-11)
        - [Links](#links-12)
      - [Virtual Scan](#virtual-scan)
        - [Explanation](#explanation-13)
        - [Problems and Solutions](#problems-and-solutions-12)
        - [Links](#links-13)

<!-- vim-markdown-toc -->

## Compression and Compaction

### Explanation

1. Compression is **lossless** for **input stimuli**.
2. Compaction is **lossy** for **output responses**.
3. Its essence is to map multiple vectors into a single vector or shorten the
   length of each vector.

### Goals

1. Reduce test time.
2. Reduce memory usage.
3. Save ATE costs.

### Test Stimulus Compression

#### Keys

1. The number of free variables.
2. The number of specified bits.
3. Encoding efficiency (< 1).
4. Utilization of unspecified bits.
5. Ease of implementation.
6. Availability of a suitable implementation.
7. Reduction in execution time.
8. Controllability of execution time.
9. Decompressor overhead.
10. Suitability of test vectors.
11. Relationship among scan chains.
12. XOR gate = Modulo-2 addition.
13. AND gate = Modulo-2 multiplication.
14. Unencodable test cubes.
15. Bypass.
16. LFSR and MISR.
17. ATPG constraints or virtual circuits.
18. Gating circuits or counters.

#### Code-Based Schemes

##### Explanation

1. Data compression codes **partition the original data into symbols**, and then
   **each symbol is replaced with a codeword** to form the compressed data.
2. Data compression codes can be classified into **four categories (2 × 2)**
   based on **whether the symbols have a fixed or variable size** and **whether
   the codewords have a fixed or variable size.**

##### Advantages

1. The method is **simple**.
2. It can be applied to **any set of test vectors**.

##### Disadvantages

1. **The utilization of unspecified bits** is **low**.
2. The control logic has **a high hardware cost**.
3. **No commercial tools** support it.

##### Dictionary Code (Fixed-to-Fixed)

###### Explanation

1. There are 2^n kinds of symbols, each with a length of n.
2. There are 2^b kinds of codewords, each with a length of b, where n > b.
3. Sdata is a subset of all possible symbols.
4. All symbols in Sdata must occur in test cubes.
5. Sdictionary uses symbols as values and codewords as keys.
6. All symbols in Sdictionary must occur in Sdata.
7. If |Sdata| = |Sdictionary|, then Sdictionary is a complete dictionary.
8. Most symbols in Sdata occur multiple times.
9. b = log2 |Sdata|.

###### Problems and Solutions

1. A drawback of using a complete dictionary [Reddy 2002] is that **the
   dictionary size can become very large**, leading to **excessive overhead**
   for the decompressor.
   - If the dictionary size is 2^b, then the 2^b most frequently occurring
     symbols in the test cubes are placed in the dictionary. Any symbol not in
     the dictionary remains unencoded, and the dictionary is **bypassed**. **An
     extra bit** is added to each codeword to indicate whether or not to use the
     dictionary. In [Li 2003], compressed and uncompressed vectors are mixed.
   - In [Würtenberger 2004], **a partial dictionary** is used along with a
     "correction" network that flips bits to convert a dictionary entry into the
     desired scan slice. By using this correction network, the dictionary size
     can be reduced.

###### Links

1. [Reddy 2002](./On-test-data-volume-reduction-for-multiple-scan-chain-designs.pdf)
2. [Li 2003](./Test-data-compression-using-dictionaries-with-selective-entries-and-fixed-length-indices.pdf)
3. [Würtenberger 2004](./Data-compression-for-multiple-scan-chains-using-dictionaries-with-corrections.pdf)

##### Huffman Code (Fixed-to-Variable)

###### Explanation

1. It is **a statistical coding method** that encodes a symbol into a codeword
   based on its occurrence frequency.
2. To encode all symbols, a Huffman tree is constructed by merging the two
   lowest frequency nodes into one, which represents the combined occurrence
   count.
3. The higher a symbol's occurrence frequency, the shorter its corresponding
   codeword.

###### Problems and Solutions

1. **Synchronization problem**: ATE sends data at a fixed rate, but Huffman
   coding requires a variable rate.
2. Using a full Huffman code that encodes all n-bit symbols requires a decoder
   with 2^(n-1) states:
   - A **selective Huffman code** [Jas 2003] encodes only the k most frequently
     occurring symbols. By selectively encoding only these symbols, the decoder
     requires just n + k states. The X's in the test cubes are filled to
     maximally skew the symbol frequency.
   - A method for **improving compression** by modifying test cubes without
     losing fault coverage is described in [Ichihara 2000]. The goal is to
     modify specified bits in a way that maximally **skews the frequency
     distribution**.

###### Links

1. [Huffman 1952](./A-method-for-the-construction-of-minimum-redundancy-codes.pdf)
2. [Jas 2003](./An-efficient-test-vector-compression-scheme-using-selective-Huffman-coding.pdf)
3. [Ichihara 2000](./Test-transformation-to-improve-compaction-by-statistical-encoding.pdf)

##### Run-Length Code (Variable-to-Fixed)

1. Uses a **cyclical scan architecture** [Jas 1998] to encode symbols with
   variable length.
2. The advantage is that test vectors can be ordered so that similar vectors
   follow each other, **allowing difference vectors to contain many zeros or
   ones**.

###### Problems and Solutions

1. Run-length coding efficiently compresses only **data with an unbalanced
   number of 0s and 1s**.
2. It is suitable only for encoding **consecutive** 0s or 1s.

###### Links

1. [Jas 1998](./Test-vector-compression-via-cyclical-scan-chains-and-its-application-to-testing-core-based-designs.pdf)

##### Golomb Code (Variable-to-Variable)

###### Links

1. [Chandra 2001](./System-on-a-chip-test-data-compression-and-decompression-architectures-based-on-Golomb-codes.pdf)

#### Linear-Decompression-Based Schemes

##### Explanation

1. Another class of test stimulus compression schemes is based on using linear
   decompressors to expand the data from the tester to fill the scan chains.
2. Any decompressor **consisting only of XOR gates and flip-flops is a linear
   decompressor**.
3. Its **characteristic matrix** is an (n × m) matrix that satisfies AX = Z,
   where X is a set of variables and Z is a test vector.
4. Every bit stored on the tester can be considered a **"free variable"** that
   can be assigned any value, 0 or 1.
5. Solving the linear equations can be done using **Gauss–Jordan elimination**
   [Cullen 1997] with a time complexity of **O(mn^2)**.
6. For Boolean matrices, **XOR is used instead of addition, and AND is used
   instead of multiplication**.

##### Problems and Solutions

1. Some test cubes are unencodable.
   - Bypassing the decompressor when applying such test cubes significantly
     degrades overall compression.
   - Rerunning ATPG for unencodable test cubes may yield a different encodable
     test cube.
   - Redesigning the linear decompressor.
2. Encoding a test cube with more specified bits than the number of free
   variables used to encode it is highly unlikely.
   - If the number of free variables exceeds the specified bits by 20, the
     probability of not finding a solution is less than 10 ^ (-6) [Chen
     1986][Konemann 1991].
3. The encoding efficiency, defined as (Specified Bits in Test Set) / (Bits
   Stored on Tester), cannot exceed 1, as solving the linear equations depends
   on the number of specified bits and free variables.

##### Advantages

1. The decoding module is simple to implement.
2. **The linear correlation of the scanning unit is low**.
   - In a circuit, when referring to linear correlation, this problem involves
     gate types. XOR gates and flip-flops are commonly associated with linear
     functions, while AND gates and OR gates introduce nonlinearity.
3. The encoding efficiency is very high.
4. ATPG commercial tools support it.

##### Disadvantages

1. It requires a two-step ATPG process.

##### Links

1. [Cullen 1997](./Linear-Algebra-with-Applications.txt)
2. [Chen 1986](./Linear-dependencies-in-linear-feedback-shift-registers.pdf)
3. [Konemann 1991](./LFSR-coded-test-patterns-for-scan-designs.txt)

##### Combinational Linear Decompressors

###### Explanation

1. The simplest linear decompressors use only combinational XOR networks.
2. Each scan chain is fed by the XOR of some subset of channels from the tester
   [Bayraktaroglu 2001][Bayraktaroglu 2003][Konemann 2003].

###### Problems and Solutions

1. To encode a test cube, the number of free variables must exceed the number of
   specified bits. Consequently, achieving high encoding efficiency (typically
   less than 0.25) is challenging.
   - Dynamically adjusting the number of scan chains loaded per clock cycle
     [Krishna 2003] mitigates this but requires dividing the scan clock into
     multiple domains.

###### Links

1. [Bayraktaroglu 2001](./Test-volume-and-application-time-reduction-through-scan-chain-concealment.pdf)
2. [Bayraktaroglu 2003](./Concurrent-application-of-compaction-and-compression-for-test-time-and-data-volume-reduction-in-scan-designs.pdf)
3. [Konemann 2003](./Real-Time-Decoder-for-Scan-Test-Patterns.pdf)
4. [Krishna 2003](./Adjustable-width-linear-combinational-scan-vector-decompression.pdf)

##### Fixed-Length Sequential Linear Decompressors

###### Explanation

1. Sequential linear decompressors are based on linear finite-state machines,
   such as LFSRs, cellular automata, or ring generators [Mrugalski 2004].
2. They allow free variables from earlier clock cycles to be used when encoding
   a scan slice in the current clock cycle.
3. This provides greater flexibility than combinational decompressors and helps
   avoid worst-case highly specified scan slices limiting overall compression.
4. More flip-flops offer greater flexibility.
5. Encoding efficiency can exceed 0.95 [Krishna 2001][Rajski 2004][Konemann
   2001].

###### Problems and Solutions

1. The complexity of the linear equations grows significantly as each test cube
   depends on all free variables injected up to that point.
   - Resetting the LFSR between test cubes decouples the system of linear
     equations that must be solved when encoding each test cube.
2. Some initial scan slices are heavily specified.
   - Using q clock cycles to preload the LFSR before filling scan chains creates
     a reservoir of free variables to mitigate this issue.
3. Shifting in the same number of free variables for every test cube achieves
   low encoding efficiency.
   - Constraining ATPG to limit the maximum number of specified bits per test
     cube near the average number of specified bits [Rajski 2004] improves
     efficiency.

###### Links

1. [Mrugalski 2004](./Ring-generators-New-devices-for-embedded-test-applications.pdf)
2. [Krishna 2001](./Test-vector-encoding-using-partial-LFSR-reseeding.pdf)
3. [Rajski 2004](./Embedded-deterministic-test.pdf)
4. [Konemann 2001](./A-SmartBIST-variant-with-guaranteed-encoding.pdf)

##### Variable-Length Sequential Linear Decompressors

###### Explanation

1. These decompressors vary the number of free variables used per test cube.
2. They offer better encoding efficiency but require additional control logic
   and control information.
3. [Konemann 2001] and [Volkerink 2003] use an extra channel from the tester to
   gate the scan clock.

###### Problems and Solutions

1. The additional gating channel reduces test compression proportional to the
   total number of channels used.
   - Instead of a gating channel, the first b bits from the tester can specify
     the number of clock cycles used for decompressing a test cube [Krishna
     2004].
2. Increasing the number of flip-flops incurs significant overhead.
   - Configuring scan chains as an LFSR, as suggested in [Rajski 1998], allows
     three-stage linear decompressors [Krishna 2004] to achieve 0.99 encoding
     efficiency without ATPG constraints, though additional scan chain logic is
     required.
3. Linear decompressors efficiently exploit "don't cares" but cannot exploit
   correlations in specified bits, limiting compression.
   - Combining linear and nonlinear decompression achieves higher compression.

###### Links

1. [Konemann 2001](./A-SmartBIST-variant-with-guaranteed-encoding.pdf)
2. [Volkerink 2003](./Efficient-seed-utilization-for-reseeding-based-compression.pdf)
3. [Krishna 2004](./3-stage-variable-length-continuous-flow-scan-vector-decompression-scheme.pdf)
4. [Rajski 1998](./Test-data-decompression-for-multiple-scan-designs-with-boundary-scan.pdf)

##### Combined Linear and Nonlinear Decompressors

###### Explanation

1. A linear decompressor is encoded using a nonlinear code, such as a
   statistical code [Krishna 2002].
2. Dictionary coding is combined with a linear decompressor [Sun 2004].
3. Compatibility relationships between scan chains are leveraged [Li 2005].
4. A statistical code compresses the number of specified bits [Ward 2005].

###### Problems and Solutions

1. In [Li 2005], identifying compatibility relationships between scan chains
   becomes increasingly difficult as scan length and test patterns increase.

###### Links

1. [Krishna 2002](./Reducing-test-data-volume-using-LFSR-reseeding-with-seed-compression.pdf)
2. [Sun 2004](./Combining-dictionary-coding-and-LFSR-reseeding-for-test-data-compression.pdf)
3. [Li 2005](./Efficient-space-or-time-compression-to-reduce-test-data-volume-and-testing-time-for-IP-cores.pdf)
4. [Ward 2005](./Using-statistical-transformations-to-improve-compression-for-linear-decompressors.pdf)

#### Broadcast-Scan-Based Scheme

##### Advantages

1. Utilizes the multi-vector testability of faults.
2. The implementation logic is very simple.
3. Encoding efficiency can be further improved using programmable settings.
4. Single-step ATPG.
5. Supported by commercial ATPG tools.

##### Disadvantages

1. The linear correlation of the scan unit is high.
2. The encoding flexibility is lower than that of the linear equation method.

##### Broadcast Scan

###### Explanation

1. Shares the same pins between different circuits or scan chains.
2. Utilizes unspecified bits to allow more pins to be shared.
3. ATPG tools constrain how multiple similar vectors are generated, or DFT
   designers incorporate a virtual circuit into their designs. [Lee 1998] and
   [Lee 1999].

###### Links

1. [Lee 1998](./Using-a-single-input-to-support-multiple-scan-chains.pdf)
2. [Lee 1999](./Broadcasting-test-patterns-to-multiple-circuits.pdf)

###### Problems and Solutions

1. If broadcast scan is used for multiple scan chains within a single circuit
   where the subcircuits driven by the scan chains are not independent, then the
   ability to detect all faults is lost.
   - Illinois Scan

##### Illinois Scan

###### Explanation

1. The Illinois scan architecture consists of two modes of operation: broadcast
   mode and serial scan mode [Hamzaoglu 1999] and [Hsu 2001].
2. In broadcast mode, each scan chain is divided into multiple subchains called
   segments, and the same vector is shifted into these segments.
3. In serial mode, subchains that depend on the same scan-in pin are stitched
   together again, and the remaining vectors are applied.
4. The additional logic required to implement the Illinois scan architecture
   consists of several multiplexers and simple control logic to switch between
   the two modes.

###### Problems and Solutions

1. The serial scan mode can significantly degrade the overall compression ratio.
   - To reduce the number of patterns applied in serial scan mode,
     multiple-input broadcast scan or reconfigurable broadcast scan can be used.

###### Links

1. [Hamzaoglu 1999](./Reducing-test-application-time-for-full-scan-embedded-cores.pdf)
2. [Hsu 2001](./A-case-study-on-the-implementation-of-Illinois-scan-architecture.pdf)

##### Multiple-Input Broadcast Scan

###### Explanation

1. Multiple channels drive all scan chains. [Shah 2004]
2. The more channels used and the shorter each scan chain, the easier it is to
   detect more faults due to fewer constraints on ATPG.

###### Problems and Solutions

1. Determining a configuration that minimizes the number of channels required to
   detect all detectable faults is highly desirable for multiple-input broadcast
   scan techniques.
2. This method requires a large number of channels to achieve high fault
   coverage.
   - To reduce the required number of channels, a reconfigurable broadcast scan
     method can be used.

###### Links

1. [Shah 2004](./Enhancement-of-the-Illinois-scan-architecture-for-use-with-multiple-scan-inputs.pdf)

##### Reconfigurable Broadcast Scan

###### Explanation

1. Provides the capability to reconfigure the set of scan chains driven by each
   channel.
2. Static reconfiguration [Pandey 2002] [Samaranayake 2003]: A single test
   pattern requires one configuration.
3. Dynamic reconfiguration [Li 2004] [Sitchinava 2004] [Wang 2004] [Han 2005a]:
   A single test pattern requires multiple configurations.

###### Problems and Solutions

1. The drawback of dynamic reconfiguration compared to static reconfiguration is
   that more control information is required to reconfigure at the right time,
   whereas static reconfiguration requires less control information since
   reconfiguration occurs only a few times.

###### Links

1. [Pandey 2002](./Reconfiguration-technique-for-reducing-test-time-and-test-volume-in-Illinois-scan-architecture-based-designs.pdf)
2. [Samaranayake 2003](./A-reconfigurable-shared-scan-in-architecture.pdf)
3. [Li 2004](./Test-set-embedding-for-deterministic-BIST-using-a-reconfigurable-interconnection-network.pdf)
4. [Sitchinava 2004](./Changing-the-scan-enable-during-shift.pdf)
5. [Wang 2004](./VirtualScan-A-new-compressed-scan-technology-for-test-cost-reduction.pdf)
6. [Han 2005a](./Scan-data-volume-reduction-using-periodically-alterable-MUXs-decompressor.pdf)

##### Virtual Scan

###### Explanation

1. The broadcaster consists of gates such as XOR, INV, MUX, and AND/OR... [Wang
   2002] and [Wang 2004].
2. No need to solve linear equations.
3. Dynamic compression can be effectively utilized during ATPG.
4. Minimal fault coverage loss.

###### Problems and Solutions

1. This scheme may impose XOR constraints directly on the original circuit,
   which may result in longer test cube or compressed stimuli generation times
   compared to methods based on solving linear equations.

###### Links

1. [Wang 2002](./Method-and-Apparatus-for-Broadcasting-Scan-Patterns-in-a-Scan-Based-Integrated-Circuit.pdf)
2. [Wang 2004](./VirtualScan-A-new-compressed-scan-technology-for-test-cost-reduction.pdf)
